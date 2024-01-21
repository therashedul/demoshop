<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use DB;
use Hash;
use Auth;
use Session;
use App\Models\User;
use App\Models\UserVerify;
use Str;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Controller;

class CustomAuthController extends Controller
{ 
    /**
     * Write code on Method
     *
     * @return response()
     */
    public function index(){
        if(!Auth::check()){            
            return view('auth.login');
        } 
        return redirect("dashboard")->withSuccess('Great! You have Successfully loggedin'); 
        // return view('home');
        // return redirect("login")->withSuccess('Opps! You do not have access');
        
    }      
    public function customHome(){
        return view('home');
    }
    /**
     * Write code on Method
     *
     * @return response()
     */
    public function registration(){
        return view('auth.register');
    }      
    /**
     * Write code on Method
     *
     * @return response()
     */
    public function customLogin(Request $request)    {
        if($request->isMethod('post')){
            $request->validate([
                'email' => 'required|string',
                'password' => 'required|string',
                'g-recaptcha-response' => 'required|captcha',
                ]);
                $remember_me = $request->has('remember') ? true : false; // get remember value
                $credentials = $request->only('email', 'password');          
                $users = DB::table('users')
                    ->select('*')
                    ->where([
                        ['email','=',$request->input('email')],
                        ['is_email_verified','=','1'],
                    ])
                    ->get();
            // print_r($users[0]->status_id);
            // die();
        
                    foreach($users as $user){
                        $status =  $user->status_id;
                    // ================= Start remember 
                        if($request->remember===null){
                            setcookie('login_email',$request->email,100);
                            setcookie('login_pass',$request->password,100);
                        }
                        else{
                            setcookie('login_email',$request->email,time()+60*60*24*100);
                            setcookie('login_pass',$request->password,time()+60*60*24*100);
                        }
                    //   End remember
                           //  End remember
                                                    if($status==1){
                                                        if($user->role_id == 1){
                                                            if (Auth::attempt($credentials, $remember_me)) {  
                                                                $user  = User::where('email', $request->email)->first();
                                                                $access_token = $user->createToken($request->email)->accessToken;
                                                                User::where('email', $request->email)->update(['access_token' => $access_token]);
                                                                Session::put('user_session', $request->email);
                                                                Session::put('pass_session', $request->password);                           
                                                                return redirect()->intended(route('home'))
                                                                ->withSuccess('Signed in');
                                                            }
                                                        }                                                    
                                                        else{
                                                            return redirect("login")->with('error','Your Role ID is not match');
                                                        }
                                                    }else{
                                                        return redirect("login")->with('error', 'Your account is suspended, or account inactive, please contact Admin.');
                                                    }
                                                    // End if  status 
                        // End if  status 
                    }                     
                    return redirect("login")->with('error','You are not logged in or Your session has expired');
        }
        // END if
    }
    

    public function customRegistration(Request $request){
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
        ]);

        $data = $request->all();
        $createUser = $this->create($data);

        $token = Str::random(64);
        $id = $createUser->id;
        $email = $createUser->email;

        UserVerify::create([
            'user_id' => $createUser->id, 
            'token' => $token
            ]);
            $user['to']= $request->email;
            Mail::send('email.emailVerificationEmail', ["token" => $token],  function($message) use($user){
                $message->to( $user['to']);
                $message->subject('Email Verification Mail');
            });
        return view('verify', compact('id','email')); 
    }

    public function verificationResend($id){   
        $user = User::where('id',$id)->first();
        $token = Str::random(64);
            UserVerify::create([
            'user_id' => $user->id, 
            'token' => $token
            ]);
            $userto['to']= $user->email;
            $email = $user->email;
        if ($user->is_email_verified == ''){
                Mail::send('email.emailVerificationEmail', ["token" => $token],  function($message) use($userto){
                $message->to( $userto['to']);
                $message->subject('Email Verification Mail');
            });
            $message = ('We just sent you the verification link at your email ('.$user->email.') again, please check it.');
            return view('verify', compact('id','email','message'));
        }
        else {
            return redirect('/')->withErrors(array('message' => 'Your Email is already active, please contact us at info@islamicda.com if you have any problem.'));
        }
    }
    /**
     * Write code on Method
     *
     * @return response()
     */
    public function create(array $data)
    {
      return User::create([
        'name' => $data['name'],
        'email' => $data['email'],
        'password' => Hash::make($data['password']),
        'role_id' => '3',
        'status_id' =>'1',
      ]);
    }      

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function verifyAccount($token)
    {
        $verifyUser = UserVerify::where('token', $token)->first();  
        $message = 'Sorry your email cannot be identified.';  
             if(!is_null($verifyUser) ){
                   $userId = $verifyUser->user_id; 
                   $user = DB::table('users')->where('id','=',$userId )->first();
                  if(empty($user->is_email_verified)) {
                    $verifyUser->user->is_email_verified = 1;
                    $verifyUser->user->save();
                    $message = "Your e-mail is verified. You can now login.";
                } else {
                    $message = "Your e-mail is already verified. You can now login.";
                  
                  }
           
         }
   
        return redirect("login")->with('success', $message);
}


    /**
     * Write code on Method
     *
     * @return response()
     */
  
   
    
    /**
     * Write code on Method
     *
     * @return response()
     */
    public function dashboard(){
        
        if(Auth::check()){
            return view('home');
        }  
        return redirect("login")->withSuccess('Opps! You do not have access');
    }    

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function signOut() {
        Session::flush();
        Auth::logout();  
        return Redirect('/');
    }

    /**
     * Write code on Method
     *
     * @return response()
     */  
}