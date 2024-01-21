<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\Account;
use App\Models\MoneyTransfer;
use Yajra\DataTables\Facades\DataTables;

class MoneyTransfercrud
{
    public function moneyTransfersindex()
    {
        $lims_money_transfer_all = MoneyTransfer::get();
        $lims_account_list = Account::where('is_active', true)->get();
        return view('superadmin.money_transfer.index', compact('lims_money_transfer_all', 'lims_account_list'));
    }

    public function moneyTransfersStore( $request)
    {
        $data = $request->all();
        $data['reference_no'] = 'mtr-' . date("Ymd") . '-' . date("his");
        MoneyTransfer::create($data);
        return redirect()->back()->with('message', 'Money transfered successfully');
    }


    public function moneyTransfersupdate( $request)
    {
        $data = $request->all();
        MoneyTransfer::find($data['id'])->update($data);
        return redirect()->back()->with('message', 'Money transfer updated successfully');
    }

    public function moneyTransfersdestroy($id)
    {
        MoneyTransfer::find($id)->delete();
        return redirect()->back()->with('not_permitted', 'Data deleted successfully');
    }
}