<?php
namespace App\Http\Controllers;

use Keygen;
// Event
use Arr;
// language
// try  catch
use Carbon\Carbon;
use App\Models\page;
use \App\Mail\SendMail;
use Milon\Barcode\DNS2D;
// use App\Models\Brand;
use Milon\Barcode\DNS1D;
use Illuminate\Http\Request;
use App\Http\Requests\PostDataRequest;
use App\Http\Requests\FormDataRequest;
use \Illuminate\Database\Eloquent\Collection;
use \NumberToWords\NumberToWords;

use App\Events\UserCreated;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Mail;
use \Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use \Illuminate\Support\Facades\Auth;
use App\Http\Controllers\HitlogController;
use Yajra\DataTables\Facades\DataTables;
use \Symfony\Component\HttpFoundation\Session\Session;

use Stripe\Stripe;

use App\Http\Servicecruds\{
    Usercrud,
    Menucrud,
    Mediacrud,
    Pagecrud,
    Postcrud,
    Settingcrud,
    Accountcrud,
    MoneyTransfercrud,
    CashRegistercrud,
    Categorycrud,
    Brandcrud,
    Unitcrud,
    Taxcrud,
    Couriercrud,
    Couponcrud,
    Warehousecrud,
    Departmentcrud,
    Employeecrud,
    Payrollcrud,
    StockCountcrud,
    Adjustmentcrud,
    Transfercrud,
    Holidaycrud,
    GiftCardcrud,
    Customercrud,
    DiscountPlancrud,
    Promotioncrud,
    Barcodecrud,
    Deliverycrud,
    Suppliercrud,
    Billercrud,
    Purchasecrud,
    Salecrud,
    Expensecrud,
    Productcrud,
    GeneralSettingcrud,
    Reportcrud,

    SuperAdmincrud,
    CustomFieldcrud,
    SMScrud
};
// use App\Models\ImageUpload;
use App\Models\{
    Account,
    CustomField,
    Comment,
    Adjustment,
    ProductAdjustment,
    Supplier,
    Category,
    Brand,
    ImageUpload,
    Unit,
    Tax,
    Warehouse,
    Promotion,
    Barcode,
    Product,
    ProductWarehouse,
    Variant,
    ProductVariant,
    Purchase,
    ProductPurchase,
    ReturnPurchase,
    PurchaseProductReturn,
    ProductBatch,
    Sale,
    Customer,
    CustomerGroup,
    ProductSale,
    Biller,
    PosSetting,
    RewardPointSetting,
    Returns,
    Delivery,
    CashRegister,
    Discount,
    DiscountPlan,
    DiscountPlanCustomer,
    DiscountPlanDiscount,

    Coupon,
    GiftCard,
    GiftCardRecharge,
    Payment,
    PaymentWithCheque,
    PaymentWithCreditCard,
    PaymentWithGiftCard,
    Courier,
    GeneralSetting,
    ProductQuotation,
    MoneyTransfer,
    Quotation,
    ProductReturn,
    Transfer,
    ProductTransfer,
    Payroll,
    Notification,
    Expense,
    Employee,
    Attendance,
    Holiday,
    HrmSetting,
    Department,
    StockCount,
    ExpenseCategory
};
use App\Traits\CacheForget;
use ZipArchive;
class SuperAdminController extends Controller
{
    use CacheForget;

    private $images, $thumbnail, $singleimg, $upload, $files;

    public function __construct()
    {
        $Hitlog  = new HitlogController;
        $Hitlog->sitehit();

        $this->images = public_path('/images');
        $this->thumbnail = public_path('/thumbnail');
        $this->singleimg = public_path('/singleimg');
        $this->upload = public_path('/upload');
        $this->files = public_path('/files');
    }
    public function index()
    {
        // dd("Supper admin  panel");
        return view('superadmin.index');
    }
    public function notifyread($id)
    {
        $userUnreadNotification = auth()->user()
            ->unreadNotifications
            ->where('id', $id)
            ->first();

        if ($userUnreadNotification) {
            $userUnreadNotification->markAsRead();
            return \redirect()->route('superAdmin.users');
        }
    }
    public function categorylog(Request $request)
    {
        $logfiles = file(storage_path() . '/logs/category.log');
        $collection = [];
        foreach ($logfiles as $logfile) {
            $collection[] = $logfile;
        }
        dd($collection);
    }

    public function lang_change(Request $request)
    {
        // die($request->lang);
        \Illuminate\Support\Facades\App::setLocale($request->lang);
        session()->put('lang_code', $request->lang);
        return redirect()->back();
    }
    public function loginhistory()
    {
        $loginhistories = DB::table('loginhistories')->orderBy('id', 'DESC')->paginate(15);
        return view('superadmin.loginhistory.index', compact('loginhistories'));
    }

    public function databasebackup()
    {
        return (new Settingcrud)->databasebackup();
    }

    // ========================================== Slider

    public function sliderindex()
    {
        return (new Settingcrud)->sliderindex();
    }
    public function slidercreate()
    {
        return (new Settingcrud)->slidercreate();
    }
    public function sliderstore(Request $request)
    {
        return (new Settingcrud)->sliderstore($request);
    }
    public function slideredit($id)
    {
        return (new Settingcrud)->slideredit($id);
    }
    public function sliderpublish($id)
    {
        return (new Settingcrud)->sliderpublish($id);
    }
    public function sliderunpublish($id)
    {
        return (new Settingcrud)->sliderunpublish($id);
    }
    public function sliderupdate(Request $request, $id)
    {
        return (new Settingcrud)->sliderupdate($request, $id);
    }
    public function sliderdelete($id)
    {
        return (new Settingcrud)->sliderdelete($id);
    }
    // ================================

    public function sliderupload(Request $request)
    {
        return (new Settingcrud)->sliderupload($request);
    }
    public function sliderfetch(Request $request)
    {
        return (new Settingcrud)->sliderfetch($request);
    }
    public function slideruploaddelete(Request $request)
    {
        return (new Settingcrud)->slideruploaddelete($request);
    }
    public function sliderimgsearch(Request $request)
    {
        return (new Settingcrud)->sliderimgsearch($request);
    }
    // ========================================== Gallery

    public function galleryindex()
    {
        return (new Settingcrud)->galleryindex();
    }
    public function gallerycreate()
    {
        return (new Settingcrud)->gallerycreate();
    }
    public function gallerystore(Request $request)
    {
        return (new Settingcrud)->gallerystore($request);
    }
    public function galleryedit($id)
    {
        return (new Settingcrud)->galleryedit($id);
    }
    public function gallerypopup($id)
    {
        return (new Settingcrud)->gallerypopup($id);
    }
    public function galleryunpopup($id)
    {
        return (new Settingcrud)->galleryunpopup($id);
    }
    public function gallerypartnar($id)
    {
        return (new Settingcrud)->gallerypartnar($id);
    }
    public function galleryunpartnar($id)
    {
        return (new Settingcrud)->galleryunpartnar($id);
    }

    public function gallerypublish($id)
    {
        return (new Settingcrud)->gallerypublish($id);
    }
    public function galleryunpublish($id)
    {
        return (new Settingcrud)->galleryunpublish($id);
    }

    public function galleryupdate(Request $request, $id)
    {
        return (new Settingcrud)->galleryupdate($request, $id);
    }
    public function gallerydelete($id)
    {
        return (new Settingcrud)->gallerydelete($id);
    }
    public function galleryupload(Request $request)
    {
        return (new Settingcrud)->galleryupload($request);
    }

    // ================== Category part =============

