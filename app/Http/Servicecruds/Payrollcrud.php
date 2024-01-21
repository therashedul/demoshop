<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use \Illuminate\Support\Facades\Auth;

use App\Models\{
    Payroll,
    Employee,
    Account
};
use Yajra\DataTables\Facades\DataTables;

class Payrollcrud
{
    public function payrollindex()
    {

        $lims_account_list = Account::where('is_active', true)->get();
        $lims_employee_list = Employee::where('is_active', true)->get();
        $general_setting = DB::table('general_settings')->latest()->first();
        if (Auth::user()->role_id > 2 && $general_setting->staff_access == 'own')
            $lims_payroll_all = Payroll::orderBy('id', 'desc')->where('user_id', Auth::id())->get();
        else
            $lims_payroll_all = Payroll::orderBy('id', 'desc')->get();

        return view('superadmin.payroll.index', compact('lims_account_list', 'lims_employee_list', 'lims_payroll_all'));

    }


    public function payrollStore( $request)
    {
        $data = $request->all();
        $data['reference_no'] = 'payroll-' . date("Ymd") . '-' . date("his");
        $data['user_id'] = Auth::id();
        Payroll::create($data);
        $message = 'Payroll creared succesfully';
        //collecting mail data
        $lims_employee_data = Employee::find($data['employee_id']);
        $mail_data['reference_no'] = $data['reference_no'];
        $mail_data['amount'] = $data['amount'];
        $mail_data['name'] = $lims_employee_data->name;
        $mail_data['email'] = $lims_employee_data->email;
        try {
            Mail::send('mail.payroll_details', $mail_data, function ($message) use ($mail_data) {
                $message->to($mail_data['email'])->subject('Payroll Details');
            });
        } catch (\Exception $e) {
            $message = ' Payroll created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
        }

        return redirect('superAdmin/payroll')->with('message', $message);
    }


    public function payrollUpdate( $request)
    {
        $data = $request->all();
        $lims_payroll_data = Payroll::find($data['payroll_id']);
        $lims_payroll_data->update($data);
        return redirect('superAdmin/payroll')->with('message', 'Payroll updated succesfully');
    }

    public function deleteBySelectionPayroll( $request)
    {
        $payroll_id = $request['payrollIdArray'];
        foreach ($payroll_id as $id) {
            $lims_payroll_data = Payroll::find($id);
            $lims_payroll_data->delete();
        }
        return 'Payroll deleted successfully!';
    }

    public function payrolldestroy($id)
    {
        $lims_payroll_data = Payroll::find($id);
        $lims_payroll_data->delete();
        return redirect('superAdmin/payroll')->with('not_permitted', 'Payroll deleted succesfully');
    }
}
