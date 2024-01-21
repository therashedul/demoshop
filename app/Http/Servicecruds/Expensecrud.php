<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use \Illuminate\Support\Facades\Auth;
use App\Models\{
    Account,
    Warehouse,
    CashRegister,
    Expense,
    ExpenseCategory
};
use Yajra\DataTables\Facades\DataTables;

class Expensecrud
{
    //====================================== Expense Category================================
    public function expenseCategoriesIngindex()
    {
        $lims_expense_category_all = ExpenseCategory::where('is_active', true)->get();
        return view('superadmin.expense_category.index', compact('lims_expense_category_all'));
    }

    public function expensegenerateCode()
    {

        // Available alpha caracters
        $characters = '0123456789';

        // generate a pin based on 2 * 7 digits + a random character
        $pin = mt_rand(1000, 9999)
            . mt_rand(1000, 9999)
            . $characters[rand(0, strlen($characters) - 1)];

        // shuffle the result
        $string = str_shuffle($pin);
        return $string;
        // $id = Keygen::numeric(8)->generate();
        // return $id;
    }

    public function expenseCategoriesstore($request)
    {
        // $this->validate($request, [
        //     'code' => [
        //         'max:255',
        //             Rule::unique('expense_categories')->where(function ($query) {
        //             return $query->where('is_active', 1);
        //         }),
        //     ]
        // ]);

        $data = $request->all();
        ExpenseCategory::create($data);
        return redirect('superAdmin/expense_categories')->with('message', 'Data inserted successfully');
    }
    public function expenseCategoriesEdit($id)
    {
        $lims_expense_category_data = ExpenseCategory::find($id);
        return $lims_expense_category_data;
    }

    public function expenseCategoriesUpdate($request)
    {
        // $this->validate($request, [
        //     'code' => [
        //         'max:255',
        //             Rule::unique('expense_categories')->ignore($request->expense_category_id)->where(function ($query) {
        //             return $query->where('is_active', 1);
        //         }),
        //     ]
        // ]);

        $data = $request->all();
        $lims_expense_category_data = ExpenseCategory::find($data['expense_category_id']);
        $lims_expense_category_data->update($data);
        return redirect('superAdmin/expense_categories')->with('message', 'Data updated successfully');
    }

    public function expenseCategoriesImport($request)
    {
        //get file
        $upload = $request->file('file');
        $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
        if ($ext != 'csv')
            return redirect()->back()->with('not_permitted', 'Please upload a CSV file');
        $filename = $upload->getClientOriginalName();
        $filePath = $upload->getRealPath();
        //open and read
        $file = fopen($filePath, 'r');
        $header = fgetcsv($file);
        $escapedHeader = [];
        //validate
        foreach ($header as $key => $value) {
            $lheader = strtolower($value);
            $escapedItem = preg_replace('/[^a-z]/', '', $lheader);
            array_push($escapedHeader, $escapedItem);
        }
        //looping through othe columns
        while ($columns = fgetcsv($file)) {
            if ($columns[0] == "")
                continue;
            foreach ($columns as $key => $value) {
                $value = preg_replace('/\D/', '', $value);
            }
            $data = array_combine($escapedHeader, $columns);
            $expense_category = ExpenseCategory::firstOrNew(['code' => $data['code'], 'is_active' => true]);
            $expense_category->code = $data['code'];
            $expense_category->name = $data['name'];
            $expense_category->is_active = true;
            $expense_category->save();
        }
        return redirect('superAdmin/expense_categories')->with('message', 'ExpenseCategory imported successfully');
    }

    public function deleteBySelection($request)
    {
        $expense_category_id = $request['expense_categoryIdArray'];
        foreach ($expense_category_id as $id) {
            $lims_expense_category_data = ExpenseCategory::find($id);
            $lims_expense_category_data->is_active = false;
            $lims_expense_category_data->save();
        }
        return 'Expense Category deleted successfully!';
    }

