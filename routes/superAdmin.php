<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
// try  catch
use App\Services\PayUService\Exception;
use App\Http\Controllers\HitlogController;
use App\Models\Product;
use App\Models\ProductViewModel;

/*
|--------------------------------------------------------------------------
| SuperAdmin Routes
|--------------------------------------------------------------------------
|
| Here is where you can register SuperAdmin routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "SuperAdmin" middleware group. Now create something great!
|
*/



Route::group(['prefix' => 'superAdmin', 'as' => 'superAdmin.','middleware' => ['auth','superAdmin','priventBackHistory']], function() {

    Route::get('/', [App\Http\Controllers\SuperAdminController::class, 'index'])->name('superAdmin');
    Route::get('/', [App\Http\Controllers\SuperAdminController::class, 'index'])->name('index');

    // All Custom log
    // Route::get('lang', [App\Http\Controllers\SuperAdminController::class, 'lang'])->name('lang');
    // Route::get('lang/change', [App\Http\Controllers\SuperAdminController::class, 'lang_change'])->name('lang.change');
    Route::get('/notifyread/{id}', [App\Http\Controllers\SuperAdminController::class, 'notifyread']);
    Route::get('/databasebackup', [App\Http\Controllers\SuperAdminController::class, 'databasebackup'])->name('databasebackup');
    Route::get('/loginhistory', [App\Http\Controllers\SuperAdminController::class, 'loginhistory'])->name('loginhistory');
    // Route::post('/submail', [App\Http\Controllers\SuperAdminController::class, 'submail'])->name('submail');
    
    

    
    // Route::controller(HomeController::class)->group(function () {
      
    //     Route::get('/yearly-best-selling-price', 'yearlyBestSellingPrice');
    //     Route::get('/yearly-best-selling-qty', 'yearlyBestSellingQty');
    //     Route::get('/monthly-best-selling-qty', 'monthlyBestSellingQty');
    //     Route::get('/recent-sale', 'recentSale');
    //     Route::get('/recent-purchase', 'recentPurchase');
    //     Route::get('/recent-quotation', 'recentQuotation');
    //     Route::get('/recent-payment', 'recentPayment');
    //     Route::get('switch-theme/{theme}', 'switchTheme')->name('switchTheme');
    //     Route::get('/dashboard-filter/{start_date}/{end_date}', 'dashboardFilter');
    //     Route::get('addon-list', 'addonList');
    //     Route::get('my-transactions/{year}/{month}', 'myTransaction');
    // });

    // Users
    Route::get('users', [App\Http\Controllers\SuperAdminController::class, 'users'])->name('users');
    Route::get('users.create',  [App\Http\Controllers\SuperAdminController::class, 'usercreate'])->name('users.create');
    Route::post('users.store', [App\Http\Controllers\SuperAdminController::class, 'userstore'])->name('users.store');
    Route::get('users.show.{id}', [App\Http\Controllers\SuperAdminController::class, 'usershow'])->name('users.show');
    Route::get('users.edit.{id}', [App\Http\Controllers\SuperAdminController::class, 'useredit'])->name('users.edit');
    Route::get('users.publish.{id}', [App\Http\Controllers\SuperAdminController::class, 'userpublish'])->name('users.publish');
    Route::get('users.unpublish.{id}', [App\Http\Controllers\SuperAdminController::class, 'userunpublish'])->name('users.unpublish');
    Route::patch('users.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'userupdate'])->name('users.update');
    Route::delete('/users.destroy.{id}', [App\Http\Controllers\SuperAdminController::class, 'userdestroy'])->name('users.destroy');

    Route::post('/users.upload', [App\Http\Controllers\SuperAdminController::class, 'usersupload'])->name('users.upload');
    Route::get('/users.fetch', [App\Http\Controllers\SuperAdminController::class, 'usersfetch'])->name('users.fetch');
    Route::get('/users.delete', [App\Http\Controllers\SuperAdminController::class, 'usersuploaddelete'])->name('users.delete');
    Route::post('/users.search', [App\Http\Controllers\SuperAdminController::class, 'userssearch'])->name('users.search');
    Route::put('user/update_profile/{id}', [App\Http\Controllers\SuperAdminController::class, 'profileUpdate'])->name('user.profileUpdate');

    // Admin role
    Route::get('/roles', [App\Http\Controllers\SuperAdminController::class, 'roles'])->name('roles');
    Route::get('/roles.create', [App\Http\Controllers\SuperAdminController::class, 'rolecreate'])->name('roles.create');
    Route::post('/roles.store', [App\Http\Controllers\SuperAdminController::class, 'rolestore'])->name('roles.store');
    Route::get('/roles.show.{id}', [App\Http\Controllers\SuperAdminController::class, 'roleshow'])->name('roles.show');
    Route::get('/roles.edit.{id}', [App\Http\Controllers\SuperAdminController::class, 'roleedit'])->name('roles.edit');
    Route::patch('/roles.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'roleupdate'])->name('roles.update');
    Route::delete('/roles.destroy.{id}', [App\Http\Controllers\SuperAdminController::class, 'roledelete'])->name('roles.destroy');

    // Media
    Route::get('/media', [App\Http\Controllers\SuperAdminController::class, 'media'])->name('media');
    Route::post('/media.upload', [App\Http\Controllers\SuperAdminController::class, 'mediaupload'])->name('media.upload');
    Route::get('/media.fetch', [App\Http\Controllers\SuperAdminController::class, 'mediafetch'])->name('media.fetch');
    Route::get('/media.delete', [App\Http\Controllers\SuperAdminController::class, 'mediauploaddelete'])->name('media.delete');
    Route::post('/media.search', [App\Http\Controllers\SuperAdminController::class, 'mediasearch'])->name('media.search');

   // whitelist
	Route::get('/white', [App\Http\Controllers\SuperAdminController::class, 'white'])->name('white');
	Route::get('white.create', [App\Http\Controllers\SuperAdminController::class, 'whitecreate'])->name('white.create');
	Route::post('white.store', [App\Http\Controllers\SuperAdminController::class, 'whitestore'])->name('white.store');
	Route::get('white.edit.{id}', [App\Http\Controllers\SuperAdminController::class, 'whiteedit'])->name('white.edit');
	Route::post('white.update', [App\Http\Controllers\SuperAdminController::class, 'whiteupdate'])->name('white.update');
	Route::get('white.delete.{id}', [App\Http\Controllers\SuperAdminController::class, 'whitedestroy'])->name('white.delete');

    // custom-fields
    Route::get('/custom-fields', [App\Http\Controllers\SuperAdminController::class, 'customindex'])->name('custom-fields');
	Route::get('custom-fields.create', [App\Http\Controllers\SuperAdminController::class, 'customcreate'])->name('custom-fields.create');
	Route::post('custom-fields.store', [App\Http\Controllers\SuperAdminController::class, 'customstore'])->name('custom-fields.store');
	Route::get('custom-fields.edit.{id}', [App\Http\Controllers\SuperAdminController::class, 'customedit'])->name('custom-fields.edit');
	Route::put('custom-fields.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'customupdate'])->name('custom-fields.update');
	Route::Delete('custom-fields.destroy.{id}', [App\Http\Controllers\SuperAdminController::class, 'destroy'])->name('custom-fields.destroy');

    // Route::resource('custom-fields', CustomFieldController::class);

    // Black list
	Route::get('/black', [App\Http\Controllers\SuperAdminController::class, 'black'])->name('black');
	Route::get('black.create', [App\Http\Controllers\SuperAdminController::class, 'blackcreate'])->name('black.create');
	Route::post('black.store', [App\Http\Controllers\SuperAdminController::class, 'blackstore'])->name('black.store');
	Route::get('black.edit.{id}', [App\Http\Controllers\SuperAdminController::class, 'blackedit'])->name('black.edit');
	Route::post('black.update', [App\Http\Controllers\SuperAdminController::class, 'blackupdate'])->name('black.update');
	Route::get('black.delete.{id}', [App\Http\Controllers\SuperAdminController::class, 'blackdestroy'])->name('black.delete');

    // Menu
    Route::get('menus/{id?}',[App\Http\Controllers\SuperAdminController::class,'menuindex'])->name('menus');
	Route::post('menus.create',[App\Http\Controllers\SuperAdminController::class,'menustore'])->name('menus.create');
	Route::post('menus.update-menuitem.{id}',[App\Http\Controllers\SuperAdminController::class,'menuupdateMenuItem'])->name('menus.update-menuitem');
	Route::get('menus.add-categories-to-menu',[App\Http\Controllers\SuperAdminController::class,'menuaddCatToMenu'])->name('menus.add-categories-to-menu');
	Route::get('menus.add-page-to-menu',[App\Http\Controllers\SuperAdminController::class,'menuaddPaseToMenu'])->name('menus.add-page-to-menu');
	Route::get('menus.add-post-to-menu',[App\Http\Controllers\SuperAdminController::class,'menuaddPostToMenu'])->name('menus.add-post-to-menu');
	Route::get('menus.add-custom-link',[App\Http\Controllers\SuperAdminController::class,'menuaddCustomLink'])->name('menus.add-custom-link');
	// Route::get('menus.save-menu',[App\Http\Controllers\SuperAdminController::class,'menusaveMenu'])->name('menus.save-menu');
	Route::get('menus.update-menu',[App\Http\Controllers\SuperAdminController::class,'menuupdateMenu'])->name('menus.update-menu');
	Route::get('menus.delete-menuitem.{id}.{key}/{in?}',[App\Http\Controllers\SuperAdminController::class,'menudeleteMenuItem'])->name('menus.delete-menuitem');
	Route::get('menus.delete-menu.{id}',[App\Http\Controllers\SuperAdminController::class,'menudestroy'])->name('menus.delete-menu');


    Route::get('/artical', [App\Http\Controllers\SuperAdminController::class, 'articalindex'])->name('artical');
    Route::get('artical.create', [App\Http\Controllers\SuperAdminController::class, 'articalcreate'])->name('artical.create');
    Route::post('artical.store', [App\Http\Controllers\SuperAdminController::class, 'articalstore'])->name('artical.store');
    Route::get('artical.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'articaledit'])->name('artical.edit');
    Route::patch('artical.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'articalupdate'])->name('artical.update');
    Route::get('artical.deleted.{id}', [App\Http\Controllers\SuperAdminController::class, 'articaldelete'])->name('artical.deleted');


    // ===========================================

    //accounting routes
	Route::get('accounts/make-default/{id}', 'AccountsController@makeDefault');
    Route::get('/accounts', [App\Http\Controllers\SuperAdminController::class, 'accountsindex'])->name('accounts');
    Route::POST('accounts.store', [App\Http\Controllers\SuperAdminController::class, 'accountsStore'])->name('accounts.store');
    Route::get('accounts.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'accountsEdit'])->name('accounts.edit');
    Route::POST('accounts.update', [App\Http\Controllers\SuperAdminController::class, 'accountsUpdate'])->name('accounts.update');
    Route::DELETE('accounts.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'accountsdestroy'])->name('accounts.deleted');

	Route::get('accounts/balancesheet', [App\Http\Controllers\SuperAdminController::class, 'balanceSheet'])->name('accounts.balancesheet');
	Route::post('accounts/account-statement', [App\Http\Controllers\SuperAdminController::class, 'accountStatement'])->name('accounts.statement');
	// Route::resource('accounts', 'AccountsController');
    Route::get('/money-transfers', [App\Http\Controllers\SuperAdminController::class, 'moneyTransfersindex'])->name('money-transfers');
    Route::POST('money-transfers.store', [App\Http\Controllers\SuperAdminController::class, 'moneyTransfersStore'])->name('money-transfers.store');
    Route::get('money-transfers.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'moneyTransfersedit'])->name('money-transfers.edit');
    Route::PUT('money-transfers.update', [App\Http\Controllers\SuperAdminController::class, 'moneyTransfersupdate'])->name('money-transfers.update');
    Route::DELETE('money-transfers.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'moneyTransfersdestroy'])->name('money-transfers.deleted');

	// Route::resource('money-transfers', 'MoneyTransferController');
    // ************************* HRM departments  **********************


    Route::get('/departments', [App\Http\Controllers\SuperAdminController::class, 'departmentsindex'])->name('departments');
    Route::POST('departments.store', [App\Http\Controllers\SuperAdminController::class, 'departmentsStore'])->name('departments.store');
    Route::get('departments.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'departmentsEdit'])->name('departments.edit');
    Route::PUT('departments.update', [App\Http\Controllers\SuperAdminController::class, 'departmentsUpdate'])->name('departments.update');
    Route::DELETE('departments.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'departmentsdestroy'])->name('departments.deleted');

    Route::get('/employees', [App\Http\Controllers\SuperAdminController::class, 'employeesindex'])->name('employees');
    Route::get('employees.create', [App\Http\Controllers\SuperAdminController::class, 'employeesCreate'])->name('employees.create');
    Route::POST('employees.store', [App\Http\Controllers\SuperAdminController::class, 'employeesStore'])->name('employees.store');
    Route::get('employees.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'employeesEdit'])->name('employees.edit');
    Route::put('employees.update', [App\Http\Controllers\SuperAdminController::class, 'employeesUpdate'])->name('employees.update');
    Route::DELETE('employees.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'employeesdestroy'])->name('employees.deleted');

    Route::get('/payroll', [App\Http\Controllers\SuperAdminController::class, 'payrollindex'])->name('payroll');
    Route::POST('payroll.store', [App\Http\Controllers\SuperAdminController::class, 'payrollStore'])->name('payroll.store');
    Route::get('payroll.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'payrollEdit'])->name('payroll.edit');
    Route::put('payroll.update', [App\Http\Controllers\SuperAdminController::class, 'payrollUpdate'])->name('payroll.update');
    Route::DELETE('payroll.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'payrolldestroy'])->name('payroll.deleted');

    Route::get('/attendance', [App\Http\Controllers\SuperAdminController::class, 'attendanceindex'])->name('attendance');
    Route::POST('attendance.store', [App\Http\Controllers\SuperAdminController::class, 'attendanceStore'])->name('attendance.store');
    Route::get('attendance.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'attendanceEdit'])->name('attendance.edit');
    Route::put('attendance.update', [App\Http\Controllers\SuperAdminController::class, 'attendanceUpdate'])->name('attendance.update');
    Route::DELETE('attendance.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'attendancedestroy'])->name('attendance.deleted');

    Route::get('/stock-count', [App\Http\Controllers\SuperAdminController::class, 'stockCountindex'])->name('stock-count');
    Route::POST('stock-count.store', [App\Http\Controllers\SuperAdminController::class, 'stockCountStore'])->name('stock-count.store');

    Route::DELETE('stock-count.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'stockCountdestroy'])->name('stock-count.deleted');
	Route::post('stock-count/finalize', [App\Http\Controllers\SuperAdminController::class, 'finalize'])->name('stock-count.finalize');
	Route::get('stock-count/{id}/qty_adjustment', [App\Http\Controllers\SuperAdminController::class, 'qtyAdjustment'])->name('stock-count.adjustment');

    Route::get('/holidays', [App\Http\Controllers\SuperAdminController::class, 'holidaysCountindex'])->name('holidays');
    Route::POST('holidays.store', [App\Http\Controllers\SuperAdminController::class, 'holidaysCountStore'])->name('holidays.store');
    Route::get('holidays.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'holidaysCountEdit'])->name('holidays.edit');
    Route::put('holidays.update', [App\Http\Controllers\SuperAdminController::class, 'holidaysCountUpdate'])->name('holidays.update');
    Route::DELETE('holidays.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'holidaysCountdestroy'])->name('holidays.deleted');
    Route::get('approve-holiday/{id}', [App\Http\Controllers\SuperAdminController::class, 'approveHoliday'])->name('approveHoliday');
	Route::get('holidays.myHoliday/{year}/{month}', [App\Http\Controllers\SuperAdminController::class, 'myHoliday'])->name('holidays.myHoliday');


    Route::get('setting/hrm_setting', [App\Http\Controllers\SuperAdminController::class, 'hrmSetting'] )->name('setting.hrm');
	Route::post('setting/hrm_setting_store', [App\Http\Controllers\SuperAdminController::class, 'hrmSettingStore'])->name('setting.hrmStore');
	Route::get('stock-count/stockdif/{id}', [App\Http\Controllers\SuperAdminController::class, 'stockDif']);

    // Adjustment
    Route::get('qty_adjustment', [App\Http\Controllers\SuperAdminController::class, 'adjustmentindex'])->name('qty_adjustment');
    Route::get('qty_adjustment.create', [App\Http\Controllers\SuperAdminController::class, 'adjustmentcreate'])->name('qty_adjustment.create');
    Route::POST('qty_adjustment.store', [App\Http\Controllers\SuperAdminController::class, 'adjustmentstore'])->name('qty_adjustment.store');
    Route::get('qty_adjustment.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'adjustmentedit'])->name('qty_adjustment.edit');
    Route::put('qty_adjustment.update/{id}', [App\Http\Controllers\SuperAdminController::class, 'adjustmentupdate'])->name('qty_adjustment.update');
    // Route::DELETE('qty_adjustment.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'adjustmentdestroy'])->name('qty_adjustment.deleted');
    Route::DELETE('qty_adjustment.destroy/{id}', [App\Http\Controllers\SuperAdminController::class, 'adjustmentdestroy'])->name('qty_adjustment.destroy');
    Route::get('qty_adjustment/getproduct/{id}', [App\Http\Controllers\SuperAdminController::class, 'adjustmentgetProduct'])->name('adjustment.getproduct');
    Route::get('qty_adjustment/lims_product_search', [App\Http\Controllers\SuperAdminController::class, 'adjustmentlimsProductSearch'])->name('product_adjustment.search');
    Route::post('qty_adjustment/deletebyselection', [App\Http\Controllers\SuperAdminController::class, 'deleteBySelection']);

    //Transfers
    Route::get('transfers', [App\Http\Controllers\SuperAdminController::class, 'transfersIndex'])->name('transfers');
    Route::get('transfers.create', [App\Http\Controllers\SuperAdminController::class, 'transfersCreate'])->name('transfers.create');
    Route::POST('transfers.store', [App\Http\Controllers\SuperAdminController::class, 'transfersStore'])->name('transfers.store');
    Route::get('transfers.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'transfersEdit'])->name('transfers.edit');
    Route::put('transfers.update/{id}', [App\Http\Controllers\SuperAdminController::class, 'transfersUpdate'])->name('transfers.update');
    Route::POST('transfers.destroy/{id}', [App\Http\Controllers\SuperAdminController::class, 'transfersDestroy'])->name('transfers.destroy');

    Route::post('transfers/transfer-data', [App\Http\Controllers\SuperAdminController::class, 'transferData'])->name('transfers/transfer-data');
	Route::post('importtransfer', [App\Http\Controllers\SuperAdminController::class, 'importTransfer'])->name('transfer.import');
	Route::get('transfers/getproduct/{id}',  [App\Http\Controllers\SuperAdminController::class, 'transfersGetProduct'])->name('transfers/getproduct');
	Route::get('product_transfer.search', [App\Http\Controllers\SuperAdminController::class, 'transfersLimsProductSearch'] )->name('product_transfer.search');

	Route::get('transfers/product_transfer/{id}',  [App\Http\Controllers\SuperAdminController::class, 'transfersProductTransferData']);
	Route::get('transfers/transfer_by_csv', [App\Http\Controllers\SuperAdminController::class, 'transferByCsv'] );
	Route::post('transfers/deletebyselection', [App\Http\Controllers\SuperAdminController::class, 'deleteBySelection']);


	// Route::resource('transfers', 'TransferController');
    // Route::resource('qty_adjustment', 'AdjustmentController');
    // Route::post('departments/deletebyselection', 'DepartmentController@deleteBySelection');
	// Route::resource('departments', 'DepartmentController');
	// Route::post('employees/deletebyselection', 'EmployeeController@deleteBySelection');
	// Route::resource('employees', 'EmployeeController');
	// Route::post('payroll/deletebyselection', 'PayrollController@deleteBySelection');
	// Route::resource('payroll', 'PayrollController');
	// Route::post('attendance/deletebyselection', 'AttendanceController@deleteBySelection');
	// Route::resource('attendance', 'AttendanceController');
	// Route::resource('stock-count', 'StockCountController');
	// Route::post('holidays/deletebyselection', 'HolidayController@deleteBySelection');
	// Route::get('approve-holiday/{id}', 'HolidayController@approveHoliday')->name('approveHoliday');
	// Route::get('holidays/my-holiday/{year}/{month}', 'HolidayController@myHoliday')->name('myHoliday');
	// Route::resource('holidays', 'HolidayController');

    // category
        Route::get('/category', [App\Http\Controllers\SuperAdminController::class, 'categoryindex'])->name('category');
        Route::get('category.create', [App\Http\Controllers\SuperAdminController::class, 'categorycreate'])->name('category.create');
        Route::post('category.store', [App\Http\Controllers\SuperAdminController::class, 'categorystore'])->name('category.store');
        Route::get('category.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'categoryedit'])->name('category.edit');
        Route::PATCH('category.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'categoryupdate'])->name('category.update');

        Route::POST('category.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'categorydestroy'])->name('category.deleted');

        Route::get('category.{category}', [App\Http\Controllers\SuperAdminController::class, 'categorycategoryName'])->name('category.categoryName');;
        Route::get('category.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'categorypublish'])->name('category.publish');
        Route::get('category.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'categoryunpublish'])->name('category.unpublish');
        Route::post('category.upload', [App\Http\Controllers\SuperAdminController::class, 'categoryupload'])->name('category.upload');

        // Route::get('categoryCheck.name/{nameValue}', [App\Http\Controllers\SuperAdminController::class, 'categoryCheckname'])->name('categoryCheck.name');

        Route::get('category.fetch', [App\Http\Controllers\SuperAdminController::class, 'categoryfetch'])->name('category.fetch');

        Route::get('category.delete', [App\Http\Controllers\SuperAdminController::class, 'categoryuploaddelete'])->name('category.delete');
        Route::post('category.search', [App\Http\Controllers\SuperAdminController::class, 'categoryimagesearch'])->name('category.search');


        // Search
        Route::post('categoryscat.search', [App\Http\Controllers\SuperAdminController::class, 'categorySearch'])->name('categoryscat.search');

           // brand
        Route::get('/brand', [App\Http\Controllers\SuperAdminController::class, 'brandindex'])->name('brand');
        Route::get('brand.create', [App\Http\Controllers\SuperAdminController::class, 'brandcreate'])->name('brand.create');
        Route::post('brand.store', [App\Http\Controllers\SuperAdminController::class, 'brandstore'])->name('brand.store');
        Route::get('brand.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'brandedit'])->name('brand.edit');
        Route::patch('brand.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'brandupdate'])->name('brand.update');
        Route::POST('brand.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'branddestroy'])->name('brand.deleted');
        Route::get('brand.{brand}', [App\Http\Controllers\SuperAdminController::class, 'brandbrandName'])->name('brand.brandName');;
        Route::get('brand.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'brandpublish'])->name('brand.publish');
        Route::get('brand.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'brandunpublish'])->name('brand.unpublish');
        Route::post('brand.upload', [App\Http\Controllers\SuperAdminController::class, 'brandupload'])->name('brand.upload');
        Route::get('brand.fetch', [App\Http\Controllers\SuperAdminController::class, 'brandfetch'])->name('brand.fetch');
        Route::get('brand.delete', [App\Http\Controllers\SuperAdminController::class, 'branduploaddelete'])->name('brand.delete');
        Route::post('brand.search', [App\Http\Controllers\SuperAdminController::class, 'brandimagesearch'])->name('brand.search');

        // Unit
        Route::get('/unit', [App\Http\Controllers\SuperAdminController::class, 'unitindex'])->name('unit');
        Route::get('unit.create', [App\Http\Controllers\SuperAdminController::class, 'unitcreate'])->name('unit.create');
        Route::post('unit.store', [App\Http\Controllers\SuperAdminController::class, 'unitstore'])->name('unit.store');
        Route::get('unit.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'unitedit'])->name('unit.edit');
        Route::patch('unit.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'unitupdate'])->name('unit.update');
        Route::POST('unit.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'unitdestroy'])->name('unit.deleted');
        Route::get('unit.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'unitpublish'])->name('unit.publish');
        Route::get('unit.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'unitunpublish'])->name('unit.unpublish');
        Route::post('unit.search', [App\Http\Controllers\SuperAdminController::class, 'unitimagesearch'])->name('unit.search');

        // tax
        Route::get('/tax', [App\Http\Controllers\SuperAdminController::class, 'taxindex'])->name('tax');
        Route::get('tax.create', [App\Http\Controllers\SuperAdminController::class, 'taxcreate'])->name('tax.create');
        Route::post('tax.store', [App\Http\Controllers\SuperAdminController::class, 'taxstore'])->name('tax.store');
        Route::get('tax.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'taxedit'])->name('tax.edit');
        Route::patch('tax.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'taxupdate'])->name('tax.update');
        Route::POST('tax.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'taxdestroy'])->name('tax.deleted');
        Route::get('tax.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'taxpublish'])->name('tax.publish');
        Route::get('tax.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'taxunpublish'])->name('tax.unpublish');
        Route::post('tax.search', [App\Http\Controllers\SuperAdminController::class, 'taximagesearch'])->name('tax.search');

           // warehouse
        Route::get('/warehouse', [App\Http\Controllers\SuperAdminController::class, 'warehouseindex'])->name('warehouse');
        Route::get('warehouse.create', [App\Http\Controllers\SuperAdminController::class, 'warehousecreate'])->name('warehouse.create');
        Route::post('warehouse.store', [App\Http\Controllers\SuperAdminController::class, 'warehousestore'])->name('warehouse.store');
        Route::get('warehouse.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'warehouseedit'])->name('warehouse.edit');
        Route::patch('warehouse.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'warehouseupdate'])->name('warehouse.update');
        Route::POST('warehouse.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'warehousedestroy'])->name('warehouse.deleted');
        Route::get('warehouse.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'warehousepublish'])->name('warehouse.publish');
        Route::get('warehouse.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'warehouseunpublish'])->name('warehouse.unpublish');
        Route::post('warehouse.search', [App\Http\Controllers\SuperAdminController::class, 'warehouseimagesearch'])->name('warehouse.search');

        // promotion
        Route::get('/promotion', [App\Http\Controllers\SuperAdminController::class, 'promotionindex'])->name('promotion');
        Route::get('promotion.create', [App\Http\Controllers\SuperAdminController::class, 'promotioncreate'])->name('promotion.create');
        Route::post('promotion.store', [App\Http\Controllers\SuperAdminController::class, 'promotionstore'])->name('promotion.store');
        Route::get('promotion.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'promotionedit'])->name('promotion.edit');
        Route::patch('promotion.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'promotionupdate'])->name('promotion.update');
        Route::POST('promotion.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'promotiondestroy'])->name('promotion.deleted');
        Route::get('promotion.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'promotionpublish'])->name('promotion.publish');
        Route::get('promotion.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'promotionunpublish'])->name('promotion.unpublish');
        Route::post('promotion.search', [App\Http\Controllers\SuperAdminController::class, 'promotionimagesearch'])->name('promotion.search');

        // barcode
        Route::get('/barcode', [App\Http\Controllers\SuperAdminController::class, 'barcodeindex'])->name('barcode');
        Route::get('barcode.create', [App\Http\Controllers\SuperAdminController::class, 'barcodecreate'])->name('barcode.create');
        Route::post('barcode.store', [App\Http\Controllers\SuperAdminController::class, 'barcodestore'])->name('barcode.store');
        Route::get('barcode.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'barcodeedit'])->name('barcode.edit');
        Route::patch('barcode.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'barcodeupdate'])->name('barcode.update');
        Route::post('barcode.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'barcodedestroy'])->name('barcode.deleted');
        Route::get('barcode.print', [App\Http\Controllers\SuperAdminController::class, 'barcodeprint'])->name('barcode.print');;

        Route::get('barcode.{barcode}', [App\Http\Controllers\SuperAdminController::class, 'barcodebarcodeName'])->name('barcode.barcodeName');;
        Route::post('barcode.search', [App\Http\Controllers\SuperAdminController::class, 'barcodeimagesearch'])->name('barcode.search');
          // supplier
        Route::get('/supplier', [App\Http\Controllers\SuperAdminController::class, 'supplierindex'])->name('supplier');
        Route::get('supplier.create', [App\Http\Controllers\SuperAdminController::class, 'suppliercreate'])->name('supplier.create');
        Route::post('supplier.store', [App\Http\Controllers\SuperAdminController::class, 'supplierstore'])->name('supplier.store');
        Route::get('supplier.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'supplieredit'])->name('supplier.edit');
        Route::patch('supplier.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'supplierupdate'])->name('supplier.update');
        Route::POST('supplier.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'supplierdestroy'])->name('supplier.deleted');
        Route::get('supplier.{supplier}', [App\Http\Controllers\SuperAdminController::class, 'suppliersupplierName'])->name('supplier.supplierName');;
        Route::get('supplier.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'supplierpublish'])->name('supplier.publish');
        Route::get('supplier.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'supplierunpublish'])->name('supplier.unpublish');
        Route::post('supplier.upload', [App\Http\Controllers\SuperAdminController::class, 'supplierupload'])->name('supplier.upload');
        Route::get('supplier.fetch', [App\Http\Controllers\SuperAdminController::class, 'supplierfetch'])->name('supplier.fetch');
        Route::get('supplier.delete', [App\Http\Controllers\SuperAdminController::class, 'supplieruploaddelete'])->name('supplier.delete');
        Route::post('supplier.search', [App\Http\Controllers\SuperAdminController::class, 'supplierimagesearch'])->name('supplier.search');
        // Customer
        Route::get('/customer', [App\Http\Controllers\SuperAdminController::class, 'customerindex'])->name('customer');
        Route::get('customer.create', [App\Http\Controllers\SuperAdminController::class, 'customercreate'])->name('customer.create');
        Route::POST('customer.store', [App\Http\Controllers\SuperAdminController::class, 'customerstore'])->name('customer.store');
        Route::get('customer.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'customeredit'])->name('customer.edit');
        Route::patch('customer.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'customerupdate'])->name('customer.update');
        Route::POST('customer.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'customerdestroy'])->name('customer.deleted');
        // Route::get('customer.{customer}', [App\Http\Controllers\SuperAdminController::class, 'customercustomerName'])->name('customer.customerName');;
        Route::get('customer.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'customerpublish'])->name('customer.publish');
        Route::get('customer.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'customerunpublish'])->name('customer.unpublish');
        Route::post('customer.upload', [App\Http\Controllers\SuperAdminController::class, 'customerupload'])->name('customer.upload');
        Route::get('customer.fetch', [App\Http\Controllers\SuperAdminController::class, 'customerfetch'])->name('customer.fetch');
        Route::get('customer.delete', [App\Http\Controllers\SuperAdminController::class, 'customeruploaddelete'])->name('customer.delete');
        Route::post('customer.search', [App\Http\Controllers\SuperAdminController::class, 'customerimagesearch'])->name('customer.search');
        // biller
        Route::get('/biller', [App\Http\Controllers\SuperAdminController::class, 'billerindex'])->name('biller');
        Route::get('biller.create', [App\Http\Controllers\SuperAdminController::class, 'billercreate'])->name('biller.create');
        Route::post('biller.store', [App\Http\Controllers\SuperAdminController::class, 'billerstore'])->name('biller.store');
        Route::get('biller.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'billeredit'])->name('biller.edit');
        Route::patch('biller.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'billerupdate'])->name('biller.update');
        Route::POST('biller.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'billerdestroy'])->name('biller.deleted');
        Route::get('biller.{biller}', [App\Http\Controllers\SuperAdminController::class, 'billerbillerName'])->name('biller.billerName');;
        Route::get('biller.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'billerpublish'])->name('biller.publish');
        Route::get('biller.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'billerunpublish'])->name('biller.unpublish');
        Route::post('biller.upload', [App\Http\Controllers\SuperAdminController::class, 'billerupload'])->name('biller.upload');
        Route::get('biller.fetch', [App\Http\Controllers\SuperAdminController::class, 'billerfetch'])->name('biller.fetch');
        Route::get('biller.delete', [App\Http\Controllers\SuperAdminController::class, 'billeruploaddelete'])->name('biller.delete');
        Route::post('biller.search', [App\Http\Controllers\SuperAdminController::class, 'billerimagesearch'])->name('biller.search');

        //Coustomer
        Route::get('/coustomer', [App\Http\Controllers\SuperAdminController::class, 'coustomerindex'])->name('coustomer');
        Route::get('coustomer.create', [App\Http\Controllers\SuperAdminController::class, 'coustomercreate'])->name('coustomer.create');
        Route::post('coustomer.store', [App\Http\Controllers\SuperAdminController::class, 'coustomerstore'])->name('coustomer.store');
        Route::get('coustomer.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'coustomeredit'])->name('coustomer.edit');
        Route::patch('coustomer.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'coustomerupdate'])->name('coustomer.update');
        Route::POST('coustomer.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'coustomerdestroy'])->name('coustomer.deleted');
        Route::get('coustomer.{coustomer}', [App\Http\Controllers\SuperAdminController::class, 'coustomercoustomerName'])->name('coustomer.coustomerName');;
        Route::get('coustomer.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'coustomerpublish'])->name('coustomer.publish');
        Route::get('coustomer.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'coustomerunpublish'])->name('coustomer.unpublish');
        Route::post('coustomer.upload', [App\Http\Controllers\SuperAdminController::class, 'coustomerupload'])->name('coustomer.upload');
        Route::get('coustomer.fetch', [App\Http\Controllers\SuperAdminController::class, 'coustomerfetch'])->name('coustomer.fetch');
        Route::get('coustomer.delete', [App\Http\Controllers\SuperAdminController::class, 'coustomeruploaddelete'])->name('coustomer.delete');
        Route::post('coustomer.search', [App\Http\Controllers\SuperAdminController::class, 'coustomerimagesearch'])->name('coustomer.search');

        //Coustomer Group
        Route::get('/coustomergroup', [App\Http\Controllers\SuperAdminController::class, 'coustomerGroupIndex'])->name('coustomergroup');
        Route::get('coustomergroup.create', [App\Http\Controllers\SuperAdminController::class, 'coustomergroupcreate'])->name('coustomergroup.create');
        Route::post('coustomergroup.store', [App\Http\Controllers\SuperAdminController::class, 'coustomergroupstore'])->name('coustomergroup.store');
        Route::get('coustomergroup.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'coustomergroupedit'])->name('coustomergroup.edit');
        Route::POST('coustomergroup.update', [App\Http\Controllers\SuperAdminController::class, 'coustomergroupupdate'])->name('coustomergroup.update');
        Route::DELETE('coustomergroup.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'coustomergroupdestroy'])->name('coustomergroup.deleted');
        Route::POST('coustomergroup.deletebyselection', [App\Http\Controllers\SuperAdminController::class, 'coustomerGroupDeleteBySelection'])->name('coustomergroup.deletebyselection');
        Route::post('importcustomer_group', [App\Http\Controllers\SuperAdminController::class, 'importCustomerGroup'])->name('customer_group.import');
        Route::get('coustomergroup.csv', [App\Http\Controllers\SuperAdminController::class, 'coustomergroupCsv'])->name('coustomergroup.csv');


        //discount
        Route::get('/discount', [App\Http\Controllers\SuperAdminController::class, 'discountindex'])->name('discount');
        Route::get('discount.create', [App\Http\Controllers\SuperAdminController::class, 'discountcreate'])->name('discount.create');
        Route::post('discount.store', [App\Http\Controllers\SuperAdminController::class, 'discountstore'])->name('discount.store');
        Route::get('discount.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'discountedit'])->name('discount.edit');

        Route::patch('discount.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'discountupdate'])->name('discount.update');
        Route::POST('discount.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'discountdestroy'])->name('discount.deleted');
        // Route::get('discount.{discount}', [App\Http\Controllers\SuperAdminController::class, 'discountdiscountName'])->name('discount.discountName');
        Route::get('discount.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'discountpublish'])->name('discount.publish');
        Route::get('discount.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'discountunpublish'])->name('discount.unpublish');
        Route::get('discount.search/{code}', [App\Http\Controllers\SuperAdminController::class, 'discountproductSearch'])->name('discount.search');


        // Route::get('discount.search/{code}',
        // function ($code) {
        //     $lims_product_data = Product::where([
        //         ['product_code', $code],
        //         ['is_active', true]
        //     ])->select('id', 'product_name', 'product_code')->first();

        //     if (!$lims_product_data) {
        //         $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')->where([
        //             ['product_variants.item_code', $code],
        //             ['products.is_active', true]
        //         ])->select('products.id', 'products.product_name', 'products.product_code', 'product_variants.item_code')->first();

        //     }

        //     dd($lims_product_data);
        // })->name('discount.search');





        //discount Plan
        Route::get('/discountPlan', [App\Http\Controllers\SuperAdminController::class, 'discountPlanindex'])->name('discountPlan');
        Route::get('discountPlan.create', [App\Http\Controllers\SuperAdminController::class, 'discountPlancreate'])->name('discountPlan.create');
        Route::post('discountPlan.store', [App\Http\Controllers\SuperAdminController::class, 'discountPlanstore'])->name('discountPlan.store');
        Route::get('discountPlan.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'discountPlanedit'])->name('discountPlan.edit');
        Route::patch('discountPlan.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'discountPlanupdate'])->name('discountPlan.update');
        Route::POST('discountPlan.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'discountPlandestroy'])->name('discountPlan.deleted');
        Route::get('discountPlan.{discountPlan}', [App\Http\Controllers\SuperAdminController::class, 'discountPlandiscountPlanName'])->name('discountPlan.discountPlanName');;
        Route::get('discountPlan.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'discountPlanpublish'])->name('discountPlan.publish');
        Route::get('discountPlan.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'discountPlanunpublish'])->name('discountPlan.unpublish');



        //Reword Poing
        Route::get('/rpoint', [App\Http\Controllers\SuperAdminController::class, 'rpointindex'])->name('rpoint');
        Route::get('rpoint.create', [App\Http\Controllers\SuperAdminController::class, 'rpointcreate'])->name('rpoint.create');
        Route::post('rpoint.store', [App\Http\Controllers\SuperAdminController::class, 'rpointstore'])->name('rpoint.store');
        Route::get('rpoint.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'rpointedit'])->name('rpoint.edit');
        Route::patch('rpoint.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'rpointupdate'])->name('rpoint.update');
        Route::POST('rpoint.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'rpointdestroy'])->name('rpoint.deleted');
        Route::get('rpoint.{rpoint}', [App\Http\Controllers\SuperAdminController::class, 'rpointrpointName'])->name('rpoint.rpointName');;
        Route::get('rpoint.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'rpointpublish'])->name('rpoint.publish');
        Route::get('rpoint.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'rpointunpublish'])->name('rpoint.unpublish');
        Route::post('rpoint.upload', [App\Http\Controllers\SuperAdminController::class, 'rpointupload'])->name('rpoint.upload');
        Route::get('rpoint.fetch', [App\Http\Controllers\SuperAdminController::class, 'rpointfetch'])->name('rpoint.fetch');
        Route::get('rpoint.delete', [App\Http\Controllers\SuperAdminController::class, 'rpointuploaddelete'])->name('rpoint.delete');
        Route::post('rpoint.search', [App\Http\Controllers\SuperAdminController::class, 'rpointimagesearch'])->name('rpoint.search'); //

        //Pos Setting
        Route::get('/possetting', [App\Http\Controllers\SuperAdminController::class, 'posSetting'])->name('possetting');
        Route::post('possetting.store', [App\Http\Controllers\SuperAdminController::class, 'posSettingStore'])->name('possetting.store');



        // purchase
        Route::get('/purchase', [App\Http\Controllers\SuperAdminController::class, 'purchaseindex'])->name('purchase');
        Route::get('purchase.create', [App\Http\Controllers\SuperAdminController::class, 'purchasecreate'])->name('purchase.create');
        Route::post('purchase.store', [App\Http\Controllers\SuperAdminController::class, 'purchasestore'])->name('purchase.store');
	    Route::post('purchases.add_payment',  [App\Http\Controllers\SuperAdminController::class, 'purchaseAddPayment'])->name('purchase.add-payment');
        Route::get('purchases.getpayment/{id}', [App\Http\Controllers\SuperAdminController::class, 'purchaseGetPayment'])->name('purchases.getpayment');
        Route::post('purchases.deletepayment', [App\Http\Controllers\SuperAdminController::class, 'purchaseDeletePayment'])->name('purchase.delete-payment');

	    Route::post('purchases.updatepayment',  [App\Http\Controllers\SuperAdminController::class, 'purchaseUpdatePayment'])->name('purchase.update-payment');
        Route::get('purchase.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'purchaseedit'])->name('purchase.edit');
        Route::put('purchase.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'purchaseupdate'])->name('purchase.update');
        Route::get('purchase.search', [App\Http\Controllers\SuperAdminController::class, 'limsProductSearch'])->name('purchase.search');
        Route::get('purchases.product_purchase/{id}', [App\Http\Controllers\SuperAdminController::class, 'purchasesProductPurchase'])->name('purchases.product_purchase');

        Route::POST('purchase.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'purchasedestroy'])->name('purchase.deleted');
        // Route::patch('purchase.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'purchaseupdate'])->name('purchase.update');

        // purchase return

        Route::get('return-purchase', [App\Http\Controllers\SuperAdminController::class, 'returnPurchaseIndex'])->name('return-purchase');
        Route::get('return-purchase.create', [App\Http\Controllers\SuperAdminController::class, 'returnPurchaseCreate'])->name('return-purchase.create');
        Route::post('return-purchase.store', [App\Http\Controllers\SuperAdminController::class, 'returnPurchaseStore'])->name('return-purchase.store');
        Route::get('return-purchase.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'returnPurchaseEdit'])->name('return-purchase.edit');
        Route::put('return-purchase.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'returnPurchaseUpdate'])->name('return-purchase.update');


        Route::post('return-purchase.return-data', [App\Http\Controllers\SuperAdminController::class, 'returnPurchaseReturnData'])->name('return-purchase.return-data');
        Route::get('return-purchase.getcustomergroup/{id}',  [App\Http\Controllers\SuperAdminController::class, 'returnPurchaseGetcustomergroup'])->name('return-purchase.getcustomergroup');
        Route::post('return-purchase.sendmail',  [App\Http\Controllers\SuperAdminController::class, 'returnPurchaseSendmail'])->name('return-purchase.sendmail');
        Route::get('return-purchase.getproduct/{id}',  [App\Http\Controllers\SuperAdminController::class, 'returnPurchaseGetproduct'])->name('return-purchase.getproduct');
        Route::get('return-purchase.lims_product_search',  [App\Http\Controllers\SuperAdminController::class, 'returnPurchaseProductSearch'])->name('return-purchase.lims_product_search');
        Route::get('return-purchase.product_return/{id}', [App\Http\Controllers\SuperAdminController::class, 'returnPurchaseProductReturn'])->name('return-purchase.product_return');
        Route::get('returnPurchase.checkBatchAvailability/{product_id}/{batch_no}/{warehouse_id}', [App\Http\Controllers\SuperAdminController::class, 'saleCheckBatchAvailability'])->name('returnPurchase.checkBatchAvailability');
        Route::POST('return-purchase.delete/{id}',  [App\Http\Controllers\SuperAdminController::class, 'returnpurchasedestroy'])->name('return-purchase.delete');

        // Route::post('return-purchase/deletebyselection', 'ReturnPurchaseController@deleteBySelection');
        // Route::resource('return-purchase', 'ReturnPurchaseController');
        // Route::resource('return-sale', 'ReturnController');

        Route::get('return-sale', [App\Http\Controllers\SuperAdminController::class, 'returnSaleIndex'])->name('return-sale');
        Route::get('return-sale.create', [App\Http\Controllers\SuperAdminController::class, 'returnSaleCreate'])->name('return-sale.create');
        Route::post('return-sale.store', [App\Http\Controllers\SuperAdminController::class, 'returnSaleStore'])->name('return-sale.store');
        Route::get('return-sale.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'returnSaleEdit'])->name('return-sale.edit');
        Route::put('return-sale.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'returnSaleUpdate'])->name('return-sale.update');
        Route::POST('return-sale.delete/{id}',  [App\Http\Controllers\SuperAdminController::class, 'returnsaledestroy'])->name('return-sale.delete');

        Route::get('return-sale.getcustomergroup/{id}', [App\Http\Controllers\SuperAdminController::class, 'returnGetCustomerGroup'])->name('return-sale.getcustomergroup');
        Route::post('return-sale/sendmail', [App\Http\Controllers\SuperAdminController::class, 'returnSendMail'])->name('return-sale.sendmail');
        Route::get('return-sale.getproduct/{id}', [App\Http\Controllers\SuperAdminController::class, 'returnGetProduct'])->name('return-sale.getproduct');
        Route::get('return-sale.lims_product_search', [App\Http\Controllers\SuperAdminController::class, 'returnLimsProductSearch'])->name('return-sale.lims_product_search');
        Route::post('return-sale/return-data',  [App\Http\Controllers\SuperAdminController::class, 'returnData'] );
        Route::get('return-sale/product_return/{id}', [App\Http\Controllers\SuperAdminController::class, 'productReturnData']);
        Route::post('return-sale/deletebyselection',  [App\Http\Controllers\SuperAdminController::class, 'deleteBySelection']);




      // productlist
        Route::get('/products', [App\Http\Controllers\SuperAdminController::class, 'productsindex'])->name('products');
        Route::get('products.create', [App\Http\Controllers\SuperAdminController::class, 'productscreate'])->name('products.create');
        Route::post('products.store', [App\Http\Controllers\SuperAdminController::class, 'productsstore'])->name('products.store');
        Route::get('products.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'productsedit'])->name('products.edit');
        Route::post('products.sellUnit',[App\Http\Controllers\SuperAdminController::class, 'productssellUnit'])->name('products.sellUnit');
        Route::post('products.purchaseUnit',[App\Http\Controllers\SuperAdminController::class, 'productspurchaseUnit'])->name('products.purchaseUnit');
        Route::get('products.sellUnitId/{id}',[App\Http\Controllers\SuperAdminController::class, 'productssellUnitId'])->name('products.sellUnitId');
        Route::get('products.purchaseUnitId/{id}',[App\Http\Controllers\SuperAdminController::class, 'productspurchaseUnitId'])->name('products.purchaseUnitId');
        Route::post('products.update', [App\Http\Controllers\SuperAdminController::class, 'productsupdate'])->name('products.update');
        Route::get('products.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'productspublish'])->name('products.publish');
        Route::get('products.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'productsunpublish'])->name('products.unpublish');
        Route::post('products.multipledelete', [App\Http\Controllers\SuperAdminController::class, 'productsmultipledelete'])->name('products.multipledelete');
        Route::get('products.search', [App\Http\Controllers\SuperAdminController::class, 'productssearch'])->name('products.search');
        Route::get('products.show/{slug}', [App\Http\Controllers\SuperAdminController::class, 'productsshow'])->name('products.show');
        Route::get('products.archive', [App\Http\Controllers\SuperAdminController::class, 'productsarchive'])->name('products.archive');
        Route::get('products.archivereturn/{id}', [App\Http\Controllers\SuperAdminController::class, 'productsarchivereturn'])->name('products.archivereturn');
        Route::get('products.archivedistroy/{id}', [App\Http\Controllers\SuperAdminController::class, 'productsarchivedistroy'])->name('products.archivedistroy');
        Route::post('products.archivemultipledelete', [App\Http\Controllers\SuperAdminController::class, 'productsarchivemultipledelete'])->name('products.archivemultipledelete');
        // Route::get('page.search', [App\Http\Controllers\SuperAdminController::class, 'pagesearch'])->name('page.search');
        Route::get('products.slugsearch', [App\Http\Controllers\SuperAdminController::class, 'productsslugsearch'])->name('products.slugsearch');
        // Route::get('products.{products}', [App\Http\Controllers\SuperAdminController::class, 'productsproductsName'])->name('productss.productsproductsName');;
        Route::post('/products.upload', [App\Http\Controllers\SuperAdminController::class, 'productsupload'])->name('products.upload');
        Route::get('/products.fetch', [App\Http\Controllers\SuperAdminController::class, 'productsfetch'])->name('products.fetch');
        Route::post('/productss.imgsearch', [App\Http\Controllers\SuperAdminController::class, 'productsimgsearch'])->name('productss.imgsearch');
        Route::get('/products/lims_product_search', [App\Http\Controllers\SuperAdminController::class, 'limsProductSearch'])->name('products.lims_product_search');
        Route::get('products/saleunit/{id}', [App\Http\Controllers\SuperAdminController::class, 'saleUnit'])->name('products.saleunit');
        Route::post('products.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'productsdestroy'])->name('products.deleted');


        // -------------------------

        // Route::get('productss/lims_product_search', 'limsProductSearch')->name('product.search');
// Route::get('products/variant-data/{id}','variantData');
// Route::get('products/history', 'history')->name('products.history');
// Route::post('products/sale-history-data', 'saleHistoryData');
// Route::post('products/purchase-history-data', 'purchaseHistoryData');
// Route::post('products/sale-return-history-data', 'saleReturnHistoryData');
// Route::post('products/purchase-return-history-data', 'purchaseReturnHistoryData');
// Route::get('check-batch-availability/{product_id}/{batch_no}/{warehouse_id}', 'checkBatchAvailability');



// Route::post('importproduct', 'importProduct')->name('product.import');
// Route::post('exportproduct', 'exportProduct')->name('product.export');
// Route::post('products/deletebyselection', 'deleteBySelection');
// Route::get('products/saleunit/{id}', 'saleUnit');
// Route::get('products/getdata/{id}/{variant_id}', 'getData');
// Route::get('products/product_warehouse/{id}', 'productWarehouseData');
// Route::get('products/print_barcode','printBarcode')->name('product.printBarcode');

// ----------------------------


        // Sales
        Route::get('/sale', [App\Http\Controllers\SuperAdminController::class, 'saleindex'])->name('sale');
        Route::get('sale.create', [App\Http\Controllers\SuperAdminController::class, 'salecreate'])->name('sale.create');
        // Route::get('sale_id/{id}/create', [App\Http\Controllers\SuperAdminController::class, 'createSale']);
        Route::get('sale/{id}/create',  [App\Http\Controllers\SuperAdminController::class, 'createSale']);
        Route::post('sale.store', [App\Http\Controllers\SuperAdminController::class, 'salestore'])->name('sale.store');
        Route::post('sale.cashRegister', [App\Http\Controllers\SuperAdminController::class, 'saleCashRegister'])->name('sale.cashRegister');
        Route::get('sale.getpayment/{id}', [App\Http\Controllers\SuperAdminController::class, 'saleGetPayment'])->name('sale.getpayment');
        Route::get('sale.getProduct/{id}', [App\Http\Controllers\SuperAdminController::class, 'sellGetProduct'])->name('sale.getProduct');
        Route::get('sale.getcustomergroup/{id}', [App\Http\Controllers\SuperAdminController::class, 'saleGetcustomergroup'])->name('sale.getcustomergroup');
        Route::post('sale.deletepayment', [App\Http\Controllers\SuperAdminController::class, 'saleDeletePayment'])->name('sale.delete-payment');
        Route::post('sale.add_payment',  [App\Http\Controllers\SuperAdminController::class, 'saleAddPayment'])->name('sale.add-payment');
        Route::post('sale.updatepayment',  [App\Http\Controllers\SuperAdminController::class, 'saleUpdatePayment'])->name('sale.update-payment');
        Route::get('sale.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'saleedit'])->name('sale.edit');
        Route::put('sale.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'saleupdate'])->name('sale.update');
        Route::get('sale.show/{id}', [App\Http\Controllers\SuperAdminController::class, 'saleproduct'])->name('sale.show');
        Route::get('sale.productSearch', [App\Http\Controllers\SuperAdminController::class, 'saleProductSearch'])->name('sale.productSearch');
        // Route::get('sales/lims_product_search', 'SaleController@limsProductSearch')->name('product_sale.search');
        Route::get('sale.product_sale/{id}', [App\Http\Controllers\SuperAdminController::class, 'saleProductSale'])->name('sale.product_sale');
        Route::POST('sale.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'saledestroy'])->name('sale.deleted');

        Route::post('sale.sendmail',  [App\Http\Controllers\SuperAdminController::class, 'saleSendMail'])->name('sale.sendmail');
        Route::get('sale.delivery.create/{id}', [App\Http\Controllers\SuperAdminController::class, 'saleDeliveryCreate'])->name('sale.delivery.create');
        Route::post('sale.delivery',  [App\Http\Controllers\SuperAdminController::class, 'saleDeliveryStore'])->name('sale.delivery');
        // Route::patch('sale.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'saleupdate'])->name('sale.update');
        Route::get('sale.checkAvailability/{id}', [App\Http\Controllers\SuperAdminController::class, 'salecheckAvailability'])->name('sale.checkAvailability');
        Route::get('sale.getGiftCard', [App\Http\Controllers\SuperAdminController::class, 'saleGetGiftCard'])->name('sale.getGiftCard');

        Route::get('sale.checkBatchAvailability/{product_id}/{batch_no}/{warehouse_id}', [App\Http\Controllers\SuperAdminController::class, 'saleCheckBatchAvailability'])->name('sale.checkBatchAvailability');
        Route::GET('sale.check_discount',  [App\Http\Controllers\SuperAdminController::class, 'saleCheckDiscount'])->name('sale.check_discount');
        Route::GET('sale.invoice/{id}',  [App\Http\Controllers\SuperAdminController::class, 'saleGenInvoice'])->name('sale.invoice');
        Route::get('sale.cashRegister.checkAvailability/{warehouse_id}', [App\Http\Controllers\SuperAdminController::class, 'saleCashRegisterCheckAvailability'])->name('sale.cashRegister.checkAvailability');

        // POS
        Route::get('sale.printLastReciept', [App\Http\Controllers\SuperAdminController::class, 'salePrintLastReciept'] )->name('sale.printLastReciept');
        Route::get('sale.getProductFilter/{category_id}/{brand_id}', [App\Http\Controllers\SuperAdminController::class, 'getProductByFilter']);
        Route::get('sale.pos', [App\Http\Controllers\SuperAdminController::class, 'salePos'])->name('sale.pos');
        Route::get('sale.todaySale',  [App\Http\Controllers\SuperAdminController::class, 'todaySale']);
        Route::get('sale.todayProfit/{warehouse_id}',  [App\Http\Controllers\SuperAdminController::class, 'todayProfit']);
        Route::get('sales.getfeatured', [App\Http\Controllers\SuperAdminController::class, 'getFeatured']);
        //Reward Point setting
        Route::get('/rewardPointSetting', [App\Http\Controllers\SuperAdminController::class, 'rewardPointSetting'])->name('rewardPointSetting');
        Route::Post('rewardPointSettingStore', [App\Http\Controllers\SuperAdminController::class, 'rewardPointSettingStore'])->name('rewardPointSettingStore');

        //Cash register
        Route::get('/cashRegister', [App\Http\Controllers\SuperAdminController::class, 'cashRegisterindex'])->name('cashRegister');
        Route::get('cashRegister.create', [App\Http\Controllers\SuperAdminController::class, 'cashRegistercreate'])->name('cashRegister.create');
        Route::post('cashRegister.store', [App\Http\Controllers\SuperAdminController::class, 'cashRegisterstore'])->name('cashRegister.store');
        Route::get('cashRegister.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'cashRegisteredit'])->name('cashRegister.edit');
        Route::patch('cashRegister.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'cashRegisterupdate'])->name('cashRegister.update');
        Route::POST('cashRegister.destroy/{id}', [App\Http\Controllers\SuperAdminController::class, 'cashRegisterdestroy'])->name('cashRegister.destroy');
        Route::get('cashRegister.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'cashRegisterpublish'])->name('cashRegister.publish');
        Route::get('cashRegister.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'cashRegisterunpublish'])->name('cashRegister.unpublish');
        Route::get('cashRegister.generate', [App\Http\Controllers\SuperAdminController::class, 'cashRegisterGenerateCode'])->name('cashRegister.generate');
        Route::POST('cashRegister.close', [App\Http\Controllers\SuperAdminController::class, 'cashRegisterclose'])->name('cashRegister.close');

        Route::get('cash-register/getDetails/{id}', [App\Http\Controllers\SuperAdminController::class, 'getDetails']);





        Route::get('cash-register/showDetails/{warehouse_id}', [App\Http\Controllers\SuperAdminController::class, 'showDetails']);



        //Coupon
        Route::get('/coupon', [App\Http\Controllers\SuperAdminController::class, 'couponindex'])->name('coupon');
        Route::get('coupon.create', [App\Http\Controllers\SuperAdminController::class, 'couponcreate'])->name('coupon.create');
        Route::post('coupon.store', [App\Http\Controllers\SuperAdminController::class, 'couponstore'])->name('coupon.store');
        Route::get('coupon.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'couponedit'])->name('coupon.edit');
        Route::patch('coupon.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'couponupdate'])->name('coupon.update');
        Route::POST('coupon.destroy/{id}', [App\Http\Controllers\SuperAdminController::class, 'coupondestroy'])->name('coupon.destroy');
        Route::get('coupon.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'couponpublish'])->name('coupon.publish');
        Route::get('coupon.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'couponunpublish'])->name('coupon.unpublish');
        Route::get('coupon.generate', [App\Http\Controllers\SuperAdminController::class, 'couponGenerateCode'])->name('coupon.generate');

        //Gift card
        Route::get('/giftcard', [App\Http\Controllers\SuperAdminController::class, 'giftcardindex'])->name('giftcard');
        Route::get('giftcard.create', [App\Http\Controllers\SuperAdminController::class, 'giftcardcreate'])->name('giftcard.create');
        Route::post('giftcard.store', [App\Http\Controllers\SuperAdminController::class, 'giftcardstore'])->name('giftcard.store');
        Route::get('giftcard.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'giftcardedit'])->name('giftcard.edit');
        Route::POST('giftcard.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'giftcardupdate'])->name('giftcard.update');
        Route::POST('giftcard.destroy/{id}', [App\Http\Controllers\SuperAdminController::class, 'giftcarddestroy'])->name('giftcard.destroy');
        Route::get('giftcard.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'giftcardpublish'])->name('giftcard.publish');
        Route::get('giftcard.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'giftcardunpublish'])->name('giftcard.unpublish');
        Route::get('giftcard.generate', [App\Http\Controllers\SuperAdminController::class, 'giftcardGenerateCode'])->name('giftcard.generate');
        Route::POST('giftcard.recharge/{id}', [App\Http\Controllers\SuperAdminController::class, 'giftcardrecharge'])->name('giftcard.recharge');


        //Courier
        Route::get('/courier', [App\Http\Controllers\SuperAdminController::class, 'courierindex'])->name('courier');
        Route::get('courier.create', [App\Http\Controllers\SuperAdminController::class, 'couriercreate'])->name('courier.create');
        Route::post('courier.store', [App\Http\Controllers\SuperAdminController::class, 'courierstore'])->name('courier.store');
        Route::get('courier.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'courieredit'])->name('courier.edit');
        Route::patch('courier.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'courierupdate'])->name('courier.update');
        Route::POST('courier.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'courierdestroy'])->name('courier.deleted');

        //Delivery
        Route::get('/delivery', [App\Http\Controllers\SuperAdminController::class, 'deliveryindex'])->name('delivery');
        Route::get('delivery.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'deliveryedit'])->name('delivery.edit');
        Route::POST('delivery.update', [App\Http\Controllers\SuperAdminController::class, 'deliveryupdate'])->name('delivery.update');
        Route::POST('delivery.sendMail', [App\Http\Controllers\SuperAdminController::class, 'deliverysendMail'])->name('delivery.sendMail');
        Route::get('delivery.product_delivery/{id}', [App\Http\Controllers\SuperAdminController::class, 'productDeliveryData'])->name('delivery.product_delivery');
        Route::POST('delivery.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'deliverydestroy'])->name('delivery.deleted');

        //Genarel Setting
        Route::get('/ganeralsetting', [App\Http\Controllers\SuperAdminController::class, 'ganeralsettingindex'])->name('ganeralsetting');
        Route::get('ganeralsetting.create', [App\Http\Controllers\SuperAdminController::class, 'ganeralsettingcreate'])->name('ganeralsetting.create');
        Route::post('ganeralsetting.store', [App\Http\Controllers\SuperAdminController::class, 'ganeralsettingstore'])->name('ganeralsetting.store');
        Route::get('ganeralsetting.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'ganeralsettingedit'])->name('ganeralsetting.edit');
        Route::POST('ganeralsetting.update', [App\Http\Controllers\SuperAdminController::class, 'ganeralsettingupdate'])->name('ganeralsetting.update');
        Route::POST('ganeralsetting.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'ganeralsettingdestroy'])->name('ganeralsetting.deleted');
        Route::get('generalsetting/change-theme/{theme}',  [App\Http\Controllers\SuperAdminController::class, 'changeTheme']);

        Route::get('ganeralsetting.sms', [App\Http\Controllers\SuperAdminController::class, 'smsSetting'])->name('ganeralsetting.sms');
        Route::POST('ganeralsetting.smsStore', [App\Http\Controllers\SuperAdminController::class, 'smsSettingStore'])->name('ganeralsetting.smsStore');
        Route::get('ganeralsetting.createSms', [App\Http\Controllers\SuperAdminController::class, 'createSms'])->name('ganeralsetting.createSms');
        Route::POST('ganeralsetting.sendSms', [App\Http\Controllers\SuperAdminController::class, 'sendSms'])->name('ganeralsetting.sendSms');


        Route::get('ganeralsetting.superadminsetting', [App\Http\Controllers\SuperAdminController::class, 'superadminGeneralSetting'])->name('ganeralsetting.superadminsetting');
        Route::POST('ganeralsetting.superadminsettingStore', [App\Http\Controllers\SuperAdminController::class, 'superadminGeneralSettingStore'])->name('ganeralsetting.superadminsettingStore');
        Route::get('ganeralsetting.backup', [App\Http\Controllers\SuperAdminController::class, 'backup'])->name('ganeralsetting.backup');








	// Route::get('setting/mail_setting', 'SettingController@mailSetting')->name('setting.mail');
	// Route::get('setting/sms_setting', 'SettingController@smsSetting')->name('setting.sms');
	// Route::get('setting/createsms', 'SettingController@createSms')->name('setting.createSms');
	// Route::post('setting/sendsms', 'SettingController@sendSms')->name('setting.sendSms');
	// Route::get('setting/hrm_setting', 'SettingController@hrmSetting')->name('setting.hrm');
	// Route::post('setting/hrm_setting_store', 'SettingController@hrmSettingStore')->name('setting.hrmStore');
	// Route::post('setting/mail_setting_store', 'SettingController@mailSettingStore')->name('setting.mailStore');
	// Route::post('setting/sms_setting_store', 'SettingController@smsSettingStore')->name('setting.smsStore');
	// Route::get('setting/pos_setting', 'SettingController@posSetting')->name('setting.pos');
	// Route::post('setting/pos_setting_store', 'SettingController@posSettingStore')->name('setting.posStore');
	// Route::get('setting/empty-database', 'SettingController@emptyDatabase')->name('setting.emptyDatabase');



        // expense
        Route::post('expense_categories/import',  [App\Http\Controllers\SuperAdminController::class, 'expenseCategoriesImport'])->name('expense_category.import');
        Route::post('expense_categories/deletebyselection', 'ExpenseCategoryController@deleteBySelection');

        Route::get('/expense_categories', [App\Http\Controllers\SuperAdminController::class, 'expenseCategoriesIngindex'])->name('expense_categories');
        Route::get('expense_categories.create', [App\Http\Controllers\SuperAdminController::class, 'expense_categoriescreate'])->name('expense_categories.create');
        Route::post('expense_categories.store', [App\Http\Controllers\SuperAdminController::class, 'expenseCategoriesstore'])->name('expense_categories.store');
        Route::get('expense_categories.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'expenseCategoriesEdit'])->name('expense_categories.edit');
        Route::put('expense_categories.update', [App\Http\Controllers\SuperAdminController::class, 'expenseCategoriesUpdate'])->name('expense_categories.update');
        Route::DELETE('expense_categories.destroy/{id}', [App\Http\Controllers\SuperAdminController::class, 'expenseCategoriesDestroy'])->name('expense_categories.destroy');

        // Route::resource('expense_categories', 'ExpenseCategoryController');
        Route::get('expense_categories/gencode', [App\Http\Controllers\SuperAdminController::class, 'expensegenerateCode']);
        // Route::get('expense_categories/gencode', 'ExpenseCategoryController@generateCode');

        // Route::resource('expenses', 'ExpenseController');
        Route::get('/expenses', [App\Http\Controllers\SuperAdminController::class, 'expenseIngindex'])->name('expenses');
        Route::get('expenses.create', [App\Http\Controllers\SuperAdminController::class, 'expensescreate'])->name('expenses.create');
        Route::post('expenses.store', [App\Http\Controllers\SuperAdminController::class, 'expensesstore'])->name('expenses.store');
        Route::get('expenses.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'expensesedit'])->name('expenses.edit');
        Route::post('expenses.update', [App\Http\Controllers\SuperAdminController::class, 'expensesupdate'])->name('expenses.update');
        Route::POST('expenses.deleted/{id}', [App\Http\Controllers\SuperAdminController::class, 'expensesdestroy'])->name('expenses.deleted');

        Route::post('expenses/expense-data', [App\Http\Controllers\SuperAdminController::class, 'expenseData'])->name('expenses.data');
        Route::post('expenses/deletebyselection', 'ExpenseController@deleteBySelection');

        // Reporting
    Route::get('report.qtyAlert', [App\Http\Controllers\SuperAdminController::class, 'productQuantityAlert'])->name('report.qtyAlert');
	Route::get('report.dailySaleObjective', [App\Http\Controllers\SuperAdminController::class, 'dailySaleObjective'])->name('report.dailySaleObjective');
	Route::get('report.productExpiry', [App\Http\Controllers\SuperAdminController::class, 'productExpiry'])->name('report.productExpiry');
	Route::get('report.warehouseStock', [App\Http\Controllers\SuperAdminController::class, 'warehouseStock'])->name('report.warehouseStock');

    Route::post('report/daily_sale/{year}/{month}', [App\Http\Controllers\SuperAdminController::class, 'dailySaleByWarehouse'] )->name('report.dailySaleByWarehouse');
    Route::post('report/monthly_sale/{year}', [App\Http\Controllers\SuperAdminController::class, 'monthlySaleByWarehouse'])->name('report.monthlySaleByWarehouse');
    Route::post('report/daily_purchase/{year}/{month}', [App\Http\Controllers\SuperAdminController::class, 'dailyPurchaseByWarehouse'] )->name('report.dailyPurchaseByWarehouse');
    Route::post('report/monthly_purchase/{year}', [App\Http\Controllers\SuperAdminController::class, 'monthlyPurchaseByWarehouse'])->name('report.monthlyPurchaseByWarehouse');
    Route::post('report/best_seller', [App\Http\Controllers\SuperAdminController::class, 'bestSellerByWarehouse'])->name('report.bestSellerByWarehouse');
    Route::post('report/profit_loss', [App\Http\Controllers\SuperAdminController::class, 'profitLoss'] )->name('report.profitLoss');
    Route::get('report/product_report', [App\Http\Controllers\SuperAdminController::class, 'productReport']  )->name('report.product');
    Route::post('report/purchase', [App\Http\Controllers\SuperAdminController::class, 'purchaseReport'])->name('report.purchase');
    Route::post('report/sale_report', [App\Http\Controllers\SuperAdminController::class, 'saleReport'])->name('report.sale');
    Route::post('report/sale-report-chart', [App\Http\Controllers\SuperAdminController::class, 'saleReportChart'])->name('report.saleChart');
    Route::post('report/payment_report_by_date', [App\Http\Controllers\SuperAdminController::class, 'paymentReportByDate'] )->name('report.paymentByDate');
    Route::post('report/warehouse_report', [App\Http\Controllers\SuperAdminController::class, 'warehouseReport'] )->name('report.warehouse');
    Route::post('report/user_report', [App\Http\Controllers\SuperAdminController::class, 'userReport']  )->name('report.user');
    Route::post('report/customer_report', [App\Http\Controllers\SuperAdminController::class, 'customerReport'])->name('report.customer');
    Route::post('report/supplier',  [App\Http\Controllers\SuperAdminController::class, 'supplierReport'])->name('report.supplier');
    Route::post('report/customer-due-report', [App\Http\Controllers\SuperAdminController::class, 'customerDueReportByDate'])->name('report.customerDueByDate');
    Route::post('report/supplier-due-report', [App\Http\Controllers\SuperAdminController::class, 'supplierDueReportByDate'])->name('report.supplierDueByDate');

    Route::get('report/daily_sale/{year}/{month}', [App\Http\Controllers\SuperAdminController::class, 'dailySale'] );
    Route::get('report/monthly_sale/{year}', [App\Http\Controllers\SuperAdminController::class, 'monthlySale'] );
    Route::get('report/best_seller', [App\Http\Controllers\SuperAdminController::class, 'bestSeller'] );

    Route::get('report/daily_purchase/{year}/{month}', [App\Http\Controllers\SuperAdminController::class, 'dailyPurchase'] );
    Route::get('report/monthly_purchase/{year}', [App\Http\Controllers\SuperAdminController::class, 'monthlyPurchase'] );

    Route::get('report/product_report_data', [App\Http\Controllers\SuperAdminController::class, 'productReportData'] )->name('report/product_report_data');


    // Route::post('report/product_report_data', 'ReportController@productReportData');

	// Route::post('report/daily-sale-objective-data', 'ReportController@dailySaleObjectiveData');
	// Route::get('report/daily_sale/{year}/{month}', 'ReportController@dailySale');
	// Route::get('report/monthly_sale/{year}', 'ReportController@monthlySale');
	// Route::get('report/best_seller', 'ReportController@bestSeller');
	// Route::get('report/daily_purchase/{year}/{month}', 'ReportController@dailyPurchase');
	// Route::get('report/monthly_purchase/{year}', 'ReportController@monthlyPurchase');


        // Post
        Route::get('/post', [App\Http\Controllers\SuperAdminController::class, 'postindex'])->name('post');
        Route::get('post.create', [App\Http\Controllers\SuperAdminController::class, 'postcreate'])->name('post.create');
        Route::post('post.store', [App\Http\Controllers\SuperAdminController::class, 'poststore'])->name('post.store');
        Route::get('post.show/{slug}', [App\Http\Controllers\SuperAdminController::class, 'postshow'])->name('post.show');

        Route::get('post.archive', [App\Http\Controllers\SuperAdminController::class, 'postarchive'])->name('post.archive');
        Route::get('post.archivereturn/{id}', [App\Http\Controllers\SuperAdminController::class, 'postarchivereturn'])->name('post.archivereturn');
        Route::get('post.archivedistroy/{id}', [App\Http\Controllers\SuperAdminController::class, 'postarchivedistroy'])->name('post.archivedistroy');
        Route::post('post.archivemultipledelete', [App\Http\Controllers\SuperAdminController::class, 'postarchivemultipledelete'])->name('post.archivemultipledelete');

        Route::get('post.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'postedit'])->name('post.edit');
        Route::post('post.update', [App\Http\Controllers\SuperAdminController::class, 'postupdate'])->name('post.update');
        Route::get('post.delete/{id}', [App\Http\Controllers\SuperAdminController::class, 'postdestroy'])->name('post.delete');
        Route::get('post.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'postpublish'])->name('post.publish');
        Route::get('post.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'postunpublish'])->name('post.unpublish');
        Route::post('post.multipledelete', [App\Http\Controllers\SuperAdminController::class, 'postmultipledelete'])->name('post.multipledelete');
        Route::get('post.search', [App\Http\Controllers\SuperAdminController::class, 'postsearch'])->name('post.search');

        // Route::get('page.search', [App\Http\Controllers\SuperAdminController::class, 'pagesearch'])->name('page.search');

        Route::get('post.slugsearch', [App\Http\Controllers\SuperAdminController::class, 'postslugsearch'])->name('post.slugsearch');
        Route::get('post.{post}', [App\Http\Controllers\SuperAdminController::class, 'postpostName'])->name('posts.postpostName');;

        Route::post('/post.upload', [App\Http\Controllers\SuperAdminController::class, 'postupload'])->name('post.upload');
        Route::get('/posts.fetch', [App\Http\Controllers\SuperAdminController::class, 'postsfetch'])->name('posts.fetch');
        Route::get('/posts.deleted', [App\Http\Controllers\SuperAdminController::class, 'postuploaddelete'])->name('posts.deleted');
        Route::post('/posts.imgsearch', [App\Http\Controllers\SuperAdminController::class, 'postimgsearch'])->name('posts.imgsearch');



        // comments
        Route::get('/comments', [App\Http\Controllers\SuperAdminController::class, 'commentsindex'])->name('comments');
        Route::get('comments.view/{id}', [App\Http\Controllers\SuperAdminController::class, 'commentsview'])->name('comments.view');
        Route::get('comments.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'commentspublish'])->name('comments.publish');
        Route::get('comments.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'commentsunpublish'])->name('comments.unpublish');
        Route::post('/comments.store', [App\Http\Controllers\SuperAdminController::class, 'commentsstore'])->name('comments.store');
        Route::post('reply.add', [App\Http\Controllers\SuperAdminController::class, 'replyStore'])->name('reply.add');
        Route::get('comment.return/{id}', [App\Http\Controllers\SuperAdminController::class, 'commentreturn'])->name('comment.return');
        Route::get('comment.archive', [App\Http\Controllers\SuperAdminController::class, 'commentarchive'])->name('comment.archive');
        Route::get('soft.delete/{id}', [App\Http\Controllers\SuperAdminController::class, 'softdelete'])->name('soft.delete');
        Route::get('comment.delete/{id}', [App\Http\Controllers\SuperAdminController::class, 'commentdelete'])->name('comment.delete');
        Route::get('comments.distroy/{id}', [App\Http\Controllers\SuperAdminController::class, 'commentdistroy'])->name('comments.distroy');
        Route::post('comment.multipledelete', [App\Http\Controllers\SuperAdminController::class, 'commentmultipledelete'])->name('comment.multipledelete');



    // page
        Route::get('page', [App\Http\Controllers\SuperAdminController::class, 'pageindex'])->name('page');
        Route::get('page.create', [App\Http\Controllers\SuperAdminController::class, 'pagecreate'])->name('page.create');
        Route::post('page.store', [App\Http\Controllers\SuperAdminController::class, 'pagestore'])->name('page.store');

        Route::get('page.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'pageedit'])->name('page.edit');
        Route::post('page.update', [App\Http\Controllers\SuperAdminController::class, 'pageupdate'])->name('page.update');
        Route::get('page.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'pagepublish'])->name('page.publish');
        Route::get('page.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'pageunpublish'])->name('page.unpublish');
        Route::get('page.delete/{id}', [App\Http\Controllers\SuperAdminController::class, 'pagedestroy'])->name('page.delete');;
        Route::post('page.multipledelete', [App\Http\Controllers\SuperAdminController::class, 'pagemultipledelete'])->name('page.multipledelete');
        Route::get('page.search', [App\Http\Controllers\SuperAdminController::class, 'pagesearch'])->name('page.search');
        Route::get('page.slugsearch', [App\Http\Controllers\SuperAdminController::class, 'pageslugsearch'])->name('page.slugsearch');

        Route::get('page.archived', [App\Http\Controllers\SuperAdminController::class, 'pagearchived'])->name('page.archived');
        Route::get('page.archivereturn/{id}', [App\Http\Controllers\SuperAdminController::class, 'pagearchivereturn'])->name('page.archivereturn');
        Route::get('page.archivedistroy/{id}', [App\Http\Controllers\SuperAdminController::class, 'pagearchivedistroy'])->name('page.archivedistroy');
        Route::post('page.archivemultipledelete', [App\Http\Controllers\SuperAdminController::class, 'pagearchivemultipledelete'])->name('page.archivemultipledelete');

        //Slider part
        // ===========================================
        Route::get('/slider', [App\Http\Controllers\SuperAdminController::class, 'sliderindex'])->name('slider');
        Route::get('slider.create', [App\Http\Controllers\SuperAdminController::class, 'slidercreate'])->name('slider.create');
        Route::post('slider.store', [App\Http\Controllers\SuperAdminController::class, 'sliderstore'])->name('slider.store');
        Route::get('slider.edit/{id}', [App\Http\Controllers\SuperAdminController::class, 'slideredit'])->name('slider.edit');
        Route::post('slider.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'sliderupdate'])->name('slider.update');
        Route::get('slider.deleted.{id}', [App\Http\Controllers\SuperAdminController::class, 'sliderdelete'])->name('slider.deleted');
        Route::get('slider.publish/{id}', [App\Http\Controllers\SuperAdminController::class, 'sliderpublish'])->name('slider.publish');
        Route::get('slider.unpublish/{id}', [App\Http\Controllers\SuperAdminController::class, 'sliderunpublish'])->name('slider.unpublish');


        Route::get('slider.slugsearch', [App\Http\Controllers\SuperAdminController::class, 'sliderlugsearch'])->name('slider.slugsearch');

        // Route::get('slider.{slider}', [App\Http\Controllers\SuperAdminController::class, 'slidersliderName'])->name('slider.slidersliderName');;

        Route::post('/slider.upload', [App\Http\Controllers\SuperAdminController::class, 'sliderupload'])->name('slider.upload');
        Route::get('/slider.fetch', [App\Http\Controllers\SuperAdminController::class, 'sliderfetch'])->name('slider.fetch');
        Route::get('/slider.distroy', [App\Http\Controllers\SuperAdminController::class, 'slideruploaddelete'])->name('slider.distroy');
        Route::post('/slider.imgsearch', [App\Http\Controllers\SuperAdminController::class, 'sliderimgsearch'])->name('slider.imgsearch');

    // All Custom log
        Route::get('/categorylog', [App\Http\Controllers\SuperAdminController::class, 'categorylog']);

       //Import and Export
        Route::get('csv',  [App\Http\Controllers\SuperAdminController::class, 'csvfile'])->name('csv');
        // Route::get('csv.upload',  [App\Http\Controllers\AdminController::class, 'csvupload'])->name('csv.upload');
        Route::get('csv.export',  [App\Http\Controllers\SuperAdminController::class, 'export'])->name('csv.export');
        Route::post('csv.store', [App\Http\Controllers\SuperAdminController::class, 'import'])->name('csv.store');

    // SuperAdmin permission
    Route::get('/permissions', [App\Http\Controllers\SuperAdminController::class, 'permissions'])->name('permissions');
    Route::get('/permissions.create', [App\Http\Controllers\SuperAdminController::class, 'permissioncreate'])->name('permissions.create');
    Route::post('/permissions.store', [App\Http\Controllers\SuperAdminController::class, 'permissionstore'])->name('permissions.store');
    Route::get('/permissions.show.{id}', [App\Http\Controllers\SuperAdminController::class, 'permissionshow'])->name('permissions.show');
    Route::get('/permissions.edit.{id}', [App\Http\Controllers\SuperAdminController::class, 'permissionedit'])->name('permissions.edit');
    Route::patch('/permissions.update.{id}', [App\Http\Controllers\SuperAdminController::class, 'permissionupdate'])->name('permissions.update');
    Route::delete('/permissions.destroy.{id}', [App\Http\Controllers\SuperAdminController::class, 'permissiondelete'])->name('permissions.destroy');
    Route::post('/permissions.search', [App\Http\Controllers\SuperAdminController::class, 'permissionsearch'])->name('permissons.search');
    Route::get('/permissions.permissiondelete.{id}', [App\Http\Controllers\SuperAdminController::class, 'deletepermission'])->name('permissions.permissiondelete');

});