    public function categoryindex(Request $request)
    {
        return (new Categorycrud)->categoryindex($request);
    }
    public function categorycreate()
    {
        return (new Categorycrud)->categorycreate();

    }
    public function categorystore(Request $request)
    {
        // $request->validate([
        //     'name_en' => 'required',
        //     'name_bn' => 'required',
        // ],[
        //     'name_en.required' => 'Name English is must.',
        //     'name_bn.required' => 'Name Bangla is must.',
        // ]);
        return (new Categorycrud)->categorystore($request);
    }
    public function categoryedit($id)
    {
        return (new Categorycrud)->categoryedit($id);
    }
    public function categoryupdate(Request $request, $id)
    {
        return (new Categorycrud)->categoryupdate($request, $id);
    }
    public function categorypublish($id)
    {
        return (new Categorycrud)->categorypublish($id);
    }
    public function categoryunpublish($id)
    {
        return (new Categorycrud)->categoryunpublish($id);
    }
    public function categorydestroy($id)
    {
        return (new Categorycrud)->categorydestroy($id);
    }
    public function categoryPagination(Request $request)
    {
        return (new Categorycrud)->categoryPagination($request);
    }
    public function categorySearch(Request $request)
    {
        return (new Categorycrud)->categorySearch($request);
    }
    public function categoryCheckname($nameValue)
    {
        return (new Categorycrud)->categoryCheckname($nameValue);
    }
    public function categoryName($category)
    {
        return (new Categorycrud)->categoryName($category);
    }
    public function categoryupload(Request $request)
    {
        return (new Categorycrud)->categoryupload($request);
    }
    public function categoryfetch(Request $request)
    {
        // return (new Categorycrud)->categoryfetch($request);
    }
    public function categoryuploaddelete(Request $request)
    {
        return (new Categorycrud)->categoryuploaddelete($request);
    }
    public function categoryimagesearch(Request $request)
    {
        return (new Categorycrud)->categoryimagesearch($request);
    }
    // ========================Brand===================
    public function brandindex(Request $request)
    {
        return (new Brandcrud)->brandindex($request);
    }
    public function brandcreate()
    {
        $categories = Brand::get();
        return view('superadmin.brand.create', compact('categories'));
    }
    public function brandstore(Request $request)
    {
        return (new Brandcrud)->brandstore($request);
    }

    public function brandpublish($id)
    {
        return (new Brandcrud)->brandpublish($id);
    }
    public function brandunpublish($id)
    {
        return (new Brandcrud)->brandunpublish($id);
    }
    public function branddestroy($id)
    {
        return (new Brandcrud)->branddestroy($id);
    }
    public function brandimagesearch(Request $request)
    {
        // return (new Categorycrud)->brandimagesearch($request);
    }

    // ========================Unit===================
    public function unitindex(Request $request)
    {
        return (new Unitcrud)->unitindex($request);

    }
    public function unitstore(Request $request)
    {
        return (new Unitcrud)->unitstore($request);
    }

    public function unitpublish($id)
    {
        return (new Unitcrud)->unitpublish($id);
    }
    public function unitunpublish($id)
    {
        return (new Unitcrud)->unitunpublish($id);
    }
    public function unitdestroy($id)
    {
        return (new Unitcrud)->unitdestroy($id);
    }
    // ========================Tax===================
    public function taxindex(Request $request)
    {
        return (new Taxcrud)->taxindex($request);
    }
    public function taxstore(Request $request)
    {
        return (new Taxcrud)->taxstore($request);
    }

    public function taxpublish($id)
    {
        return (new Taxcrud)->taxpublish($id);
    }
    public function taxunpublish($id)
    {
        return (new Taxcrud)->taxunpublish($id);
    }
    public function taxdestroy($id)
    {
        return (new Taxcrud)->taxdestroy($id);
    }
    // ========================Courier=======================
    public function courierindex(Request $request)
    {
        return (new Couriercrud)->courierindex($request);
    }
    public function courierstore(Request $request)
    {
        return (new Couriercrud)->courierstore($request);
    }

    public function courierpublish($id)
    {
        return (new Couriercrud)->courierpublish($id);
    }
    public function courierunpublish($id)
    {
        return (new Couriercrud)->courierunpublish($id);
    }
    public function courierdestroy($id)
    {
        return (new Couriercrud)->courierdestroy($id);
    }
    // ========================Coupon===================
    public function couponindex(Request $request)
    {
        return (new Couponcrud)->couponindex($request);
    }
    /**
     * Summary of couponGenerateCode
     * @return mixed
     */
    public function couponGenerateCode()
    {
        return (new Couponcrud)->couponGenerateCode();
    }
    public function couponstore(Request $request)
    {
        return (new Couponcrud)->couponstore($request);
    }
    public function couponpublish($id)
    {
        return (new Couponcrud)->couponpublish($id);
    }
    public function couponunpublish($id)
    {
        return (new Couponcrud)->couponunpublish($id);
    }
    public function coupondestroy($id)
    {
        return (new Couponcrud)->coupondestroy($id);
    }


    // ========================Accounting ===================
    public function accountsindex()
    {
        return (new Accountcrud)->accountsindex();
    }
    public function accountsStore(Request $request)
    {
        return (new Accountcrud)->accountsStore($request);
    }

    public function makeDefault($id)
    {
        return (new Accountcrud)->makeDefault($id);
    }
    public function accountsUpdate(Request $request)
    {
        return (new Accountcrud)->accountsUpdate($request);
    }

    public function balanceSheet()
    {
        return (new Accountcrud)->balanceSheet();
    }

    public function accountStatement(Request $request)
    {
        return (new Accountcrud)->accountStatement($request);

    }
    public function accountsdestroy($id)
    {
        return (new Accountcrud)->accountsdestroy($id);
    }
    // ========================MoneyTransfer===================
    public function moneyTransfersindex()
    {
        return (new MoneyTransfercrud)->moneyTransfersindex();
    }
    public function moneyTransfersStore(Request $request)
    {
        return (new MoneyTransfercrud)->moneyTransfersStore($request);
    }

    public function moneyTransfersupdate(Request $request)
    {
        return (new MoneyTransfercrud)->moneyTransfersupdate($request);
    }

    public function moneyTransfersdestroy($id)
    {
        return (new MoneyTransfercrud)->moneyTransfersdestroy($id);
    }
    // ========================cashRegister===================
    public function cashRegisterindex(Request $request)
    {
        return (new CashRegistercrud)->cashRegisterindex($request);
    }

    /**
     * Summary of cashRegisterGenerateCode
     * @return mixed
     */
    public function cashRegisterGenerateCode()
    {
        return (new CashRegistercrud)->cashRegisterGenerateCode();
    }

    public function getDetails($id)
    {
        return (new CashRegistercrud)->getDetails($id);
    }
    public function cashRegisterstore(Request $request)
    {
        return (new CashRegistercrud)->cashRegisterstore($request);
    }
    public function cashRegisterpublish($id)
    {
        return (new CashRegistercrud)->cashRegisterpublish($id);
    }
    public function cashRegisterunpublish($id)
    {
        return (new CashRegistercrud)->cashRegisterunpublish($id);
    }
    public function cashRegisterdestroy($id)
    {
        return (new CashRegistercrud)->cashRegisterdestroy($id);
    }
    public function cashRegisterclose(Request $request)
    {
        return (new CashRegistercrud)->cashRegisterclose($request);
    }

    // ========================Department ===================
    public function departmentsindex()
    {
        return (new Departmentcrud)->departmentsindex();
    }

    public function departmentsStore(Request $request)
    {
        return (new Departmentcrud)->departmentsStore($request);
    }

    public function departmentsUpdate(Request $request)
    {
        return (new Departmentcrud)->departmentsUpdate($request);
    }

    public function deleteBySelectionDepartment(Request $request)
    {
        return (new Departmentcrud)->deleteBySelectionDepartment($request);
    }

    public function departmentsdestroy($id)
    {
        return (new Departmentcrud)->departmentsdestroy($id);
    }

