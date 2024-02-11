<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Mail;

use Yajra\DataTables\Facades\DataTables;
use App\Models\{
    Account,
    GeneralSetting
};
use \App\Traits\CacheForget;
use \App\Traits\TenantInfo;

class SuperAdmincrud
{
    use CacheForget;
    use TenantInfo;

    public function superadminGeneralSetting()
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
      return view('superadmin.setting.superadmin_setting', compact('lims_general_setting_data', 'lims_account_list', 'zones_array'));
    }

    public function superadminGeneralSettingStore( $request)
    {
        // $this->validate($request, [
        //     'site_logo' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
        //     'og_image' => 'image|mimes:jpg,jpeg,png|max:100000',
        // ]);
        $data = $request->except('site_logo');
        // return $data;
        if(isset($data['is_rtl']))
            $data['is_rtl'] = true;
        else
            $data['is_rtl'] = false;
        $general_setting = GeneralSetting::latest()->first();
        if (!empty($general_setting)) {
            $general_setting->id = 1;
            if(isset($data['is_zatca'])) {
                $general_setting->is_zatca = true;
            }
            else{
                $general_setting->is_zatca = false;
            }
            $general_setting->site_title = $data['site_title'];
            $general_setting->is_rtl = $data['is_rtl'];
            $general_setting->phone = $data['phone'];
            $general_setting->company_name = $data['company_name'];
            $general_setting->email = $data['email'];
            $general_setting->free_trial_limit = $data['free_trial_limit'];
            $general_setting->date_format = $data['date_format'];
            $general_setting->expiry_date = $data['expiry_date'];
            $general_setting->without_stock = $data['without_stock'];
            $general_setting->staff_access = $data['staff_access'];
            $general_setting->state = $data['state'];
            $general_setting->staff_access = $data['staff_access'];
            $general_setting->currency_position = $data['currency_position'];
            $general_setting->invoice_format = $data['invoice_format'];
            // $general_setting->dedicated_ip = $data['dedicated_ip'];
            // $general_setting->currency = $data['currency'];
            $general_setting->developed_by = $data['developed_by'];
            $logo = $request->site_logo;
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
            if(isset($data['is_zatca'])) {
                $general_setting->is_zatca = true;
            }
            else{
                $general_setting->is_zatca = false;
            }
            $general_setting->site_title = $data['site_title'];
            $general_setting->is_rtl = $data['is_rtl'];
            $general_setting->phone = $data['phone'];
            $general_setting->company_name = $data['company_name'];
            $general_setting->email = $data['email'];
            $general_setting->free_trial_limit = $data['free_trial_limit'];
            $general_setting->date_format = $data['date_format'];
            $general_setting->expiry_date = $data['expiry_date'];
            $general_setting->without_stock = $data['without_stock'];
            $general_setting->state = $data['state'];
            $general_setting->staff_access = $data['staff_access'];
            $general_setting->currency_position = $data['currency_position'];
            $general_setting->invoice_format = $data['invoice_format'];
            // $general_setting->dedicated_ip = $data['dedicated_ip'];
            // $general_setting->currency = $data['currency'];
            $general_setting->developed_by = $data['developed_by'];
            $logo = $request->site_logo;
            $logo = $request->site_logo;
            if ($logo) {
                $ext = pathinfo($logo->getClientOriginalName(), PATHINFO_EXTENSION);
                $logoName = date("Ymdhis") . '.' . $ext;
                $logo->move('public/logo', $logoName);
                $general_setting->site_logo = $logoName;
            }
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

    public function superadminMailSettingStore( $request)
    {

        // $data = $request->all();
        // $mail_setting = MailSetting::latest()->first();
        // if(!$mail_setting)
        //     $mail_setting = new MailSetting;
        // $mail_setting->driver = $data['driver'];
        // $mail_setting->host = $data['host'];
        // $mail_setting->port = $data['port'];
        // $mail_setting->from_address = $data['from_address'];
        // $mail_setting->from_name = $data['from_name'];
        // $mail_setting->username = $data['username'];
        // $mail_setting->password = $data['password'];
        // $mail_setting->encryption = $data['encryption'];
        // $mail_setting->save();
        // return redirect()->back()->with('message', 'Data updated successfully');
    }

}
