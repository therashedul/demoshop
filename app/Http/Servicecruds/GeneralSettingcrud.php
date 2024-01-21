<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

use Yajra\DataTables\Facades\DataTables;
use App\Models\{
    Account,
    GeneralSetting
};
use \App\Traits\CacheForget;
use \App\Traits\TenantInfo;

class GeneralSettingcrud
{

    use CacheForget;
    use TenantInfo;
  // ========================Ganeral Setting===================


  public function emptyDatabase()
  {

      //clearing all the cached queries
      $this->cacheForget('biller_list');
      $this->cacheForget('brand_list');
      $this->cacheForget('category_list');
      $this->cacheForget('coupon_list');
      $this->cacheForget('customer_list');
      $this->cacheForget('customer_group_list');
      $this->cacheForget('product_list');
      $this->cacheForget('product_list_with_variant');
      $this->cacheForget('warehouse_list');
      $this->cacheForget('tax_list');
      $this->cacheForget('currency');
      $this->cacheForget('general_setting');
      $this->cacheForget('pos_setting');
      $this->cacheForget('user_role');
      $this->cacheForget('permissions');
      $this->cacheForget('role_has_permissions');
      $this->cacheForget('role_has_permissions_list');

      $tables = DB::select('SHOW TABLES');
      $str = 'Tables_in_' . env('DB_DATABASE');
      foreach ($tables as $table) {
          if($table->$str != 'accounts' && $table->$str != 'general_settings' && $table->$str != 'hrm_settings' && $table->$str != 'languages' && $table->$str != 'migrations' && $table->$str != 'password_resets' && $table->$str != 'permissions' && $table->$str != 'pos_setting' && $table->$str != 'roles' && $table->$str != 'role_has_permissions' && $table->$str != 'users' && $table->$str != 'currencies' && $table->$str != 'reward_point_settings') {
              DB::table($table->$str)->truncate();
          }
      }
      return redirect()->back()->with('message', 'Database cleared successfully');
  }

  public function ganeralsettingindex($request)
  {
      // dd("kk");
      $lims_general_setting_data = GeneralSetting::latest()->first();
      $lims_account_list = Account::where('is_active', true)->get();
      // $lims_currency_list = Currency::get();
      $zones_array = array();
      $timestamp = time();
      foreach (timezone_identifiers_list() as $key => $zone) {
          date_default_timezone_set($zone);
          $zones_array[$key]['zone'] = $zone;
          $zones_array[$key]['diff_from_GMT'] = 'UTC/GMT ' . date('P', $timestamp);
      }
      return view('superadmin.setting.general_setting', compact('lims_general_setting_data', 'lims_account_list', 'zones_array'));



  }
  public function ganeralsettingstore( $request)
  {

      // print_r($request->all());
      // die();
      // if (!env('USER_VERIFIED')) {
      //     return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');
      // }

      // $this->validate($request, [
      //     'site_logo' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
      // ]);

      $data = $request->except('site_logo');
      //writting timezone info in .env file
      $path = '.env';
      $searchArray = array('APP_TIMEZONE=' . env('APP_TIMEZONE'));
      $replaceArray = array('APP_TIMEZONE=' . $data['timezone']);
      //    return $replaceArray;

      file_put_contents($path, str_replace($searchArray, $replaceArray, file_get_contents($path)));

      if (isset($data['is_rtl']))
          $data['is_rtl'] = true;
      else
          $data['is_rtl'] = false;

      $general_setting = GeneralSetting::latest()->first();
      if (!empty($general_setting)) {
          $general_setting->id = 1;
          $general_setting->site_title = $data['site_title'];
          $general_setting->is_rtl = $data['is_rtl'];
          // $general_setting->currency = $data['currency'];
          // $general_setting->currency_position = $data['currency_position'];
          $general_setting->staff_access = $data['staff_access'];
          $general_setting->company_name = $data['company_name'];
          $general_setting->vat_registration_number = $data['vat_registration_number'];
          $general_setting->date_format = $data['date_format'];
          $general_setting->developed_by = $data['developed_by'];
          $general_setting->invoice_format = $data['invoice_format'];
          $general_setting->state = $data['state'];
          $logo = $request->site_logo;
          if ($logo) {
              $ext = pathinfo($logo->getClientOriginalName(), PATHINFO_EXTENSION);
              $logoName = date("Ymdhis") . '.' . $ext;
              $logo->move('public/logo', $logoName);
              $general_setting->site_logo = $logoName;
          }
      } else {
          $general_setting = new GeneralSetting();
          $general_setting->id = 1;
          $general_setting->site_title = $data['site_title'];
          $general_setting->company_name = $data['company_name'];
          $general_setting->is_rtl = $data['is_rtl'];
          // $general_setting->currency = $data['currency'];
          // $general_setting->currency_position = $data['currency_position'];
          $general_setting->staff_access = $data['staff_access'];
          $general_setting->invoice_format = $data['invoice_format'];
          $general_setting->date_format = $data['date_format'];
          $general_setting->vat_registration_number = $data['vat_registration_number'];
          $general_setting->developed_by = $data['developed_by'];
          $general_setting->state = $data['state'];

          $logo = $request->site_logo;
          if ($logo) {
              $ext = pathinfo($logo->getClientOriginalName(), PATHINFO_EXTENSION);
              $logoName = date("Ymdhis") . '.' . $ext;
              $logo->move('public/logo', $logoName);
              $general_setting->site_logo = $logoName;
          }
      }
      $general_setting->save();
      return redirect()->back()->with('message', 'Data updated successfully');
  }

