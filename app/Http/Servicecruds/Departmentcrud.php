<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\Department;
use Yajra\DataTables\Facades\DataTables;

class Departmentcrud
{
    public function departmentsindex()
    {
        $lims_department_all = Department::where('is_active', true)->get();
        return view('superadmin.department.index', compact('lims_department_all'));
    }

    public function departmentsStore($request)
    {
        $data = $request->all();
        $data['is_active'] = true;
        Department::create($data);
        return redirect('superAdmin/departments')->with('message', 'Department created successfully');
    }

    public function departmentsUpdate($request)
    {
        $data = $request->all();
        $lims_department_data = Department::find($data['department_id']);
        $lims_department_data->update($data);
        return redirect('superAdmin/departments')->with('message', 'Department updated successfully');
    }

    public function deleteBySelectionDepartment($request)
    {
        $department_id = $request['departmentIdArray'];
        foreach ($department_id as $id) {
            $lims_department_data = Department::find($id);
            $lims_department_data->is_active = false;
            $lims_department_data->save();
        }
        return 'Department deleted successfully!';
    }

    public function departmentsdestroy($id)
    {
        $lims_department_data = Department::find($id);
        $lims_department_data->is_active = false;
        $lims_department_data->save();
        return redirect('superAdmin/departments')->with('message', 'Department deleted successfully');
    }
}