    // ========================Employee===================
    public function employeesindex()
    {
        return (new Employeecrud)->employeesindex();
    }

    public function employeesCreate()
    {
        return (new Employeecrud)->employeesCreate();
    }
    public function employeesStore(Request $request)
    {
        return (new Employeecrud)->employeesStore($request);
    }

    public function employeesUpdate(Request $request)
    {
        return (new Employeecrud)->employeesUpdate($request);
    }

    public function deleteBySelectionEmployee(Request $request)
    {
        return (new Employeecrud)->deleteBySelectionEmployee($request);
    }
    public function employeesdestroy($id)
    {
        return (new Employeecrud)->employeesdestroy($id);

    }
    // ========================Payroll===================
    public function payrollindex()
    {
        return (new Payrollcrud)->payrollindex();
    }

    public function payrollStore(Request $request)
    {
        return (new Payrollcrud)->payrollStore($request);
    }
    public function payrollUpdate(Request $request)
    {
        return (new Payrollcrud)->payrollUpdate($request);
    }

    public function deleteBySelectionPayroll(Request $request)
    {
        return (new Payrollcrud)->deleteBySelectionPayroll($request);
    }

    public function payrolldestroy($id)
    {
        return (new Payrollcrud)->payrolldestroy($id);
    }
    // ========================HRM Setting ===================

    public function hrmSetting()
    {
        $lims_hrm_setting_data = HrmSetting::latest()->first();
        return view('superadmin.setting.hrm_setting', compact('lims_hrm_setting_data'));
    }

    public function hrmSettingStore(Request $request)
    {
        $data = $request->all();
        $lims_hrm_setting_data = HrmSetting::firstOrNew(['id' => 1]);
        $lims_hrm_setting_data->checkin = $data['checkin'];
        $lims_hrm_setting_data->checkout = $data['checkout'];
        $lims_hrm_setting_data->save();
        return redirect()->back()->with('message', 'Data updated successfully');

    }
    // ========================Attendance===================
    public function attendanceindex()
    {

        $lims_employee_list = Employee::where('is_active', true)->get();
        $lims_hrm_setting_data = HrmSetting::latest()->first();
        $general_setting = DB::table('general_settings')->latest()->first();
        if (Auth::user()->role_id > 2 && $general_setting->staff_access == 'own')
            $lims_attendance_all = Attendance::orderBy('id', 'desc')->where('user_id', Auth::id())->get();
        else
            $lims_attendance_all = Attendance::orderBy('id', 'desc')->get();
        return view('superadmin.attendance.index', compact('lims_employee_list', 'lims_hrm_setting_data', 'lims_attendance_all'));

    }

    public function attendanceStore(Request $request)
    {
        $data = $request->all();
        $employee_id = $data['employee_id'];
        $lims_hrm_setting_data = HrmSetting::latest()->first();
        $checkin = $lims_hrm_setting_data->checkin;
        foreach ($employee_id as $id) {
            $data['date'] = date('Y-m-d', strtotime(str_replace('/', '-', $data['date'])));
            $data['user_id'] = Auth::id();
            $lims_attendance_data = Attendance::whereDate('date', $data['date'])->where('employee_id', $id)->first();
            if (!$lims_attendance_data) {
                $data['employee_id'] = $id;
                $diff = strtotime($checkin) - strtotime($data['checkin']);
                if ($diff >= 0)
                    $data['status'] = 1;
                else
                    $data['status'] = 0;
                Attendance::create($data);
            }
        }
        return redirect()->back()->with('message', 'Attendance created successfully');
        //return date('h:i:s a', strtotime($data['from_time']));
    }


    public function deleteBySelectionAttendance(Request $request)
    {
        $attendance_id = $request['attendanceIdArray'];
        foreach ($attendance_id as $id) {
            $lims_attendance_data = Attendance::find($id);
            $lims_attendance_data->delete();
        }
        return 'Attendance deleted successfully!';
    }

    public function attendancedestroy($id)
    {
        $lims_attendance_data = Attendance::find($id);
        $lims_attendance_data->delete();
        return redirect()->back()->with('not_permitted', 'Attendance deleted successfully');
    }
    // ========================StockCount===================
    public function stockCountindex()
    {
        return (new StockCountcrud)->stockCountindex();
    }
    public function stockCountStore(Request $request)
    {
        return (new StockCountcrud)->stockCountStore($request);
    }

    public function finalize(Request $request)
    {
        return (new StockCountcrud)->finalize($request);
    }

    public function stockDif($id)
    {
        return (new StockCountcrud)->stockDif($id);
    }

    public function qtyAdjustment($id)
    {
        return (new StockCountcrud)->qtyAdjustment($id);
    }

    // ========================Adjustment===================

    public function adjustmentindex()
    {
        return (new Adjustmentcrud)->adjustmentindex();
    }

    public function adjustmentgetProduct($id)
    {
        return (new Adjustmentcrud)->adjustmentgetProduct($id);
    }

    public function adjustmentlimsProductSearch(Request $request)
    {
        return (new Adjustmentcrud)->adjustmentlimsProductSearch($request);

    }

    public function adjustmentcreate()
    {
        return (new Adjustmentcrud)->adjustmentcreate();
    }

    public function adjustmentstore(Request $request)
    {
        return (new Adjustmentcrud)->adjustmentstore($request);
    }

    public function adjustmentedit($id)
    {
        return (new Adjustmentcrud)->adjustmentedit($id);
    }

    public function adjustmentupdate(Request $request, $id)
    {
        return (new Adjustmentcrud)->adjustmentupdate($request, $id);
    }

    public function adjustmentdeleteBySelection(Request $request)
    {
        return (new Adjustmentcrud)->adjustmentdeleteBySelection($request);
    }

    public function adjustmentdestroy($id)
    {
        return (new Adjustmentcrud)->adjustmentdestroy($id);
    }

    // ========================Transfer===================
    public function transfersIndex(Request $request)
    {
        return (new Transfercrud)->transfersIndex($request);
    }

    public function transfersCreate()
    {
        return (new Transfercrud)->transfersCreate();
    }

    public function transfersGetProduct($id)
    {
        return (new Transfercrud)->transfersGetProduct($id);
    }

    public function transfersLimsProductSearch(Request $request)
    {
        return (new Transfercrud)->transfersLimsProductSearch($request);
    }

    public function transfersStore(Request $request)
    {
        return (new Transfercrud)->transfersStore($request);
    }

    public function transfersProductTransferData($id)
    {
        return (new Transfercrud)->transfersProductTransferData($id);
    }

    public function transferByCsv()
    {
        return (new Transfercrud)->transferByCsv();
    }

    public function importTransfer(Request $request)
    {
        return (new Transfercrud)->importTransfer($request);
    }

    public function transfersEdit($id)
    {
        return (new Transfercrud)->transfersEdit($id);
    }

    public function transfersUpdate(Request $request, $id)
    {
        return (new Transfercrud)->transfersUpdate($request, $id);
    }

    public function transfersDeleteBySelection(Request $request)
    {
        return (new Transfercrud)->transfersDeleteBySelection($request);
    }

    public function transfersDestroy($id)
    {
        return (new Transfercrud)->transfersDestroy($id);
    }

    // ========================Holiday===================
    public function holidaysCountindex()
    {
        return (new Holidaycrud)->holidaysCountindex();
    }

    public function holidaysCountStore(Request $request)
    {
        return (new Holidaycrud)->holidaysCountStore($request);
    }

    public function approveHoliday($id)
    {
        return (new Holidaycrud)->approveHoliday($id);
    }

    public function myHoliday($year, $month)
    {
        return (new Holidaycrud)->myHoliday($year, $month);
    }

