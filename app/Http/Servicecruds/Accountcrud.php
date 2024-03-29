<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use \Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

use App\Models\{
    Account,
    ReturnPurchase,
    Returns,
    Payment,
    MoneyTransfer,
    Payroll,
    Expense
};

class Accountcrud
{

    public function accountsindex()
    {

        $lims_account_all = Account::where('is_active', true)->get();
        return view('superadmin.account.index', compact('lims_account_all'));

    }
    public function accountsStore( $request)
    {
        $lims_account_data = Account::where('is_active', true)->first();
        $data = $request->all();
        if ($data['initial_balance'])
            $data['total_balance'] = $data['initial_balance'];
        else
            $data['total_balance'] = 0;
        if (!$lims_account_data)
            $data['is_default'] = 1;
        $data['is_active'] = true;
        Account::create($data);
        return redirect('superAdmin/accounts')->with('message', 'Account created successfully');
    }

    public function makeDefault($id)
    {
        $lims_account_data = Account::where('is_default', true)->first();
        $lims_account_data->is_default = false;
        $lims_account_data->save();

        $lims_account_data = Account::find($id);
        $lims_account_data->is_default = true;
        $lims_account_data->save();

        return 'Account set as default successfully';
    }
    public function accountsUpdate( $request)
    {
        $data = $request->all();
        $lims_account_data = Account::find($data['account_id']);
        if ($data['initial_balance'])
            $data['total_balance'] = $data['initial_balance'];
        else
            $data['total_balance'] = 0;
        $lims_account_data->update($data);
        return redirect('superAdmin/accounts')->with('message', 'Account updated successfully');
    }

    public function balanceSheet()
    {
        $lims_account_list = Account::where('is_active', true)->get();
        $debit = [];
        $credit = [];
        foreach ($lims_account_list as $account) {
            $payment_recieved = Payment::whereNotNull('sale_id')->where('account_id', $account->id)->sum('amount');
            $payment_sent = Payment::whereNotNull('purchase_id')->where('account_id', $account->id)->sum('amount');
            $returns = DB::table('returns')->where('account_id', $account->id)->sum('grand_total');
            $return_purchase = DB::table('return_purchases')->where('account_id', $account->id)->sum('grand_total');
            $expenses = DB::table('expenses')->where('account_id', $account->id)->sum('amount');
            $payrolls = DB::table('payrolls')->where('account_id', $account->id)->sum('amount');
            $sent_money_via_transfer = MoneyTransfer::where('from_account_id', $account->id)->sum('amount');
            $recieved_money_via_transfer = MoneyTransfer::where('to_account_id', $account->id)->sum('amount');

            $credit[] = $payment_recieved + $return_purchase + $recieved_money_via_transfer + $account->initial_balance;
            $debit[] = $payment_sent + $returns + $expenses + $payrolls + $sent_money_via_transfer;

            /*$credit[] = $payment_recieved + $return_purchase + $account->initial_balance;
            $debit[] = $payment_sent + $returns + $expenses + $payrolls;*/
        }
        return view('superadmin.account.balance_sheet', compact('lims_account_list', 'debit', 'credit'));

    }

    public function accountStatement($request)
    {
        $data = $request->all();
        //return $data;
        $lims_account_data = Account::find($data['account_id']);
        $credit_list = new Collection;
        $debit_list = new Collection;
        $expense_list = new Collection;
        $return_list = new Collection;
        $purchase_return_list = new Collection;
        $payroll_list = new Collection;
        $recieved_money_transfer_list = new Collection;
        $sent_money_transfer_list = new Collection;

        if ($data['type'] == '0' || $data['type'] == '2') {
            $credit_list = Payment::whereNotNull('sale_id')
                ->where('account_id', $data['account_id'])
                ->whereDate('created_at', '>=', $data['start_date'])
                ->whereDate('created_at', '<=', $data['end_date'])
                ->select('payment_reference as reference_no', 'sale_id', 'amount', 'created_at')
                ->get();

            $recieved_money_transfer_list = MoneyTransfer::where('to_account_id', $data['account_id'])
                ->whereDate('created_at', '>=', $data['start_date'])
                ->whereDate('created_at', '<=', $data['end_date'])
                ->select('reference_no', 'to_account_id', 'amount', 'created_at')
                ->get();
            $purchase_return_list = ReturnPurchase::where('account_id', $data['account_id'])
                ->whereDate('created_at', '>=', $data['start_date'])
                ->whereDate('created_at', '<=', $data['end_date'])
                ->select('reference_no', 'grand_total as amount', 'created_at')
                ->get();
        }
        if ($data['type'] == '0' || $data['type'] == '1') {
            $debit_list = Payment::whereNotNull('purchase_id')
                ->where('account_id', $data['account_id'])
                ->whereDate('created_at', '>=', $data['start_date'])
                ->whereDate('created_at', '<=', $data['end_date'])
                ->select('payment_reference as reference_no', 'purchase_id', 'amount', 'created_at')
                ->get();
            $expense_list = Expense::where('account_id', $data['account_id'])
                ->whereDate('created_at', '>=', $data['start_date'])
                ->whereDate('created_at', '<=', $data['end_date'])
                ->select('reference_no', 'amount', 'created_at')
                ->get();
            $return_list = Returns::where('account_id', $data['account_id'])
                ->whereDate('created_at', '>=', $data['start_date'])
                ->whereDate('created_at', '<=', $data['end_date'])
                ->select('reference_no', 'grand_total as amount', 'created_at')
                ->get();
            $payroll_list = Payroll::where('account_id', $data['account_id'])
                ->whereDate('created_at', '>=', $data['start_date'])
                ->whereDate('created_at', '<=', $data['end_date'])
                ->select('reference_no', 'amount', 'created_at')
                ->get();
            $sent_money_transfer_list = MoneyTransfer::where('from_account_id', $data['account_id'])
                ->whereDate('created_at', '>=', $data['start_date'])
                ->whereDate('created_at', '<=', $data['end_date'])
                ->select('reference_no', 'to_account_id', 'amount', 'created_at')
                ->get();
        }
        $all_transaction_list = new Collection;
        $all_transaction_list = $credit_list->concat($recieved_money_transfer_list)
            ->concat($debit_list)
            ->concat($expense_list)
            ->concat($return_list)
            ->concat($purchase_return_list)
            ->concat($payroll_list)
            ->concat($sent_money_transfer_list)
            ->sortByDesc('created_at');
        $balance = 0;
        return view('superadmin.account.account_statement', compact('lims_account_data', 'all_transaction_list', 'balance'));
    }

    public function accountsdestroy($id)
    {

        $lims_account_data = Account::find($id);
        if (!$lims_account_data->is_default) {
            $lims_account_data->is_active = false;
            $lims_account_data->save();
            return redirect('superAdmin/accounts')->with('not_permitted', 'Account deleted successfully!');
        }

        return redirect('superAdmin/accounts')->with('not_permitted', 'Please make another account default first!');
    }
}
