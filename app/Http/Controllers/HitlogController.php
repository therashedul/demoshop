<?php

namespace App\Http\Controllers;

use DB;
use App\Models\Hitlog;
use App\Models\Blacklist;
use Illuminate\Http\Request;
use Illuminate\Routing\Route;
use App\Http\Servicecruds\Mobile_Detect;





class HitlogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function device_browser( $browser = FALSE ) {
                $u_agent = $_SERVER['HTTP_USER_AGENT'];
                $bname = 'Unknown';
                $platform = 'Unknown';
                $version = "";

                if (preg_match('/linux/i', $u_agent)) {
                    $platform = 'linux';
                } elseif (preg_match('/macintosh|mac os x/i', $u_agent)) {
                    $platform = 'mac';
                } elseif (preg_match('/windows|win32/i', $u_agent)) {
                    $platform = 'windows';
                }

                if (preg_match('/MSIE/i', $u_agent) && !preg_match('/Opera/i', $u_agent)) {
                    $bname = 'Internet Explorer';
                    $ub = "MSIE";
                } elseif (preg_match('/Firefox/i', $u_agent)) {
                    $bname = 'Mozilla Firefox';
                    $ub = "Firefox";
                } elseif (preg_match('/Chrome/i', $u_agent)) {
                    $bname = 'Google Chrome';
                    $ub = "Chrome";
                } elseif (preg_match('/Safari/i', $u_agent)) {
                    $bname = 'Apple Safari';
                    $ub = "Safari";
                } elseif (preg_match('/Opera/i', $u_agent)) {
                    $bname = 'Opera';
                    $ub = "Opera";
                } elseif (preg_match('/Netscape/i', $u_agent)) {
                    $bname = 'Netscape';
                    $ub = "Netscape";
                }

                $known = array('Version', $ub, 'other');
                $pattern = '#(?<browser>' . join('|', $known) .
                        ')[/ ]+(?<version>[0-9.|a-zA-Z.]*)#';
                if (!preg_match_all($pattern, $u_agent, $matches)) {

                }

                $i = count($matches['browser']);
                if ($i != 1) {
                    if (strripos($u_agent, "Version") < strripos($u_agent, $ub)) {
                        $version = $matches['version'][0];
                    } else {
                        $version = $matches['version'][1];
                    }
                } else {
                    $version = $matches['version'][0];
                }
                if ($version == null || $version == "") {
                    $version = "?";
                }

