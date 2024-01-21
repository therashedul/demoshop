<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\{
    Warehouse,
    Biller,
    Employee,
    Department
};
use Yajra\DataTables\Facades\DataTables;

class Employeecrud
{
    public function employeesindex()
    {
        $lims_employee_all = Employee::where('is_active', true)->get();
        $lims_department_list = Department::where('is_active', true)->get();
        return view('superadmin.employee.index', compact('lims_employee_all', 'lims_department_list', ));
    }

    public function employeesCreate()
    {
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_biller_list = Biller::where('is_active', true)->get();
        $lims_department_list = Department::where('is_active', true)->get();

        return view('superadmin.employee.create', compact('lims_warehouse_list', 'lims_biller_list', 'lims_department_list'));
    }
    public function employeesStore($request)
    {
        $data = $request->except('image');
        $message = 'Employee created successfully';
        if (isset($data['user'])) {
            $data['is_active'] = true;
            $data['is_deleted'] = false;
            $data['password'] = bcrypt($data['password']);
            $data['phone'] = $data['phone_number'];
            User::create($data);
            $user = User::latest()->first();
            $data['user_id'] = $user->id;
            $message = 'Employee created successfully and added to user list';
        }
        //validation in employee table
        $image = $request->image;
        if ($image) {
            $ext = pathinfo($image->getClientOriginalName(), PATHINFO_EXTENSION);
            $imageName = preg_replace('/[^a-zA-Z0-9]/', '', $request['email']);
            $imageName = $imageName . '.' . $ext;
            $image->move('public/images/employee', $imageName);
            $data['image'] = $imageName;
        }

        $data['name'] = $data['employee_name'];
        $data['is_active'] = true;
        Employee::create($data);

        return redirect('superAdmin/employees')->with('message', $message);
    }

    public function employeesUpdate($request)
    {
        $lims_employee_data = Employee::find($request['employee_id']);

        //validation in employee table


        $data = $request->except('image');
        $image = $request->image;
        if ($image) {
            $ext = pathinfo($image->getClientOriginalName(), PATHINFO_EXTENSION);
            $imageName = preg_replace('/[^a-zA-Z0-9]/', '', $request['email']);
            $imageName = $imageName . '.' . $ext;
            $image->move('public/images/employee', $imageName);
            $data['image'] = $imageName;
        }

        $lims_employee_data->update($data);
        return redirect('superAdmin/employees')->with('message', 'Employee updated successfully');
    }

    public function deleteBySelectionEmployee($request)
    {
        $employee_id = $request['employeeIdArray'];
        foreach ($employee_id as $id) {
            $lims_employee_data = Employee::find($id);
            if ($lims_employee_data->user_id) {
                $lims_user_data = User::find($lims_employee_data->user_id);
                $lims_user_data->is_deleted = true;
                $lims_user_data->save();
            }
            $lims_employee_data->is_active = false;
            $lims_employee_data->save();
        }
        return 'Employee deleted successfully!';
    }
    public function employeesdestroy($id)
    {
        $lims_employee_data = Employee::find($id);
        if ($lims_employee_data->user_id) {
            $lims_user_data = User::find($lims_employee_data->user_id);
            $lims_user_data->is_deleted = true;
            $lims_user_data->save();
        }
        $lims_employee_data->is_active = false;
        $lims_employee_data->save();
        return redirect('superAdmin/employees')->with('not_permitted', 'Employee deleted successfully');
    }
}