    public function expenseCategoriesDestroy($id)
    {
        $lims_expense_category_data = ExpenseCategory::find($id);
        $lims_expense_category_data->is_active = false;
        $lims_expense_category_data->save();
        return redirect('superAdmin/expense_categories')->with('not_permitted', 'Data deleted successfully');
    }
// ======================== Expense ===================   
public function expenseIngindex( $request)
{
    if ($request->ajax()) {
        $expenses = Expense::latest()->get();
        return Datatables::of($expenses)
            ->addIndexColumn()

            ->addColumn('date', function ($row) {
                $date = date('d-M-Y', strtotime($row->created_at));
                return $date;
            })
            ->addColumn('warehouse', function ($row) {
                $warehouse = $row->warehouse->name;
                return $warehouse;
            })
            ->addColumn('expenseCategory', function ($row) {
                $expenseCategory = $row->expenseCategory->name;
                return $expenseCategory;
            })
            ->addColumn('amount', function ($row) {
                $amount = number_format($row->amount, 2);
                return $amount;
            })



            ->addColumn('action', function ($row) {

                // Update Button 
                $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                  data-toggle="modal"
                  data-target="#ajaxModelexa"
                  data-id="' . $row->id . '" 
                  data-date="' . date('Y-m-d', strtotime($row->created_at)) . '" 
                  data-reference_no="' . $row->reference_no . '" 
                  data-warehouse="' . $row->warehouse->id . '" 
                  data-expense_category="' . $row->expenseCategory->id . '" 
                  data-amount="' . $row->amount . '" 
                  data-note="' . $row->note . '" 
          
                  data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editexpenses "> <i class="fas fa-edit"></i> <span> Edit</span></a>';


                // Delete Button
                $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-id="' . $row->id . '" 
                            data-original-title="Delete" class="btn btn-link  deleteexpense"><i class="fa fa-trash"></i> ' . trans('Delete') . '</a>';


                return $updateButton . " " . $deleteButton;
            })
            ->escapeColumns([])
            // ->rawColumns(['action','status'])
            ->make(true);
    }

    if ($request->starting_date) {
        $starting_date = $request->starting_date;
        $ending_date = $request->ending_date;
    } else {
        $starting_date = date('Y-m-01', strtotime('-1 year', strtotime(date('Y-m-d'))));
        $ending_date = date("Y-m-d");
    }

    if ($request->input('warehouse_id'))
        $warehouse_id = $request->input('warehouse_id');
    else
        $warehouse_id = 0;

    $lims_warehouse_list = Warehouse::select('name', 'id')->where('is_active', true)->get();
    $lims_account_list = Account::where('is_active', true)->get();
    $lims_expenseCategory_list = ExpenseCategory::where('is_active', true)->get();
    return view('superadmin.expense.index', compact('lims_account_list', 'lims_expenseCategory_list', 'lims_warehouse_list', 'starting_date', 'ending_date', 'warehouse_id'));

}

public function expensesstore( $request)
{
    $data = $request->all();
    if (isset($data['created_at']))
        $data['created_at'] = date("Y-m-d H:i:s", strtotime($data['created_at']));
    else
        $data['created_at'] = date("Y-m-d H:i:s");
    $data['reference_no'] = 'er-' . date("Ymd") . '-' . date("his");
    $data['user_id'] = Auth::id();
    $cash_register_data = CashRegister::where([
        ['user_id', $data['user_id']],
        ['warehouse_id', $data['warehouse_id']],
        ['status', true]
    ])->first();
    if ($cash_register_data)
        $data['cash_register_id'] = $cash_register_data->id;
    Expense::create($data);
    return redirect('superAdmin/expenses')->with('message', 'Data inserted successfully');
}



public function expensesedit($id)
{
    $lims_expense_data = Expense::find($id);
    $lims_expense_data->date = date('d-m-Y', strtotime($lims_expense_data->created_at->toDateString()));
    return $lims_expense_data;

}

public function expensesupdate($request)
{


    $data = $request->all();
    $lims_expense_data = Expense::find($data['expense_id']);
    $data['created_at'] = date("Y-m-d", strtotime($data['created_at']));
    $lims_expense_data->update($data);
    return redirect('superAdmin/expenses')->with('message', 'Data updated successfully');
}

// public function deleteBySelection(Request $request)
// {
//     $expense_id = $request['expenseIdArray'];
//     foreach ($expense_id as $id) {
//         $lims_expense_data = Expense::find($id);
//         $lims_expense_data->delete();
//     }
//     return 'Expense deleted successfully!';
// }

public function expensesdestroy($id)
{
    $lims_expense_data = Expense::find($id);
    $lims_expense_data->delete();
    return redirect('superAdmin/expenses')->with('not_permitted', 'Data deleted successfully');
}
}