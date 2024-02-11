<?php

namespace App\Http\Servicecruds;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use \Illuminate\Support\Facades\Auth;
use App\Models\{
    CustomField
};

class CustomFieldcrud
{
 // ========================cashRegister===================
 public function customindex($request)
 {
    $lims_custom_field_all = CustomField::orderBy('id', 'desc')->get();
    return view('superadmin.custom_field.index', compact('lims_custom_field_all'));

 }
 public function customstore( $request)
 {
     $data = $request->all();
     //adding column to specific database
     if($data['belongs_to'] == 'sale')
         $table_name = 'sales';
     elseif($data['belongs_to'] == 'purchase')
         $table_name = 'purchases';
     elseif($data['belongs_to'] == 'product')
         $table_name = 'products';
     elseif($data['belongs_to'] == 'customer')
         $table_name = 'customers';

     $column_name = str_replace(" ", "_", strtolower($data['name']));

     if($data['type'] == 'number')
         $data_type = 'double';
     elseif($data['type'] == 'textarea')
         $data_type = 'text';
     else
         $data_type = 'varchar(255)';
     $sqlStatement = "ALTER TABLE ". $table_name . " ADD " . $column_name . " " . $data_type;
     if($data['default_value_1']) {
         $sqlStatement .= " DEFAULT '" . $data['default_value_1'] . "'";
         $data['default_value'] = $data['default_value_1'];
     }
     elseif($data['default_value_2']) {
         $sqlStatement .= " DEFAULT '" . $data['default_value_2'] . "'";
         $data['default_value'] = $data['default_value_2'];
     }
     DB::insert($sqlStatement);
     //adding data to custom fields table
     if(isset($data['is_table']))
         $data['is_table'] = true;
     else
         $data['is_table'] = false;

     if(isset($data['is_invoice']))
         $data['is_invoice'] = true;
     else
         $data['is_invoice'] = false;

     if(isset($data['is_required']))
         $data['is_required'] = true;
     else
         $data['is_required'] = false;

     if(isset($data['is_admin']))
         $data['is_admin'] = true;
     else
         $data['is_admin'] = false;

     if(isset($data['is_disable']))
         $data['is_disable'] = true;
     else
         $data['is_disable'] = false;
     CustomField::create($data);
     return redirect()->route('superAdmin.custom-fields')->with('message', 'Custom Field created successfully');
 }



 public function customedit($id)
 {

         $custom_field_data = CustomField::find($id);
         return view('superadmin.custom_field.edit', compact('custom_field_data'));

 }

 public function customupdate( $request, $id)
 {
     $data = $request->all();
     $lims_custom_field_data = CustomField::find($id);
     if($data['belongs_to'] == 'sale')
         $table_name = 'sales';
     elseif($data['belongs_to'] == 'product')
         $table_name = 'products';
     elseif($data['belongs_to'] == 'purchase')
         $table_name = 'purchases';
     elseif($data['belongs_to'] == 'customer')
         $table_name = 'customers';
     $column_name = str_replace(" ", "_", strtolower($data['name']));
     if($data['type'] == 'number')
         $data_type = 'double';
     elseif($data['type'] == 'textarea')
         $data_type = 'text';
     else
         $data_type = 'varchar(255)';

     if($data['name'] == $lims_custom_field_data->name)
         $action = " MODIFY ";
     else
         $action = " RENAME ";
     //deleting previous custom column if necessary
     if($data['belongs_to'] != $lims_custom_field_data->belongs_to) {
         if($lims_custom_field_data->belongs_to == 'sale')
             $old_table_name = 'sales';
         elseif($lims_custom_field_data->belongs_to == 'purchase')
             $old_table_name = 'purchases';
         elseif($lims_custom_field_data->belongs_to == 'product')
             $old_table_name = 'products';
         elseif($lims_custom_field_data->belongs_to == 'customer')
             $old_table_name = 'customers';
         $column_name = str_replace(" ", "_", strtolower($lims_custom_field_data->name));
         $sqlStatement = "ALTER TABLE ". $old_table_name . " DROP COLUMN " . $column_name;
         DB::insert($sqlStatement);
         $action = " ADD ";
     }
     elseif($data['type'] == 'number' && $data['type'] != $lims_custom_field_data->type) {
         $column_name = str_replace(" ", "_", strtolower($lims_custom_field_data->name));
         $sqlStatement = "ALTER TABLE ". $table_name . " DROP COLUMN " . $column_name;
         DB::insert($sqlStatement);
         $action = " ADD ";
     }
     //adding column to specific database
     $sqlStatement = "ALTER TABLE ". $table_name . $action . $column_name . " " . $data_type;
     if($data['default_value_1']) {
         $sqlStatement .= " DEFAULT '" . $data['default_value_1'] . "'";
         $data['default_value'] = $data['default_value_1'];
     }
     elseif($data['default_value_2']) {
         $sqlStatement .= " DEFAULT '" . $data['default_value_2'] . "'";
         $data['default_value'] = $data['default_value_2'];
     }
     DB::insert($sqlStatement);
     //updating data to custom fields table
     if(isset($data['is_table']))
         $data['is_table'] = true;
     else
         $data['is_table'] = false;

     if(isset($data['is_invoice']))
         $data['is_invoice'] = true;
     else
         $data['is_invoice'] = false;

     if(isset($data['is_required']))
         $data['is_required'] = true;
     else
         $data['is_required'] = false;

     if(isset($data['is_admin']))
         $data['is_admin'] = true;
     else
         $data['is_admin'] = false;

     if(isset($data['is_disable']))
         $data['is_disable'] = true;
     else
         $data['is_disable'] = false;
     $lims_custom_field_data->update($data);
     return redirect()->route('superAdmin.custom-fields')->with('message', 'Custom Field updated successfully');
 }

 public function destroy($id)
 {
     $custom_field_data = CustomField::find($id);
     if($custom_field_data->belongs_to == 'sale')
         $table_name = 'sales';
     elseif($custom_field_data->belongs_to == 'product')
         $table_name = 'products';
     elseif($custom_field_data->belongs_to == 'purchase')
         $table_name = 'purchases';
     elseif($custom_field_data->belongs_to == 'customer')
         $table_name = 'customers';
     $column_name = str_replace(" ", "_", strtolower($custom_field_data->name));
     $sqlStatement = "ALTER TABLE ". $table_name . " DROP COLUMN " . $column_name;
     DB::insert($sqlStatement);
     $custom_field_data->delete();
     return redirect()->back()->with('not_permitted', 'Custom Field deleted successfully!');
 }
}