  public function smsSetting()
  {
      return view('superadmin.setting.sms_setting');
  }
  public function smsSettingStore(Request $request)
    {
        if(!env('USER_VERIFIED'))
            return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');

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

  public function sendSms(Request $request)
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

  public function superadminGeneralSetting()
  {
      $lims_general_setting_data = GeneralSetting::latest()->first();
      return view('superadmin.superadmin_setting', compact('lims_general_setting_data'));
  }

  public function superadminGeneralSettingStore(Request $request)
  {
      if(!env('USER_VERIFIED'))
          return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');

      $this->validate($request, [
          'site_logo' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
          'og_image' => 'image|mimes:jpg,jpeg,png|max:100000',
      ]);

      $data = $request->except('site_logo');
      //return $data;
      if(isset($data['is_rtl']))
          $data['is_rtl'] = true;
      else
          $data['is_rtl'] = false;

      $general_setting = GeneralSetting::latest()->first();
      $general_setting->id = 1;
      $general_setting->site_title = $data['site_title'];
      $general_setting->is_rtl = $data['is_rtl'];
      $general_setting->phone = $data['phone'];
      $general_setting->email = $data['email'];
      $general_setting->free_trial_limit = $data['free_trial_limit'];
      $general_setting->date_format = $data['date_format'];
      $general_setting->dedicated_ip = $data['dedicated_ip'];
      $general_setting->currency = $data['currency'];
      $general_setting->developed_by = $data['developed_by'];
      $logo = $request->site_logo;
      $general_setting->meta_title = $data['meta_title'];
      $general_setting->meta_description = $data['meta_description'];
      $general_setting->og_title = $data['og_title'];
      $general_setting->og_description = $data['og_description'];
      $general_setting->chat_script = $data['chat_script'];
      $general_setting->ga_script = $data['ga_script'];
      $general_setting->fb_pixel_script = $data['fb_pixel_script'];
      $general_setting->active_payment_gateway = implode(",", $data['active_payment_gateway']);
      $general_setting->stripe_public_key = $data['stripe_public_key'];
      $general_setting->stripe_secret_key = $data['stripe_secret_key'];
      $general_setting->paypal_client_id = $data['paypal_client_id'];
      $general_setting->paypal_client_secret = $data['paypal_client_secret'];
      $general_setting->razorpay_number = $data['razorpay_number'];
      $general_setting->razorpay_key = $data['razorpay_key'];
      $general_setting->razorpay_secret = $data['razorpay_secret'];
      $og_image = $request->og_image;
      if ($logo) {
          $this->fileDelete('landlord/images/logo/', $general_setting->site_logo);

          $ext = pathinfo($logo->getClientOriginalName(), PATHINFO_EXTENSION);
          $logoName = date("Ymdhis") . '.' . $ext;
          $logo->move('public/landlord/images/logo', $logoName);
          $general_setting->site_logo = $logoName;
      }
      if ($og_image) {
          $this->fileDelete('landlord/images/og-image/', $general_setting->og_image);

          $ext = pathinfo($og_image->getClientOriginalName(), PATHINFO_EXTENSION);
          $og_image_name = date("Ymdhis") . '.' . $ext;
          $og_image->move('public/landlord/images/og-image/', $og_image_name);
          $general_setting->og_image = $og_image_name;
      }
      $this->cacheForget('general_setting');
      $general_setting->save();
      return redirect()->back()->with('message', 'Data updated successfully');
  }

  public function superadminMailSetting()
  {
      $mail_setting_data = MailSetting::latest()->first();
      return view('landlord.mail_setting', compact('mail_setting_data'));
  }

  public function superadminMailSettingStore(Request $request)
  {
      if(!env('USER_VERIFIED'))
          return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');

      $data = $request->all();
      $mail_setting = MailSetting::latest()->first();
      if(!$mail_setting)
          $mail_setting = new MailSetting;
      $mail_setting->driver = $data['driver'];
      $mail_setting->host = $data['host'];
      $mail_setting->port = $data['port'];
      $mail_setting->from_address = $data['from_address'];
      $mail_setting->from_name = $data['from_name'];
      $mail_setting->username = $data['username'];
      $mail_setting->password = $data['password'];
      $mail_setting->encryption = $data['encryption'];
      $mail_setting->save();
      return redirect()->back()->with('message', 'Data updated successfully');
  }

  public function changeTheme($theme)
  {

      $lims_general_setting_data = GeneralSetting::latest()->first();
      $lims_general_setting_data->theme = $theme;
      $lims_general_setting_data->save();
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