    public function holidaysCountUpdate(Request $request)
    {
        return (new Holidaycrud)->holidaysCountUpdate($request);
    }

    public function deleteBySelectionHoliday(Request $request)
    {
        return (new Holidaycrud)->deleteBySelectionHoliday($request);
    }

    public function holidaysCountdestroy($id)
    {
        return (new Holidaycrud)->holidaysCountdestroy($id);
    }
    // ========================giftcard===================
    public function giftcardindex(Request $request)
    {
        return (new GiftCardcrud)->giftcardindex($request);
    }
    /**
     * Summary of giftcardGenerateCode
     * @return mixed
     */
    public function giftcardGenerateCode()
    {
        return (new GiftCardcrud)->giftcardGenerateCode();
    }
    public function giftcardecharge(Request $request, $id)
    {
        return (new GiftCardcrud)->giftcardecharge($request, $id);
    }
    public function giftcardrecharge(Request $request, $id)
    {
        return (new GiftCardcrud)->giftcardrecharge($request, $id);
    }
    public function giftcardstore(Request $request)
    {
        return (new GiftCardcrud)->giftcardstore($request);
    }
    public function giftcardupdate(Request $request, $id)
    {
        return (new GiftCardcrud)->giftcardupdate($request, $id);
    }
    public function giftcardpublish($id)
    {
        return (new GiftCardcrud)->giftcardpublish($id);
    }
    public function giftcardunpublish($id)
    {
        return (new GiftCardcrud)->giftcardunpublish($id);
    }
    public function giftcarddestroy($id)
    {
        return (new GiftCardcrud)->giftcarddestroy($id);
    }

    // ========================Coustomer===================
    public function customerindex(Request $request)
    {
        return (new Customercrud)->customerindex($request);
    }
    public function customercreate()
    {
        return (new Customercrud)->customercreate();
    }
    public function customerstore(Request $request)
    {
        return (new Customercrud)->customerstore($request);
    }

    public function customerpublish($id)
    {
        return (new Customercrud)->customerpublish($id);
    }
    public function customerunpublish($id)
    {
        return (new Customercrud)->customerunpublish($id);
    }
    public function customerdestroy($id)
    {
        return (new Customercrud)->customerdestroy($id);
    }
    public function customerimagesearch(Request $request)
    {
        // return (new Customercrud)->customercreate();
        // return (new Categorycrud)->customerimagesearch($request);
    }


    // // ========================Coustomer Group===================
    public function coustomergroupindex(Request $request)
    {
        return (new Customercrud)->coustomergroupindex($request);
    }
    public function coustomergroupstore(Request $request)
    {
        return (new Customercrud)->coustomergroupstore($request);
    }
    public function coustomergroupedit($id)
    {
        return (new Customercrud)->coustomergroupedit($id);
    }
    public function coustomergroupupdate(Request $request)
    {
        return (new Customercrud)->coustomergroupupdate($request);
    }
    public function importCustomerGroup(Request $request)
    {
        return (new Customercrud)->importCustomerGroup($request);

    }
    public function coustomergroupdestroy($id)
    {
        return (new Customercrud)->coustomergroupdestroy($id);
    }
    public function exportCustomerGroup(Request $request)
    {
        return (new Customercrud)->exportCustomerGroup($request);
    }

    public function coustomerGroupDeleteBySelection(Request $request)
    {
        return (new Customercrud)->coustomerGroupDeleteBySelection($request);
    }

    // ========================discount===================
    public function discountindex(Request $request)
    {
        return (new DiscountPlancrud)->discountindex($request);
    }
    public function discountcreate(Request $request)
    {
        return (new DiscountPlancrud)->discountcreate($request);
    }
    public function discountstore(Request $request)
    {
        return (new DiscountPlancrud)->discountstore($request);
    }
    public function discountedit($id)
    {
        return (new DiscountPlancrud)->discountedit($id);
    }

    public function discountupdate(Request $request, $id)
    {
        return (new DiscountPlancrud)->discountupdate($request, $id);
    }

    public function discountproductSearch($code)
    {
        return (new DiscountPlancrud)->discountproductSearch($code);
    }

    public function discountpublish($id)
    {
        return (new DiscountPlancrud)->discountpublish($id);
    }
    public function discountunpublish($id)
    {
        return (new DiscountPlancrud)->discountunpublish($id);
    }
    public function discountdestroy($id)
    {
        return (new DiscountPlancrud)->discountdestroy($id);
    }

    // ========================discount Plan===================
    public function discountplanindex(Request $request)
    {
        return (new DiscountPlancrud)->discountplanindex($request);
    }
    public function discountPlancreate()
    {
        return (new DiscountPlancrud)->discountPlancreate();
    }
    public function discountPlanstore(Request $request)
    {
        return (new DiscountPlancrud)->discountPlanstore($request);
    }

    public function discountPlanedit($id)
    {
        return (new DiscountPlancrud)->discountPlanedit($id);
    }

    public function discountPlanupdate(Request $request, $id)
    {
        return (new DiscountPlancrud)->discountPlanupdate($request, $id);
    }

    public function discountplanpublish($id)
    {
        return (new DiscountPlancrud)->discountplanpublish($id);
    }
    public function discountplanunpublish($id)
    {
        return (new DiscountPlancrud)->discountplanunpublish($id);
    }
    public function discountplandestroy($id)
    {
        return (new DiscountPlancrud)->discountplandestroy($id);
    }

    // ========================warehouse===================
    public function warehouseindex(Request $request)
    {
        return (new Warehousecrud)->warehouseindex($request);
    }
    public function warehousestore(Request $request)
    {
        return (new Warehousecrud)->warehousestore($request);
    }

    public function warehousepublish($id)
    {
        return (new Warehousecrud)->warehousepublish($id);
    }
    public function warehouseunpublish($id)
    {
        return (new Warehousecrud)->warehouseunpublish($id);
    }
    public function warehousedestroy($id)
    {
        return (new Warehousecrud)->warehousedestroy($id);

    }
    // ========================promotion===================
    public function promotionindex(Request $request)
    {
        return (new Promotioncrud)->promotionindex($request);

    }
    public function promotionstore(Request $request)
    {
        return (new Promotioncrud)->promotionstore($request);
    }
    public function promotionpublish($id)
    {
        return (new Promotioncrud)->promotionpublish($id);
    }
    public function promotionunpublish($id)
    {
        return (new Promotioncrud)->promotionunpublish($id);
    }
    public function promotiondestroy($id)
    {
        return (new Promotioncrud)->promotiondestroy($id);
    }
    // ========================barcode===================
    public function barcodeindex(Request $request)
    {
        return (new Barcodecrud)->barcodeindex($request);
    }
    public function barcodestore(Request $request)
    {
        return (new Barcodecrud)->barcodestore($request);
    }

    public function barcodeprint(Request $request)
    {
        return (new Barcodecrud)->barcodeprint($request);
    }
    public function barcodedestroy($id)
    {
        return (new Barcodecrud)->barcodedestroy($id);
    }

    // ========================supplier===================
    public function supplierindex(Request $request)
    {
        return (new Suppliercrud)->supplierindex($request);
    }
    public function suppliercreate()
    {
        return (new Suppliercrud)->suppliercreate();
    }
    public function supplierstore(Request $request)
    {
        return (new Suppliercrud)->supplierstore($request);
    }
    public function supplierpublish($id)
    {
        return (new Suppliercrud)->supplierpublish($id);
    }
    public function supplierunpublish($id)
    {
        return (new Suppliercrud)->supplierunpublish($id);
    }
    public function supplierdestroy($id)
    {
        return (new Suppliercrud)->supplierdestroy($id);

    }
    public function supplierimagesearch(Request $request)
    {
        // return (new Categorycrud)->supplierimagesearch($request);
    }