                if( $browser )
                {
                    return $bname.$version;
                }
                else
                {
                    return array(
                        'userAgent' => $u_agent,
                        'name' => $bname,
                        'version' => $version,
                        'platform' => $platform,
                        'pattern' => $pattern
                    );
                }     
    }

    function get_msisdn() {

        $msisdn = "";

        if (request()->hasHeader('HTTP_X_UP_CALLING_LINE_ID')) {
            $msisdn = trim(request()->header('HTTP_X_UP_CALLING_LINE_ID'));
        } elseif (request()->hasHeader('HTTP_X_HTS_CLID')) {
            $msisdn = trim(request()->header('HTTP_X_HTS_CLID'));
        } elseif (request()->hasHeader('HTTP_MSISDN')) {
            $msisdn = trim(request()->header('HTTP_MSISDN'));
        } elseif (request()->hasCookie('User-Identity-Forward-msisdn')) {
            $msisdn = request()->cookie('User-Identity-Forward-msisdn');
        } elseif (request()->hasHeader('HTTP_X_MSISDN')) {
            $msisdn = request()->header('HTTP_X_MSISDN');
        }
        return $msisdn;

        // $msisdn = "";
        // if (isset($_SERVER['HTTP_X_UP_CALLING_LINE_ID'])) {
        //     $msisdn = trim($_SERVER['HTTP_X_UP_CALLING_LINE_ID']);
        // } else if (isset($_SERVER['HTTP_X_HTS_CLID'])) {
        //     $msisdn = trim($_SERVER['HTTP_X_HTS_CLID']);
        // } else if (isset($_SERVER['HTTP_MSISDN'])) {
        //     $msisdn = trim($_SERVER['HTTP_MSISDN']);
        // } else if (isset($_COOKIE['User-Identity-Forward-msisdn'])) {
        //     $msisdn = $_COOKIE['User-Identity-Forward-msisdn'];
        // } else if (isset($_SERVER["HTTP_X_MSISDN"])) {
        //     $msisdn = $_SERVER["HTTP_X_MSISDN"];
        // }
        // // set cookie
        // setcookie('msisdn', $msisdn, time() + (86400 * 30), "/"); // 86400 = 1 day
        // return $msisdn;
// ----------------------------------------

		// $msisdn = "";
		// if (isset($_SERVER['HTTP_X_UP_CALLING_LINE_ID'])) {
        //     $msisdn = trim($_SERVER['HTTP_X_UP_CALLING_LINE_ID']);
        // } else if (isset($_SERVER['HTTP_X_HTS_CLID'])) {
        //     $msisdn = trim($_SERVER['HTTP_X_HTS_CLID']);
        // } else if (isset($_SERVER['HTTP_MSISDN'])) {
        //     $msisdn = trim($_SERVER['HTTP_MSISDN']);
        // } else if (isset($_COOKIE['User-Identity-Forward-msisdn'])) {
        //     $msisdn = $_COOKIE['User-Identity-Forward-msisdn'];
        // } else if (isset($_SERVER["HTTP_X_MSISDN"])) {
        //     $msisdn = $_SERVER["HTTP_X_MSISDN"];
        // }
        // header("Refresh:1;");
        // return $msisdn;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getIp(){        
        foreach (array('HTTP_CLIENT_IP', 'HTTP_X_FORWARDED_FOR', 'HTTP_X_FORWARDED', 'HTTP_X_CLUSTER_CLIENT_IP', 'HTTP_FORWARDED_FOR', 'HTTP_FORWARDED', 'REMOTE_ADDR') as $key){
            if (array_key_exists($key, $_SERVER) === true){
                foreach (explode(',', $_SERVER[$key]) as $ip){
                    $ip = trim($ip); // just to be safe
                    if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE) !== false){
                        return $ip;
                    }
                }
            }
         }
     return request()->ip(); // it will return server ip when no client ip found
    }

   public function is_mobile() {
        if ( empty( $_SERVER['HTTP_USER_AGENT'] ) ) {
            $is_mobile = false;
        } elseif ( strpos( $_SERVER['HTTP_USER_AGENT'], 'Mobile' ) !== false // many mobile devices (all iPhone, iPad, etc.)
            || strpos( $_SERVER['HTTP_USER_AGENT'], 'Android' ) !== false
            || strpos( $_SERVER['HTTP_USER_AGENT'], 'Silk/' ) !== false
            || strpos( $_SERVER['HTTP_USER_AGENT'], 'Kindle' ) !== false
            || strpos( $_SERVER['HTTP_USER_AGENT'], 'BlackBerry' ) !== false
            || strpos( $_SERVER['HTTP_USER_AGENT'], 'Opera Mini' ) !== false
            || strpos( $_SERVER['HTTP_USER_AGENT'], 'Opera Mobi' ) !== false ) {
                $is_mobile = "Mobile";
        } else {
            $is_mobile = "Desktop";
        }
        return $is_mobile;
    }
    public function index(Request $request)
    {   
        $this->timespent($request);
        return view('welcome');
    }
    // public function getDevice(){
    //     $str = $_SERVER['HTTP_USER_AGENT'];
    //     $pos1 = strpos($str, '(')+1;
    //     $pos2 = strpos($str, ')')-$pos1;
    //     $part = substr($str, $pos1, $pos2);
    //     $parts = explode(" ", $part);
    //     print_r($parts);
    //     echo $parts[0].' '.$parts[1].' '.$parts[3].''.$parts[4];

    // }
    public function timespent(Request $request){  
            $pageName =  \Route::current()->action['as'];
            $link  = $request->fullUrl();
            $HitLogData =  new Hitlog ([ 
                    'ip' => $this->getIp(),
                    'view'=> $pageName,
                    'link'=> $link,
                    'browser' => $this->device_browser($browser = TRUE),
                    // 'spent_time' =>$time,
                ]);
                $HitLogData->save();   
            $blackId = DB::table('blacklists')->latest('id')->first();
            if($blackId == ''){
                $black =  new Blacklist ([ 
                    'ip' => "::2"
                ]);
                $black->save();
            } 
            return array(
                'HitLogData' => $HitLogData,
                'blackId' => $blackId,
                // 'time' => $time
            );
            //  return response()->json($time);     
        }

    public function processDeviceSize(Request $request)
    {
            $width = $request->input('width', 'N/A');
            $height = $request->input('height', 'N/A');
            // Process the data as needed (e.g., store it in the database)
            return response()->json(['message' => 'Data received successfully']);
    }
    public function sitehit(){   
        $platform='';
        $os='';
        $str = $_SERVER['HTTP_USER_AGENT'];
        $pos1 = strpos($str, '(')+1;
        $pos2 = strpos($str, ')')-$pos1;
        $part = substr($str, $pos1, $pos2);
        $parts = explode(" ", $part);
        
        // https://github.com/machal/mobile-detect-testing/tree/master
        // https://www.codexworld.com/mobile-device-detection-in-php/
        // https://techbriefers.com/how-to-detect-mobile-device-in-php/

        $deviceDitect  = new Mobile_Detect;   
        //  ------------------------------
        if($deviceDitect->isMobile()){ 
            // Detect mobile/tablet  
            if($deviceDitect->isTablet()){                 
                $platform = "Tablet";
            }else{ 
                $platform .= "Mobile";
            } 
            // Detect platform 
            if($deviceDitect->isiOS()){ 
                $os = "iOS";
            }elseif($deviceDitect->isAndroidOS()){ 
                $os .= "Android";
            } else{
                $os .= "Windows";
            }
        }else{ 
            $platform .= "Desktop";
        }
        // -------------------------------

        $browser  = $this->device_browser($browser = TRUE);
        $Ip       = $this->getIp();
        $mobile       = $this->get_msisdn();
        $is_mobile       = $this->is_mobile();
        $pageName =  \Route::current()->action['as'];
        $link = url()->current();
            $HitLogData =  new Hitlog ([ 
                    'ip' => $Ip,
                    'view'=> $pageName,
                    'link'=> $link,
                    'mobile_number' => $mobile,
                    'device' => $platform,
                    'device_os' => $os,
                    'brand' => $parts[0],
                    'model' => $parts[3],
                    'width' => "Null",
                    'height' => 'Null',
                    'browser' => $browser,
                ]);
			$HitLogData->save();
            return $HitLogData;
    }
    public function sitehit_old(){   
        $platform='';
        $os='';
        $str = $_SERVER['HTTP_USER_AGENT'];
        $pos1 = strpos($str, '(')+1;
        $pos2 = strpos($str, ')')-$pos1;
        $part = substr($str, $pos1, $pos2);
        $parts = explode(" ", $part);

         // Check if the "mobile" word exists in User-Agent 
         $isMob = is_numeric(strpos(strtolower($_SERVER["HTTP_USER_AGENT"]), "mobile")); 
        
         // Check if the "tablet" word exists in User-Agent 
         $isTab = is_numeric(strpos(strtolower($_SERVER["HTTP_USER_AGENT"]), "tablet")); 
         
         // Platform check  
         $isWin = is_numeric(strpos(strtolower($_SERVER["HTTP_USER_AGENT"]), "windows")); 
         $isAndroid = is_numeric(strpos(strtolower($_SERVER["HTTP_USER_AGENT"]), "android")); 
         $isIPhone = is_numeric(strpos(strtolower($_SERVER["HTTP_USER_AGENT"]), "iphone")); 
         $isIPad = is_numeric(strpos(strtolower($_SERVER["HTTP_USER_AGENT"]), "ipad")); 
         $isIOS = $isIPhone || $isIPad; 
         
         if($isMob){ 
             if($isTab){         
                 $platform = "Tablet ";
             }else{                 
                 $platform .= "Mobile ";
             } 
         }else{ 
             $platform .= "Desktop ";
         } 
        //  --------------------------
         if($isIOS){  
             $os = "iOS";
         }elseif($isAndroid){ 
             $os .= "ANDROID";
         }elseif($isWin){ 
             $os .= "WINDOWS";
         }
        
        // -------------------------------

        $browser  = $this->device_browser($browser = TRUE);
        $Ip       = $this->getIp();
        $mobile       = $this->get_msisdn();
        $is_mobile       = $this->is_mobile();
        $pageName =  \Route::current()->action['as'];
        $link = url()->current();
            $HitLogData =  new Hitlog ([ 
                    'ip' => $Ip,
                    'view'=> $pageName,
                    'link'=> $link,
                    'mobile_number' => $mobile,
                    'device' => $platform,
                    'device_os' => $os,
                    'brand' => $parts[1],
                    'model' => $parts[3],
                    'width' => "",
                    'height' => '',
                    'browser' => $browser,
                ]);
			$HitLogData->save();
            return $HitLogData;
    }

}