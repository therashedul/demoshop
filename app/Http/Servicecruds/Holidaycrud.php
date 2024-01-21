<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use \Illuminate\Support\Facades\Auth;
use App\Models\{
    GeneralSetting,
    Holiday
};
use Yajra\DataTables\Facades\DataTables;

class Holidaycrud
{
    public function holidaysCountindex()
    {
        $approve_permission = true;
        $lims_holiday_list = Holiday::orderBy('id', 'desc')->get();
        return view('superadmin.holiday.index', compact('lims_holiday_list', 'approve_permission'));
    }


    public function holidaysCountStore($request)
    {
        $data = [
            'from_date' => date("Y-m-d", strtotime(str_replace("/", "-", $request->input('from_date')))),
            'to_date' => date("Y-m-d", strtotime(str_replace("/", "-", $request->input('to_date')))),
            'is_approved' => '0',
            'user_id' => Auth::id(),
            'note' => $request->input('note')
        ];
        Holiday::create($data);
        return redirect()->back()->with('message', "Holiday created successfully");
    }

    public function approveHoliday($id)
    {
        $holiday = Holiday::find($id);
        $holiday->is_approved = true;
        $holiday->save();

        $mail_data['name'] = $holiday->user->name;
        $mail_data['email'] = $holiday->user->email;

        try {
            Mail::send('mail.holiday_approve', $mail_data, function ($message) use ($mail_data) {
                $message->to($mail_data['email'])->subject('Holiday Approved');
            });
        } catch (\Exception $e) {
            return 'Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
        }
    }

    public function myHoliday($year, $month)
    {
        $start = 1;
        $number_of_day = cal_days_in_month(CAL_GREGORIAN, $month, $year);
        while ($start <= $number_of_day) {
            if ($start < 10)
                $date = $year . '-' . $month . '-0' . $start;
            else
                $date = $year . '-' . $month . '-' . $start;
            $holiday_found = Holiday::whereDate('from_date', '<=', $date)
                ->whereDate('to_date', '>=', $date)
                ->where([
                    ['is_approved', true],
                    ['user_id', Auth::id()]
                ])->first();
            if ($holiday_found) {
                $general_setting = GeneralSetting::select('date_format')->latest()->first();
                $holidays[$start] = date($general_setting->date_format, strtotime($holiday_found->from_date)) . ' ' . trans("To") . ' ' . date($general_setting->date_format, strtotime($holiday_found->to_date));
            } else {
                $holidays[$start] = false;
            }
            $start++;
        }
        //return dd($holidays);
        $start_day = date('w', strtotime($year . '-' . $month . '-01')) + 1;
        $prev_year = date('Y', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $prev_month = date('m', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $next_year = date('Y', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $next_month = date('m', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        return view('superadmin.holiday.my_holiday', compact('start_day', 'year', 'month', 'number_of_day', 'prev_year', 'prev_month', 'next_year', 'next_month', 'holidays'));
    }

    public function holidaysCountUpdate( $request)
    {
        $holiday_data = Holiday::find($request->input('id'));
        $data = [
            'from_date' => date("Y-m-d", strtotime(str_replace("/", "-", $request->input('from_date')))),
            'to_date' => date("Y-m-d", strtotime(str_replace("/", "-", $request->input('to_date')))),
            'note' => $request->input('note')
        ];
        $holiday_data->update($data);
        return redirect()->back()->with('message', "Holiday updated successfully");
    }

    public function deleteBySelectionHoliday( $request)
    {
        $holiday_id = $request['holidayIdArray'];
        foreach ($holiday_id as $id) {
            $lims_holiday_data = Holiday::find($id);
            $lims_holiday_data->delete();
        }
        return 'Holiday deleted successfully!';
    }

    public function holidaysCountdestroy($id)
    {
        Holiday::find($id)->delete();
        return redirect()->back()->with('not_prmitted', "Holiday deleted successfully");
    }
}