    // ========================Biller===================
    public function billerindex(Request $request)
    {
        return (new Billercrud)->billerindex($request);

    }
    public function billercreate()
    {
        return (new Billercrud)->billercreate();
    }
    public function billerstore(Request $request)
    {
        return (new Billercrud)->billerstore($request);
    }

    public function billerpublish($id)
    {
        return (new Billercrud)->billerpublish($id);
    }
    public function billerunpublish($id)
    {
        return (new Billercrud)->billerunpublish($id);
    }
    public function billerdestroy($id)
    {
        return (new Billercrud)->billerdestroy($id);

    }
    public function billerimagesearch(Request $request)
    {
        // return (new Categorycrud)->billerimagesearch($request);
    }
    // ========================Purchase===================
    public function purchaseindex(Request $request)
    {
        return (new Purchasecrud)->purchaseindex($request);
    }
    public function purchasecreate()
    {
        return (new Purchasecrud)->purchasecreate();
    }
    #create

    public function purchasestore(Request $request)
    {
        return (new Purchasecrud)->purchasestore($request);
    }

    public function purchaseAddPayment(Request $request)
    {
        return (new Purchasecrud)->purchaseAddPayment($request);
    }
    public function purchaseUpdatePayment(Request $request)
    {
        return (new Purchasecrud)->purchaseUpdatePayment($request);
    }
    public function purchaseedit($id)
    {
        return (new Purchasecrud)->purchaseedit($id);
    }

    public function purchasesProductPurchase($id)
    {
        return (new Purchasecrud)->purchasesProductPurchase($id);
    }
    public function purchaselimsProductSearch(Request $request)
    {
        return (new Purchasecrud)->purchaselimsProductSearch($request);
    }

    public function purchaseupdate(Request $request, $id)
    {
        return (new Purchasecrud)->purchaseupdate($request, $id);
    }

    public function purchaseGetPayment($id)
    {
        return (new Purchasecrud)->purchaseGetPayment($id);
    }

    public function purchaseDeletePayment(Request $request)
    {
        return (new Purchasecrud)->purchaseDeletePayment($request);
    }

    public function updatePayment(Request $request)
    {
        return (new Purchasecrud)->updatePayment($request);
    }

    public function deletePayment(Request $request)
    {
        return (new Purchasecrud)->deletePayment($request);
    }

    public function purchasedestroy($id)
    {
        return (new Purchasecrud)->purchasedestroy($id);
    }

    // ========================Return Purchase===================
    public function returnPurchaseIndex(Request $request)
    {
        return (new Purchasecrud)->returnPurchaseIndex($request);
    }
    public function returnPurchaseReturnData(Request $request)
    {
        return (new Purchasecrud)->returnPurchaseReturnData($request);
    }
    public function returnPurchaseCreate(Request $request)
    {
        return (new Purchasecrud)->returnPurchaseCreate($request);
    }
    public function returnPurchaseStore(Request $request)
    {
        return (new Purchasecrud)->returnPurchaseStore($request);
    }
    public function returnPurchaseEdit($id)
    {
        return (new Purchasecrud)->returnPurchaseEdit($id);
    }
    public function returnPurchaseUpdate(Request $request, $id)
    {
        return (new Purchasecrud)->returnPurchaseUpdate($request, $id);
    }

    public function returnPurchaseGetproduct($id)
    {
        return (new Purchasecrud)->returnPurchaseGetproduct($id);
    }

    public function returnPurchaseCheckBatchAvailability($product_id, $batch_no, $warehouse_id)
    {
        return (new Purchasecrud)->returnPurchaseCheckBatchAvailability($product_id, $batch_no, $warehouse_id);
    }

    public function returnPurchaseProductSearch(Request $request)
    {
        return (new Purchasecrud)->returnPurchaseProductSearch($request);
    }
    public function returnPurchaseProductReturn($id)
    {
        return (new Purchasecrud)->returnPurchaseProductReturn($id);
    }
    public function returnpurchasedestroy($id)
    {
        return (new Purchasecrud)->returnpurchasedestroy($id);
        return (new Salecrud)->returnpurchasedestroy($id);
    }
    // ========================Return Sale===================

    public function returnSaleIndex(Request $request)
    {
        return (new Salecrud)->returnSaleIndex($request);
    }
    public function returnSaleCreate(Request $request)
    {
        return (new Salecrud)->returnSaleCreate($request);
    }

    public function returnGetCustomerGroup($id)
    {
        return (new Salecrud)->returnGetCustomerGroup($id);
    }
    public function returnGetProduct($id)
    {
        return (new Salecrud)->returnGetProduct($id);
    }
    public function returnLimsProductSearch(Request $request)
    {
        return (new Salecrud)->returnLimsProductSearch($request);
    }
    public function productReturnData($id)
    {
        return (new Salecrud)->productReturnData($id);
    }
    public function returnSendMail(Request $request)
    {
        return (new Salecrud)->returnSendMail($request);
    }
    public function returnSaleStore(Request $request)
    {
        return (new Salecrud)->returnSaleStore($request);
    }

    public function returnSaleEdit($id)
    {
        return (new Salecrud)->returnSaleEdit($id);
    }
    public function returnSaleUpdate(Request $request, $id)
    {
        return (new Salecrud)->returnSaleUpdate($request, $id);
    }
    public function returnsaledestroy($id)
    {
        return (new Salecrud)->returnsaledestroy($id);
    }
    // ========================Sale===================
    public function saleindex(Request $request)
    {
        return (new Salecrud)->saleindex($request);
    }
    #salecreate
    public function salecreate()
    {
        return (new Salecrud)->salecreate();
    }
    public function salestore(Request $request)
    {
        return (new Salecrud)->salestore($request);
    }

    public function showDetails($warehouse_id)
    {
        return (new Salecrud)->showDetails($warehouse_id);
    }
    public function saleSendMail(Request $request)
    {
        return (new Salecrud)->saleSendMail($request);
    }
    public function createSale($id)
    {
        return (new Salecrud)->createSale($id);
    }
    public function todaySale()
    {
        return (new Salecrud)->todaySale();
    }
    public function todayProfit($warehouse_id)
    {
        return (new Salecrud)->todayProfit($warehouse_id);
    }
    public function salePrintLastReciept()
    {
        return (new Salecrud)->salePrintLastReciept();
    }
    public function sellGetProduct($id)
    {
        return (new Salecrud)->sellGetProduct($id);
    }

    public function saleGetcustomergroup($id)
    {
        return (new Salecrud)->saleGetcustomergroup($id);

    }
    public function saleDeliveryStore(Request $request)
    {
        return (new Salecrud)->saleDeliveryStore($request);
    }

    public function saleCashRegister(Request $request)
    {
        return (new Salecrud)->saleCashRegister($request);
    }

    public function salecheckAvailability($warehouse_id)
    {
        return (new Salecrud)->salecheckAvailability($warehouse_id);
    }
    public function getFeatured()
    {
        return (new Salecrud)->getFeatured();
    }

    public function saleGetGiftCard()
    {
        return (new Salecrud)->saleGetGiftCard();
    }
    public function saleGenInvoice($id)
    {
        return (new Salecrud)->saleGenInvoice($id);
    }

    public function saleAddPayment(Request $request)
    {
        return (new Salecrud)->saleAddPayment($request);
    }
    public function saleDeliveryCreate($id)
    {
        return (new Salecrud)->saleDeliveryCreate($id);
    }

    public function saleUpdatePayment(Request $request)
    {
        return (new Salecrud)->saleUpdatePayment($request);
    }

    public function salesProductSale($id)
    {
        return (new Salecrud)->salesProductSale($id);
    }

    public function saleedit($id)
    {
        return (new Salecrud)->saleedit($id);
    }
    public function saleupdate(Request $request, $id)
    {
        return (new Salecrud)->saleupdate($request, $id);
    }

