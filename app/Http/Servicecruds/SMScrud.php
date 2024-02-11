<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Mail;
use ZipArchive;

use App\Models\{
    Customer,
    Client
};
class SMScrud
{

    public function smsSetting()
    {
        return view('superadmin.setting.sms_setting');
    }
    public function smsSettingStore($request)
      {

          $data = $request->all();
          //writting bulksms info in .env file
          $path = app()->environmentFilePath();
          if($data['gateway'] == 'twilio'){
              $searchArray = array('SMS_GATEWAY='.env('SMS_GATEWAY'), 'ACCOUNT_SID='.env('ACCOUNT_SID'), 'AUTH_TOKEN='.env('AUTH_TOKEN'), 'Twilio_Number='.env('Twilio_Number') );

              $replaceArray = array('SMS_GATEWAY='.$data['gateway'], 'ACCOUNT_SID='.$data['account_sid'], 'AUTH_TOKEN='.$data['auth_token'], 'Twilio_Number='.$data['twilio_number'] );
          }
          else{
              $searchArray = array( 'SMS_GATEWAY='.env('SMS_GATEWAY'), 'CLICKATELL_API_KEY='.env('CLICKATELL_API_KEY') );
              $replaceArray = array( 'SMS_GATEWAY='.$data['gateway'], 'CLICKATELL_API_KEY='.$data['api_key'] );
          }

          file_put_contents($path, str_replace($searchArray, $replaceArray, file_get_contents($path)));
          return redirect()->back()->with('message', 'Data updated successfully');
      }
    public function createSms()
    {
        $lims_customer_list = Customer::where('is_active', true)->get();
        return view('superadmin.setting.create_sms', compact('lims_customer_list'));
    }

    public function sendSms( $request)
    {
        $data = $request->all();
        $numbers = explode(",", $data['mobile']);

        if( env('SMS_GATEWAY') == 'twilio') {
            $account_sid = env('ACCOUNT_SID');
            $auth_token = env('AUTH_TOKEN');
            $twilio_phone_number = env('Twilio_Number');
            try{
                $client = new Client($account_sid, $auth_token);
                foreach ($numbers as $number) {
                    $client->messages->create(
                        $number,
                        array(
                            "from" => $twilio_phone_number,
                            "body" => $data['message']
                        )
                    );
                }
            }
            catch(\Exception $e){
                //return $e;
                return redirect()->back()->with('not_permitted', 'Please setup your <a href="sms_setting">SMS Setting</a> to send SMS.');
            }
            $message = "SMS sent successfully";
        }
        elseif( env('SMS_GATEWAY') == 'clickatell') {
            try {
                $clickatell = new \Clickatell\Rest(env('CLICKATELL_API_KEY'));
                foreach ($numbers as $number) {
                    $result = $clickatell->sendMessage(['to' => [$number], 'content' => $data['message']]);
                }
            }
            catch (ClickatellException $e) {
                return redirect()->back()->with('not_permitted', 'Please setup your <a href="sms_setting">SMS Setting</a> to send SMS.');
            }
            $message = "SMS sent successfully";
        }
        else
            return redirect()->back()->with('not_permitted', 'Please setup your <a href="sms_setting">SMS Setting</a> to send SMS.');
        return redirect()->back()->with('message', $message);
    }

    public function backup()
    {
        // Database configuration
        $host = env('DB_HOST');
        $username = env('DB_USERNAME');
        $password = env('DB_PASSWORD');
        $database_name = env('DB_DATABASE');
        // Get connection object and set the charset
        $conn = mysqli_connect($host, $username, $password, $database_name);
        $conn->set_charset("utf8");


        // Get All Table Names From the Database
        $tables = array();
        $sql = "SHOW TABLES";
        $result = mysqli_query($conn, $sql);

        while ($row = mysqli_fetch_row($result)) {
            $tables[] = $row[0];
        }

        $sqlScript = "";
        foreach ($tables as $table) {

            // Prepare SQLscript for creating table structure
            $query = "SHOW CREATE TABLE $table";
            $result = mysqli_query($conn, $query);
            $row = mysqli_fetch_row($result);

            $sqlScript .= "\n\n" . $row[1] . ";\n\n";


            $query = "SELECT * FROM $table";
            $result = mysqli_query($conn, $query);

            $columnCount = mysqli_num_fields($result);

            // Prepare SQLscript for dumping data for each table
            for ($i = 0; $i < $columnCount; $i ++) {
                while ($row = mysqli_fetch_row($result)) {
                    $sqlScript .= "INSERT INTO $table VALUES(";
                    for ($j = 0; $j < $columnCount; $j ++) {
                        $row[$j] = $row[$j];

                        if (isset($row[$j])) {
                            $sqlScript .= '"' . $row[$j] . '"';
                        } else {
                            $sqlScript .= '""';
                        }
                        if ($j < ($columnCount - 1)) {
                            $sqlScript .= ',';
                        }
                    }
                    $sqlScript .= ");\n";
                }
            }

            $sqlScript .= "\n";
        }

        if(!empty($sqlScript))
        {
            // Save the SQL script to a backup file
            $backup_file_name = public_path().'/'.$database_name . '_backup_' . time() . '.sql';
            //return $backup_file_name;
            $fileHandler = fopen($backup_file_name, 'w+');
            $number_of_lines = fwrite($fileHandler, $sqlScript);
            fclose($fileHandler);

            $zip = new ZipArchive();
            $zipFileName = $database_name . '_backup_' . time() . '.zip';
            $zip->open(public_path() . '/' . $zipFileName, ZipArchive::CREATE);
            $zip->addFile($backup_file_name, $database_name . '_backup_' . time() . '.sql');
            $zip->close();

            // Download the SQL backup file to the browser
            /*header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename=' . basename($backup_file_name));
            header('Content-Transfer-Encoding: binary');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($backup_file_name));
            ob_clean();
            flush();
            readfile($backup_file_name);
            exec('rm ' . $backup_file_name); */
        }
        return redirect('public/' . $zipFileName);
    }

}