    public function saleProductSearch(Request $request)
    {
        return (new Salecrud)->saleProductSearch($request);
    }
    public function getProductByFilter($category_id, $brand_id)
    {
        return (new Salecrud)->getProductByFilter($category_id, $brand_id);
    }

    public function saleCheckBatchAvailability($product_id, $batch_no, $warehouse_id)
    {
        return (new Salecrud)->saleCheckBatchAvailability($product_id, $batch_no, $warehouse_id);
    }
    public function saleCheckDiscount(Request $request)
    {
        return (new Salecrud)->saleCheckDiscount($request);
    }
    public function saleGetPayment($id)
    {
        return (new Salecrud)->saleGetPayment($id);
    }
    public function saleDeletePayment(Request $request)
    {
        return (new Salecrud)->saleDeletePayment($request);
    }
    public function salePos()
    {
        return (new Salecrud)->salePos();
    }

    public function saledestroy($id)
    {
        return (new Salecrud)->saledestroy($id);
    }

    // ==========================Pos ==================
    public function posSetting()
    {
        return (new Salecrud)->posSetting();
    }
    public function posSettingStore(Request $request)
    {
        return (new Salecrud)->posSettingStore($request);

    }
    // ======================== Super admin===================
    public function superadminGeneralSetting()
    {
        return (new SuperAdmincrud)->superadminGeneralSetting();
    }

    public function superadminGeneralSettingStore(Request $request)
    {
        return (new SuperAdmincrud)->superadminGeneralSettingStore($request);
    }

    public function superadminMailSetting()
    {
        return (new SuperAdmincrud)->superadminMailSetting();
    }

    public function superadminMailSettingStore(Request $request)
    {
        return (new SuperAdmincrud)->superadminMailSettingStore($request);
    }

    // ======================== SMS Setting===================
    public function smsSetting()
    {
      return (new SMScrud)->smsSetting();
  }
  public function smsSettingStore(Request $request)
    {
        return (new SMScrud)->smsSettingStore($request);
    }
  public function createSms()
  {
    return (new SMScrud)->createSms();
  }

  public function sendSms(Request $request)
  {
    return (new SMScrud)->sendSms($request);
  }

  public function backup()
  {
      return (new SMScrud)->backup();
  }
    // ======================== RewardPointSetting===================
    public function rewardPointSetting(Request $request)
    {
        $lims_reward_point_setting_data = RewardPointSetting::latest()->first();
        return view('superadmin.setting.reward_point_setting', compact('lims_reward_point_setting_data'));
    }
    public function rewardPointSettingStore(Request $request)
    {
        $data = $request->all();
        // print_r($data);
        // die();
        if (isset($data['is_active']))
            $data['is_active'] = true;
        else
            $data['is_active'] = false;

        $getData = RewardPointSetting::latest()->first();

        if (empty($getData)) {
            $general_setting = new RewardPointSetting();
            $general_setting->per_point_amount = $data['per_point_amount'];
            $general_setting->minimum_amount = $data['minimum_amount'];
            $general_setting->duration = $data['duration'];
            $general_setting->type = $data['type'];
            $general_setting->is_active = $data['is_active'];
            $general_setting->save();
        } else {
            RewardPointSetting::latest()->first()->update($data);
        }
        return redirect()->back()->with('message', 'Reward point setting updated successfully');
    }

    // ========================Delivery===================
    public function deliveryindex(Request $request)
    {
        return (new Deliverycrud)->deliveryindex($request);
    }

    public function deliveryedit($id)
    {
        return (new Deliverycrud)->deliveryedit($id);
    }

    public function deliveryupdate(Request $request)
    {
        return (new Deliverycrud)->deliveryupdate($request);
    }

    public function productDeliveryData($id)
    {
        return (new Deliverycrud)->productDeliveryData($id);
    }

    public function deliverysendMail(Request $request)
    {
        return (new Deliverycrud)->deliverysendMail($request);
    }

    public function deliverydestroy($id)
    {
        return (new Deliverycrud)->deliverydestroy($id);
    }



    // ========================Ganeral Setting===================
    public function ganeralsettingindex(Request $request)
    {
        return (new GeneralSettingcrud)->ganeralsettingindex($request);
    }
    public function ganeralsettingstore(Request $request)
    {
        return (new GeneralSettingcrud)->ganeralsettingstore($request);

    }

    public function changeTheme($theme)
    {
        return (new GeneralSettingcrud)->changeTheme($theme);
    }
    //====================================== Expense Category================================
    public function expenseCategoriesIngindex()
    {
        return (new Expensecrud)->expenseCategoriesIngindex();
    }



    public function expensegenerateCode()
    {
        return (new Expensecrud)->expensegenerateCode();
    }

    public function expenseCategoriesstore(Request $request)
    {
        return (new Expensecrud)->expenseCategoriesstore($request);
    }


    public function expenseCategoriesEdit($id)
    {
        return (new Expensecrud)->expenseCategoriesstore($id);
    }

    public function expenseCategoriesUpdate(Request $request)
    {
        return (new Expensecrud)->expenseCategoriesUpdate($request);
    }

    public function expenseCategoriesImport(Request $request)
    {
        return (new Expensecrud)->expenseCategoriesImport($request);
    }

    public function deleteBySelection(Request $request)
    {
        return (new Expensecrud)->deleteBySelection($request);
    }

    public function expenseCategoriesDestroy($id)
    {
        return (new Expensecrud)->expenseCategoriesDestroy($id);
    }

    // ======================== Expense ===================
    public function expenseIngindex(Request $request)
    {
        return (new Expensecrud)->expenseIngindex($request);
    }

    public function expensesstore(Request $request)
    {
        return (new Expensecrud)->expensesstore($request);
    }
    public function expensesedit($id)
    {
        return (new Expensecrud)->expensesedit($id);
    }

    public function expensesupdate(Request $request)
    {
        return (new Expensecrud)->expensesupdate($request);
    }
    public function expensesdestroy($id)
    {
        return (new Expensecrud)->expensesdestroy($id);

    }
    // ========================Product===================
    public function productsindex(Request $request)
    {
        return (new Productcrud)->productsindex($request);
    }

    public function productscreate()
    {
        return (new Productcrud)->productscreate();
    }
    public function productsstore(Request $request)
    {
        return (new Productcrud)->productsstore($request);
    }
    public function productsedit($id)
    {
        return (new Productcrud)->productsedit($id);
    }

    public function productsupdate(Request $request)
    {
        return (new Productcrud)->productsupdate($request);

    }

    public function productWithoutVariant()
    {
        return (new Productcrud)->productWithoutVariant();
    }

    public function productWithVariant()
    {
        return (new Productcrud)->productWithVariant();
    }
    public function productssellUnitId($id)
    {
        return (new Productcrud)->productssellUnitId($id);
    }
    public function productspurchaseUnitId($id)
    {
        return (new Productcrud)->productssellUnitId($id);

    }
    public function productspublish($id)
    {
        return (new Productcrud)->productspublish($id);
    }
    public function productsunpublish($id)
    {
        return (new Productcrud)->productsunpublish($id);
    }
    public function productsslugsearch(Request $request)
    {
        return (new Productcrud)->productsslugsearch($id);
    }
    // Product search
    public function limsProductSearch(Request $request)
    {
        return (new Productcrud)->limsProductSearch($request);
    }
    public function productsdestroy($id)
    {
        return (new Reportcrud)->productsdestroy($id);
    }

    // ================== Reporting =============
    public function productQuantityAlert()
    {
        return (new Reportcrud)->productQuantityAlert();
    }

    public function dailySaleObjective(Request $request)
    {
        return (new Reportcrud)->dailySaleObjective($request);

    }

    public function dailySaleObjectiveData(Request $request)
    {
        return (new Reportcrud)->dailySaleObjectiveData($request);

    }

    public function productExpiry()
    {
        return (new Reportcrud)->productExpiry();
    }

    public function warehouseStock(Request $request)
    {
        return (new Reportcrud)->warehouseStock($request);
    }

    public function dailySale($year, $month)
    {
        return (new Reportcrud)->dailySale($year, $month);
    }

    public function dailySaleByWarehouse(Request $request, $year, $month)
    {
        return (new Reportcrud)->dailySaleByWarehouse($request, $year, $month);
    }

    public function dailyPurchase($year, $month)
    {
        return (new Reportcrud)->dailyPurchase($year, $month);
    }

    public function dailyPurchaseByWarehouse(Request $request, $year, $month)
    {
        return (new Reportcrud)->dailyPurchaseByWarehouse($request, $year, $month);
    }

    public function monthlySale($year)
    {
        return (new Reportcrud)->monthlySale($year);
    }

    public function monthlySaleByWarehouse(Request $request, $year)
    {
        return (new Reportcrud)->monthlySaleByWarehouse($request, $year);

    }

    public function monthlyPurchase($year)
    {
        return (new Reportcrud)->monthlyPurchase($year);
    }

    public function monthlyPurchaseByWarehouse(Request $request, $year)
    {
        return (new Reportcrud)->monthlyPurchaseByWarehouse($request, $year);
    }

    public function bestSeller()
    {
        return (new Reportcrud)->bestSeller();
    }

    public function bestSellerByWarehouse(Request $request)
    {
        return (new Reportcrud)->bestSellerByWarehouse($request);
    }

    public function profitLoss(Request $request)
    {
        return (new Reportcrud)->profitLoss($request);
    }

    public function calculateAverageCOGS($product_sale_data)
    {
        return (new Reportcrud)->calculateAverageCOGS($product_sale_data);
    }

    public function productReport(Request $request)
    {
        return (new Reportcrud)->productReport($request);

    }

    public function productReportData(Request $request)
    {
        return (new Reportcrud)->productReportData($request);
    }

    public function purchaseReport(Request $request)
    {
        return (new Reportcrud)->purchaseReport($request);
    }

    public function saleReport(Request $request)
    {
        return (new Reportcrud)->saleReport($request);
    }

    public function saleReportChart(Request $request)
    {
        return (new Reportcrud)->saleReportChart($request);
    }

    public function paymentReportByDate(Request $request)
    {
        return (new Reportcrud)->paymentReportByDate($request);
    }

    public function warehouseReport(Request $request)
    {
        return (new Reportcrud)->warehouseReport($request);
    }

    public function userReport(Request $request)
    {
        return (new Reportcrud)->userReport($request);
    }

    public function customerReport(Request $request)
    {
        return (new Reportcrud)->customerReport($request);
    }

    public function supplierReport(Request $request)
    {
        return (new Reportcrud)->supplierReport($request);
    }

    public function customerDueReportByDate(Request $request)
    {
        return (new Reportcrud)->customerDueReportByDate($request);
    }

    public function supplierDueReportByDate(Request $request)
    {
        return (new Reportcrud)->customerDueReportByDate($request);

    }
    // ================== Post =============
    public function postindex(Request $request)
    {
        return (new Postcrud)->postindex($request);
    }
    public function postshow($slug)
    {
        return (new Postcrud)->postshow($slug);
    }
    public function postcreate()
    {
        return (new Postcrud)->postcreate();
    }
    public function poststore(Request $request)
    {
        return (new Postcrud)->poststore($request);
    }
    public function postedit($id)
    {
        return (new Postcrud)->postedit($id);
    }
    public function postupdate(Request $request)
    {
        return (new Postcrud)->postupdate($request);
    }
    public function postsearch(Request $request)
    {
        return (new Postcrud)->postsearch($request);
    }
    public function postslugsearch(Request $request)
    {
        return (new Postcrud)->postslugsearch($request);
    }
    public function postdestroy($id)
    {
        return (new Postcrud)->postdestroy($id);
    }
    public function postpublish($id)
    {
        return (new Postcrud)->postpublish($id);
    }
    public function postunpublish($id)
    {
        return (new Postcrud)->postunpublish($id);
    }
    public function postmultipledelete(Request $request)
    {
        return (new Postcrud)->postmultipledelete($request);
    }
    // ================================
    public function postupload(Request $request)
    {
        return (new Postcrud)->postupload($request);
    }
    public function postsfetch(Request $request)
    {
        return (new Postcrud)->postsfetch($request);
    }
    public function postuploaddelete(Request $request)
    {
        return (new Postcrud)->postuploaddelete($request);
    }
    public function postimgsearch(Request $request)
    {
        return (new Postcrud)->postimgsearch($request);
    }
    // =========================================
    public function postarchive()
    {
        return (new Postcrud)->postarchive();
    }
    public function postarchivereturn($id)
    {
        return (new Postcrud)->postarchivereturn($id);
    }
    public function postarchivedistroy($id)
    {
        return (new Postcrud)->postarchivedistroy($id);
    }
    public function postarchivemultipledelete($id)
    {
        return (new Postcrud)->postarchivemultipledelete($id);
    }
    // ================== Comment =============
    public function commentsindex()
    {
        return (new Postcrud)->commentsindex();
    }
    public function commentsview($id)
    {
        return (new Postcrud)->commentsview($id);
    }
    public function commentspublish($id)
    {
        return (new Postcrud)->commentspublish($id);
    }
    public function commentsunpublish($id)
    {
        return (new Postcrud)->commentsunpublish($id);
    }
    public function commentarchive()
    {
        return (new Postcrud)->commentarchive();
    }
    public function commentreturn($id)
    {
        return (new Postcrud)->commentreturn($id);
    }
    public function commentdistroy($id)
    {
        return (new Postcrud)->commentdistroy($id);

    }



    public function commentsstore(Request $request)
    {
        $request->validate([
            'comment_body' => 'required',
        ]);
        return (new Postcrud)->commentsstore($request);
    }
    public function replyStore(Request $request)
    {
        return (new Postcrud)->replyStore($request);
    }
    public function softdelete($id)
    {
        return (new Postcrud)->softdelete($id);
    }
    public function commentdelete($id)
    {
        return (new Postcrud)->commentdelete($id);
    }
    public function commentmultipledelete(Request $request)
    {
        return (new Postcrud)->commentmultipledelete($request);
    }

    // ================== Page =============
    public function pageindex()
    {
        return (new Pagecrud)->pageindex();
    }
    public function pagecreate()
    {
        return (new Pagecrud)->pagecreate();
    }
    public function pagestore(Request $request)
    {
        return (new Pagecrud)->pagestore($request);
    }
    // public function pageshow( $id) {
    //     //
    // }
    public function pageedit($id)
    {
        return (new Pagecrud)->pageedit($id);
    }
    public function pageupdate(Request $request)
    {
        return (new Pagecrud)->pageupdate($request);
    }
    public function pagepublish($id)
    {
        return (new Pagecrud)->pagepublish($id);
    }
    public function pageunpublish($id)
    {
        return (new Pagecrud)->pageunpublish($id);
    }
    // =========================================

    public function pagearchived()
    {
        return (new Pagecrud)->pagearchived();
    }
    public function pagearchivereturn($id)
    {
        return (new Pagecrud)->pagearchivereturn($id);
    }
    public function pagearchivedistroy($id)
    {
        return (new Pagecrud)->pagearchivedistroy($id);
    }
    public function pagearchivemultipledelete($id)
    {
        return (new Pagecrud)->pagearchivemultipledelete($id);
    }
    // =======================================
    public function pagedestroy($id)
    {
        return (new Pagecrud)->pagedestroy($id);
    }
    public function pagemultipledelete(Request $request)
    {
        return (new Pagecrud)->pagemultipledelete($request);
    }
    public function pagesearch(Request $request)
    {
        return (new Pagecrud)->pagesearch($request);
    }
    public function pageslugsearch(Request $request)
    {
        return (new Pagecrud)->pageslugsearch($request);
    }
    // ================== Menu =============
    public function menuindex()
    {
        return (new Menucrud)->menuindex();
    }
    public function menustore(Request $request)
    {
        return (new Menucrud)->menustore($request);
    }
    public function menuaddCatToMenu(Request $request)
    {
        return (new Menucrud)->menuaddCatToMenu($request);
    }
    public function menuaddPostToMenu(Request $request)
    {
        return (new Menucrud)->menuaddPostToMenu($request);
    }
    public function menuaddPaseToMenu(Request $request)
    {
        return (new Menucrud)->menuaddPaseToMenu($request);
    }
    public function menuaddCustomLink(Request $request)
    {
        return (new Menucrud)->menuaddCustomLink($request);
    }
    public function menuupdateMenu(Request $request)
    {
        return (new Menucrud)->menuupdateMenu($request);
    }
    public function menuupdateMenuItem(Request $request)
    {
        return (new Menucrud)->menuupdateMenuItem($request);
    }
    public function menudeleteMenuItem($id, $key, $in = '')
    {
        return (new Menucrud)->menudeleteMenuItem($id, $key, $in = '');
    }
    public function menudestroy(Request $request)
    {
        return (new Menucrud)->menudestroy($request);
    }
    // ================== Ip White listed=============
    public function white()
    {
        return (new Settingcrud)->white();
    }
    public function whitecreate()
    {
        return (new Settingcrud)->whitecreate();
    }
    public function whitestore(Request $request)
    {
        return (new Settingcrud)->whitestore($request);
    }
    public function whiteedit($id)
    {
        return (new Settingcrud)->whiteedit($id);
    }
    public function whiteupdate(Request $request)
    {
        return (new Settingcrud)->whiteupdate($request);
    }
    public function whitedestroy($id)
    {
        return (new Settingcrud)->whitedestroy($id);
    }
    // ============================= Black listed=================
    public function black()
    {
        return (new Settingcrud)->black();
    }
    public function blackcreate()
    {
        return (new Settingcrud)->blackcreate();
    }
    public function blackstore(Request $request)
    {
        return (new Settingcrud)->blackstore($request);
    }
    public function blackedit($id)
    {
        return (new Settingcrud)->blackedit($id);
    }
    public function blackupdate(Request $request)
    {
        return (new Settingcrud)->blackupdate($request);
    }
    public function blackdestroy($id)
    {
        return (new Settingcrud)->blackdestroy($id);
    }

    // ================== User=============
    public function users()
    {
        return (new Usercrud)->users();
    }
    public function usercreate()
    {
        return view('superadmin.users.create');
    }
    public function usersupload(Request $request)
    {
        return (new Usercrud)->usersupload($request);
    }
    public function usersfetch(Request $request)
    {
        return (new Usercrud)->usersfetch($request);
    }
    public function usersuploaddelete(Request $request)
    {
        return (new Usercrud)->usersuploaddelete($request);
    }
    public function userstore(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|confirmed',
        ]);
        return (new Usercrud)->userstore($request);
    }
    public function profileUpdate(Request $request, $id)
    {
        $input = $request->all();
        $lims_user_data = User::find($id);
        $lims_user_data->update($input);
        return redirect()->back()->with('message3', 'Data updated successfullly');
    }
    public function usershow($id)
    {
        return (new Usercrud)->usershow($id);
    }
    public function useredit($id)
    {
        return (new Usercrud)->useredit($id);
    }
    public function userupdate(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:users,email,' . $id,
            'password' => 'confirmed',
        ]);
        return (new Usercrud)->userupdate($request, $id);
    }
    public function userpublish($id)
    {
        return (new Usercrud)->userpublish($id);
    }
    public function userunpublish($id)
    {
        return (new Usercrud)->userunpublish($id);
    }
    public function userdestroy($id)
    {
        return (new Usercrud)->userdestroy($id);
    }
    public function userssearch(Request $request)
    {
        return (new Usercrud)->userssearch($request);
    }

    // ================== Role=============
    public function roles()
    {
        return (new Settingcrud)->roles();
    }
    public function rolecreate()
    {
        return (new Settingcrud)->rolecreate();
    }
    public function rolestore(Request $request)
    {
        return (new Settingcrud)->rolestore($request);
    }
    public function roleshow($id)
    {
        return (new Settingcrud)->roleshow($id);
    }
    public function roleedit($id)
    {
        return (new Settingcrud)->roleedit($id);
    }
    public function roleupdate(Request $request, $id)
    {
        return (new Settingcrud)->roleupdate($request, $id);
    }
    public function roledelete($id)
    {
        return (new Settingcrud)->roledelete($id);
    }




    // ================== permission=============
    public function permissions()
    {
        return (new Settingcrud)->permissions();
    }
    public function permissioncreate()
    {
        return (new Settingcrud)->permissioncreate();
    }
    public function permissionstore(Request $request)
    {
        return (new Settingcrud)->permissionstore($request);
    }
    public function permissionshow($id)
    {
        return (new Settingcrud)->permissionshow($id);
    }
    public function permissionedit($id)
    {
        return (new Settingcrud)->permissionedit($id);
    }
    public function permissionupdate(Request $request, $id)
    {
        return (new Settingcrud)->permissionupdate($request, $id);
    }
    public function permissiondelete($id)
    {
        return (new Settingcrud)->permissiondelete($id);
    }
    // ============================CSV===============================
    public function csvfile()
    {
        return (new Settingcrud)->csvfile();
    }
    public function export()
    {
        return (new Settingcrud)->export();
    }
    private $rows = [];
    public function import(Request $request)
    {
        return (new Settingcrud)->import($request);
    }

    //============================ Media ===============
    public function media()
    {
        if (!is_dir($this->images) || !is_dir($this->thumbnail) || !is_dir($this->singleimg) || !is_dir($this->upload) || !is_dir($this->files)) {
            mkdir($this->images, 0777);
            mkdir($this->thumbnail, 0777);
            mkdir($this->singleimg, 0777);
            mkdir($this->upload, 0777);
            mkdir($this->files, 0777);
        }
        $data = ImageUpload::orderBy('id', 'desc')->paginate(16);
        return view('superadmin.media.index', compact('data'));
    }
    public function mediaupload(Request $request)
    {
        return (new Mediacrud)->mediaupload($request);
    }
    public function mediauploaddelete(Request $request)
    {
        return (new Mediacrud)->mediauploaddelete($request);
    }
    public function mediafetch(Request $request)
    {
        return (new Mediacrud)->mediafetch($request);
    }
    public function mediasearch(Request $request)
    {
        return (new Mediacrud)->mediasearch($request);
    }
    // getipcreate
    public function getipstore(Request $request)
    {
        return (new Settingcrud)->getipstore($request);
    }

    // ==========================custom field
    public function customindex(Request $request)
    {
        return (new CustomFieldcrud)->customindex($request);
    }
    public function customcreate()
    {
        return view('superadmin.custom_field.create');
    }
    public function customstore(Request $request)
    {
        return (new CustomFieldcrud)->customstore($request);
    }

    public function customedit($id)
    {
        return (new CustomFieldcrud)->customedit($id);
    }

    public function customupdate(Request $request, $id)
    {
        return (new CustomFieldcrud)->customupdate($request, $id);
    }

    public function destroy($id)
    {
        return (new CustomFieldcrud)->destroy($id);
    }
}
