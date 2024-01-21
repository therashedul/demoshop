<?php
namespace App\Http\Controllers;

use Keygen;
// Event
use Arr;
// language
// try  catch
use Carbon\Carbon;
use App\Models\page;
// use App\Models\Tax;
// use App\Models\Unit;
use App\Models\Account;

use Milon\Barcode\DNS2D;
// use App\Models\Brand;
use Milon\Barcode\DNS1D;
// use App\Models\Product;
// use App\Models\variant;
// use App\Models\Barcode;
use App\Events\UserCreated;
// use App\Models\Supplier;
// use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\App;
use App\Models\ImageUpload;
// use App\Models\Promotion;
// use App\Models\Warehouse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use \Illuminate\Support\Facades\Redirect;
use \Illuminate\Database\Eloquent\Collection;
use \NumberToWords\NumberToWords;
use App\Models\ProdcutBarcode;
// use App\Models\ProductVariant;

use App\Models\User;
// use App\Models\ProducatVariant;
use App\Http\Servicecruds\Usercrud;
use App\Http\Servicecruds\Menucrud;
use Illuminate\Support\Facades\Log;
use App\Http\Servicecruds\Pagecrud;
// use App\Models\ProductWarehouse;
use App\Http\Servicecruds\Postcrud;
use Illuminate\Support\Facades\DB;
use App\Http\Servicecruds\Mediacrud;
use \Illuminate\Support\Facades\Auth;

use App\Http\Requests\PostDataRequest;
use App\Http\Requests\FormDataRequest;
use App\Http\Servicecruds\Settingcrud;
use App\Http\Servicecruds\Categorycrud;
use Yajra\DataTables\Facades\DataTables;
use \Symfony\Component\HttpFoundation\Session\Session;

use Stripe\Stripe;
use App\Models\{
    Supplier,
    Category,
    Brand,
    Unit,
    Tax,
    Warehouse,
    Promotion,
    Barcode,
    Product,
    ProductWarehouse,
    variant,
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



class SuperAdminController extends Controller
{
    private $images, $thumbnail, $singleimg, $upload, $files;

    public function __construct()
    {
        $this->images = public_path('/images');
        $this->thumbnail = public_path('/thumbnail');
        $this->singleimg = public_path('/singleimg');
        $this->upload = public_path('/upload');
        $this->files = public_path('/files');
    }
    public function index()
    {
        // dd("Supper admin  panel");
        return view('superAdmin.index');
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
        return view('superAdmin.loginhistory.index', compact('loginhistories'));
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
        $categories = Category::latest()->get();

        if ($request->ajax()) {
            $categories = Category::latest()->get();
            // https://www.itsolutionstuff.com/post/laravel-datatables-date-range-filter-exampleexample.html
            // if ($request->has('from_date') && $request->has('to_date')) {
            if ($request->filled('from_date') && $request->filled('to_date')) {
                $start_date = $request->from_date;
                $end_date = $request->to_date;
                if ($start_date && $end_date) {
                    $start_date = date('Y-m-d', strtotime($start_date));
                    $end_date = date('Y-m-d', strtotime($end_date));

                    $categories = $categories->whereBetween('created_at', [$start_date, $end_date]);
                }
            }

            // $start_date = (!empty($_GET["start_date"])) ? ($_GET["start_date"]) : ('');
            // $end_date = (!empty($_GET["end_date"])) ? ($_GET["end_date"]) : ('');

            // if($start_date && $end_date){
            //     $start_date = date('Y-m-d', strtotime($start_date));
            //     $end_date = date('Y-m-d', strtotime($end_date));

            // }
            // $categories->whereRaw("date(categories.created_at) >= '" . $start_date . "' AND date(categories.created_at) <= '" . $end_date . "'");

            return Datatables::of($categories)
                ->addIndexColumn()
                // https://laracasts.com/discuss/channels/general-discussion/laraveldatatables-custom-filter-interfering-with-standard-search
                // https://github.com/yajra/laravel-datatables/issues/768

                // https://www.itsolutionstuff.com/post/custom-filter-search-with-laravel-datatables-exampleexample.html  
                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name_' . app()->getLocale()))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name_' . app()->getLocale()], $request->get('name_' . app()->getLocale())) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name_' . app()->getLocale()]), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name_' . app()->getLocale()]), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }

                })
                ->addColumn('category_img', function ($row) {
                    if (!isset($row->category_img)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->category_img) .
                            '" alt="' . $row->name_en . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('images/' . $row->category_img) .
                        '" alt="' . $row->name_en . '" style="height: 40px;" >';
                })



                ->addColumn('parent', function ($row) {
                    if ($row->parent_id != '0') {
                        $parent = Category::find($row->parent_id);
                        return '<a href="' . $row->id . '">' . $parent->{'name_' . app()->getLocale()} . '</a>';
                        // return $parent->{'name_' . app()->getLocale()};
                    } else {
                        return '';
                    }
                })
                ->addColumn('status', function ($row) {

                    if (!empty($row->status)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {



                    // Update Button 
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-name_en="' . $row->name_en . '"
                            data-name_bn="' . $row->name_bn . '" 
                            data-title_en="' . $row->title_en . '" 
                            data-title_bn="' . $row->title_bn . '"
                            data-slug_en="' . $row->slug_en . '"
                            data-slug_bn="' . $row->slug_bn . '" 
                            data-pid="' . $row->parent_id . '"
                            data-status="' . $row->status . '" 
                            data-category_img="' . $row->category_img . '"
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i> <span> Edit</span></a>';

                    // Delete Button    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deleteCategory"><i class="fa fa-trash"></i><span> Delete</span></a>';


                    $nasted = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action
                              <span class="caret"></span>
                              <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" class="open-EditCategoryDialog btn btn-link" data-toggle="modal" data-target="#editModal" ><i class="dripicons-document-edit"></i> ' . $updateButton . ' </button>
                                </li>
                                <li class="divider"></li>
                                <li>
                                  <button type="submit" class="btn btn-link" onclick="return confirmDelete()">' . $deleteButton . '
                                </button> 
                                </li>
                            </ul>
                        </div>';

                    return $nasted;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.category.index', compact('categories'));

        // return (new Categorycrud)->categoryindex($request);
        // Log::channel('categorylog')->critical('Category Log file', ['data' => $categories]);
    }
    public function categorycreate()
    {
        $categories = Category::where('parent_id', 0)->get();
        return view('superAdmin.category.create', compact('categories'));
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
        $categories = Category::where('parent_id', '==', '')->orderBy('id', 'desc')->paginate(5);
        if ($request->ajax()) {
            return view('superadmin.category.pagination-index', compact('categories'))->render();
            // return Response::json(View::make('superadmin.category.pagination-index', ['categories' =>$categories])->render()); 
        }
        return view('superadmin.category.pagination-index', compact('categories'));
    }
    public function categorySearch(Request $request)
    {
        if ($request->ajax()) {
            $categories = Category::where('name_' . app()->getLocale(), 'LIKE', '%' . $request->search . "%")
                ->orderBy('id', 'DESC')
                ->paginate(5);

            if ($categories->count() >= 1) {
                return view('superadmin.category.pagination-index', compact('categories'))->render();
            } else {
                return response()->json(['status' => "Nothing Found"]);
            }
        }
    }
    public function categoryCheckname($nameValue)
    {

        $category = Category::where('name_bn', $nameValue)->Orwhere('name_en', $nameValue)->first();

        if ($category) {
            echo "Name already exist";
        } else {
            echo "Available";
        }

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
        $brand = Brand::latest()->get();

        if ($request->ajax()) {
            $brand = Brand::latest()->get();

            return Datatables::of($brand)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('brand_name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['brand_name'], $request->get('brand_name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['brand_name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['brand_name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })
                ->addColumn('brand_image', function ($row) {
                    if (!isset($row->brand_image)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->brand_image) .
                            '" alt="' . $row->brand_name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('images/' . $row->brand_image) .
                        '" alt="' . $row->brand_name . '" style="height: 40px;" >';
                })


                ->addColumn('status', function ($row) {
                    if (!empty($row->status)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-brand_name="' . $row->brand_name . '"
                            data-brand_image="' . $row->brand_image . '"                    
                            data-status="' . $row->status . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deleteunit"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.brand.index', compact('brand'));

    }
    public function brandcreate()
    {
        $categories = Brand::get();
        return view('superAdmin.brand.create', compact('categories'));
    }
    public function brandstore(Request $request)
    {
        return (new Categorycrud)->brandstore($request);
    }

    public function brandpublish($id)
    {
        return (new Categorycrud)->brandpublish($id);
    }
    public function brandunpublish($id)
    {
        return (new Categorycrud)->brandunpublish($id);
    }
    public function branddestroy($id)
    {
        return (new Categorycrud)->branddestroy($id);
    }
    public function brandimagesearch(Request $request)
    {
        // return (new Categorycrud)->brandimagesearch($request);
    }

    // ========================Unit===================    
    public function unitindex(Request $request)
    {
        $units = Unit::latest()->get();

        if ($request->ajax()) {
            $units = Unit::latest()->get();

            return Datatables::of($units)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('base_unit'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['base_unit'], $request->get('base_unit')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['base_unit']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['base_unit']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })


                ->addColumn('status', function ($row) {
                    if (!empty($row->status)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-base_unit="' . $row->base_unit . '"
                            data-short_name="' . $row->short_name . '"    
                            data-unit_code="' . $row->unit_code . '"
                            data-operator="' . $row->operator . '"      
                            data-operation_value="' . $row->operation_value . '"                                           
                            data-status="' . $row->status . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deleteunit"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.unit.index', compact('units'));

    }
    public function unitstore(Request $request)
    {
        return (new Categorycrud)->unitstore($request);
    }

    public function unitpublish($id)
    {
        return (new Categorycrud)->unitpublish($id);
    }
    public function unitunpublish($id)
    {
        return (new Categorycrud)->unitunpublish($id);
    }
    public function unitdestroy($id)
    {
        return (new Categorycrud)->unitdestroy($id);
    }
    // ========================Tax===================    
    public function taxindex(Request $request)
    {
        $taxs = Tax::latest()->get();

        if ($request->ajax()) {
            $taxs = Tax::latest()->get();

            return Datatables::of($taxs)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })


                ->addColumn('status', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-name="' . $row->name . '"
                            data-rate="' . $row->rate . '"                                             
                            data-status="' . $row->is_active . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletetax"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.tax.index', compact('taxs'));

    }
    public function taxstore(Request $request)
    {
        return (new Categorycrud)->taxstore($request);
    }

    public function taxpublish($id)
    {
        return (new Categorycrud)->taxpublish($id);
    }
    public function taxunpublish($id)
    {
        return (new Categorycrud)->taxunpublish($id);
    }
    public function taxdestroy($id)
    {
        return (new Categorycrud)->taxdestroy($id);
    }
    // ========================Courier=======================    
    public function courierindex(Request $request)
    {
        $couriers = Courier::latest()->get();

        if ($request->ajax()) {
            $couriers = Courier::latest()->get();

            return Datatables::of($couriers)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-name="' . $row->name . '"
                            data-phone="' . $row->phone . '"                                             
                            data-address="' . $row->address . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletecourier"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.courier.index', compact('couriers'));

    }
    public function courierstore(Request $request)
    {
        return (new Categorycrud)->courierstore($request);
    }

    public function courierpublish($id)
    {
        return (new Categorycrud)->courierpublish($id);
    }
    public function courierunpublish($id)
    {
        return (new Categorycrud)->courierunpublish($id);
    }
    public function courierdestroy($id)
    {
        return (new Categorycrud)->courierdestroy($id);
    }
    // ========================Coupon===================    
    public function couponindex(Request $request)
    {
        $coupons = Coupon::latest()->get();
        // $coupons = Coupon::where('is_active', true)->orderBy('id', 'desc')->get();        
        if ($request->ajax()) {
            $coupons = Coupon::latest()->get();

            return Datatables::of($coupons)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })
                ->addColumn('type', function ($row) {
                    if ($row->type == 'percentage') {
                        return '<div class="badge badge-primary">' . $row->type . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . $row->type . '</div>';
                    }
                })
                ->addColumn('minimum_amount', function ($row) {
                    if ($row->minimum_amount) {
                        return $row->minimum_amount;
                    } else {
                        return 'N/A';
                    }
                })
                ->addColumn('qty', function ($row) {
                    if (($row->quantity - $row->used)) {
                        return '<div class="badge badge-success">' . ($row->quantity - $row->used) . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . ($row->quantity - $row->used) . '</div>';
                    }
                })
                ->addColumn('expired_date', function ($row) {
                    if ($row->expired_date >= date("Y-m-d")) {
                        return '<div class="badge badge-success">' . date('d-m-Y', strtotime($row->expired_date)) . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . date('d-m-Y', strtotime($row->expired_date)) . '</div>';
                    }
                })
                ->addColumn('user_name', function ($row) {
                    $created_by = DB::table('users')->find($row->user_id);
                    return $created_by->name;
                })


                ->addColumn('status', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-code="' . $row->code . '"
                            data-type="' . $row->type . '"    
                            data-amount="' . $row->amount . '"
                            data-minimum_amount="' . $row->minimum_amount . '"      
                            data-quantity="' . $row->quantity . '"                                           
                            data-used="' . $row->used . '"                                           
                            data-expired_date="' . date('Y-m-d', strtotime($row->expired_date)) . '"                                           
                            data-user_id="' . $row->user_id . '"                                           
                            data-status="' . $row->is_active . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm  editCoupon "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletecoupon"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.coupon.index', compact('coupons'));

    }

    /**
     * Summary of couponGenerateCode
     * @return mixed
     */
    public function couponGenerateCode()
    {
        // Available alpha caracters
        $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

        // generate a pin based on 2 * 7 digits + a random character
        $pin = mt_rand(1000000, 9999999)
            . mt_rand(1000000, 9999999)
            . $characters[rand(0, strlen($characters) - 1)];

        // shuffle the result
        $string = str_shuffle($pin);
        return $string;
    }
    public function couponstore(Request $request)
    {
        return (new Categorycrud)->couponstore($request);
    }
    public function couponpublish($id)
    {
        return (new Categorycrud)->couponpublish($id);
    }
    public function couponunpublish($id)
    {
        return (new Categorycrud)->couponunpublish($id);
    }
    public function coupondestroy($id)
    {
        return (new Categorycrud)->coupondestroy($id);
    }


    // ========================Accounting ===================    
    public function accountsindex()
    {

        $lims_account_all = Account::where('is_active', true)->get();
        return view('superadmin.account.index', compact('lims_account_all'));

    }
    public function accountsStore(Request $request)
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
    public function accountsUpdate(Request $request)
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

    public function accountStatement(Request $request)
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
    // ========================MoneyTransfer===================  
    public function moneyTransfersindex()
    {
        $lims_money_transfer_all = MoneyTransfer::get();
        $lims_account_list = Account::where('is_active', true)->get();
        return view('superadmin.money_transfer.index', compact('lims_money_transfer_all', 'lims_account_list'));
    }

    public function moneyTransfersStore(Request $request)
    {
        $data = $request->all();
        $data['reference_no'] = 'mtr-' . date("Ymd") . '-' . date("his");
        MoneyTransfer::create($data);
        return redirect()->back()->with('message', 'Money transfered successfully');
    }


    public function moneyTransfersupdate(Request $request)
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
    // ========================cashRegister===================    
    public function cashRegisterindex(Request $request)
    {
        $lims_cash_register_all = CashRegister::with('user', 'warehouse')->get();
        if ($request->ajax()) {
            $cashRegisters = CashRegister::latest()->get();
            // $lims_cash_register_all = CashRegister::with('user', 'warehouse')->get();

            return Datatables::of($cashRegisters)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })
                ->addColumn('type', function ($row) {
                    if ($row->type == 'percentage') {
                        return '<div class="badge badge-primary">' . $row->type . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . $row->type . '</div>';
                    }
                })
                ->addColumn('minimum_amount', function ($row) {
                    if ($row->minimum_amount) {
                        return $row->minimum_amount;
                    } else {
                        return 'N/A';
                    }
                })
                ->addColumn('qty', function ($row) {
                    if (($row->quantity - $row->used)) {
                        return '<div class="badge badge-success">' . ($row->quantity - $row->used) . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . ($row->quantity - $row->used) . '</div>';
                    }
                })
                ->addColumn('expired_date', function ($row) {
                    if ($row->expired_date >= date("Y-m-d")) {
                        return '<div class="badge badge-success">' . date('d-m-Y', strtotime($row->expired_date)) . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . date('d-m-Y', strtotime($row->expired_date)) . '</div>';
                    }
                })
                ->addColumn('user_name', function ($row) {
                    $created_by = DB::table('users')->find($row->user_id);
                    return $created_by->name;
                })


                ->addColumn('status', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-code="' . $row->code . '"
                            data-type="' . $row->type . '"    
                            data-amount="' . $row->amount . '"
                            data-minimum_amount="' . $row->minimum_amount . '"      
                            data-quantity="' . $row->quantity . '"                                           
                            data-used="' . $row->used . '"                                           
                            data-expired_date="' . date('Y-m-d', strtotime($row->expired_date)) . '"                                           
                            data-user_id="' . $row->user_id . '"                                           
                            data-status="' . $row->is_active . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm  editcashRegister "> <i class="fas fa-edit"></i></a>';



                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletecashRegister"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.cash_register.index', compact('lims_cash_register_all'));

    }

    /**
     * Summary of cashRegisterGenerateCode
     * @return mixed
     */
    public function cashRegisterGenerateCode()
    {
        // Available alpha caracters
        $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

        // generate a pin based on 2 * 7 digits + a random character
        $pin = mt_rand(1000000, 9999999)
            . mt_rand(1000000, 9999999)
            . $characters[rand(0, strlen($characters) - 1)];

        // shuffle the result
        $string = str_shuffle($pin);
        return $string;
    }
    public function cashRegisterstore(Request $request)
    {
        return (new Categorycrud)->cashRegisterstore($request);
    }
    public function cashRegisterpublish($id)
    {
        return (new Categorycrud)->cashRegisterpublish($id);
    }
    public function cashRegisterunpublish($id)
    {
        return (new Categorycrud)->cashRegisterunpublish($id);
    }
    public function cashRegisterdestroy($id)
    {
        return (new Categorycrud)->cashRegisterdestroy($id);
    }

    public function cashRegisterclose(Request $request)
    {
        $cash_register_data = CashRegister::find($request->cash_register_id);
        $cash_register_data->status = 0;
        $cash_register_data->save();
        return redirect()->back()->with('message', 'Cash register closed successfully');
    }

    // ========================Department ===================   
    public function departmentsindex()
    {
        $lims_department_all = Department::where('is_active', true)->get();
        return view('superAdmin.department.index', compact('lims_department_all'));
    }

    public function departmentsStore(Request $request)
    {
        $data = $request->all();
        $data['is_active'] = true;
        Department::create($data);
        return redirect('superAdmin/departments')->with('message', 'Department created successfully');
    }

    public function departmentsUpdate(Request $request)
    {
        $data = $request->all();
        $lims_department_data = Department::find($data['department_id']);
        $lims_department_data->update($data);
        return redirect('superAdmin/departments')->with('message', 'Department updated successfully');
    }

    public function deleteBySelectionDepartment(Request $request)
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

    // ========================Employee===================    
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



    public function employeesStore(Request $request)
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

    public function employeesUpdate(Request $request)
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

    public function deleteBySelectionEmployee(Request $request)
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
    // ========================Payroll===================    
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


    public function payrollStore(Request $request)
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


    public function payrollUpdate(Request $request)
    {
        $data = $request->all();
        $lims_payroll_data = Payroll::find($data['payroll_id']);
        $lims_payroll_data->update($data);
        return redirect('superAdmin/payroll')->with('message', 'Payroll updated succesfully');
    }

    public function deleteBySelectionPayroll(Request $request)
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

        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_brand_list = Brand::where('status', true)->get();
        $lims_category_list = Category::where('status', true)->get();
        $general_setting = DB::table('general_settings')->latest()->first();


        if (Auth::user()->role_id > 2 && $general_setting->staff_access == 'own')
            $lims_stock_count_all = StockCount::orderBy('id', 'desc')->where('user_id', Auth::id())->get();
        else
            $lims_stock_count_all = StockCount::orderBy('id', 'desc')->get();

        return view('superadmin.stock_count.index', compact('lims_warehouse_list', 'lims_brand_list', 'lims_category_list', 'lims_stock_count_all'));

    }

    public function stockCountStore(Request $request)
    {
        $data = $request->all();
        if (isset($data['brand_id']) && isset($data['category_id'])) {
            $lims_product_list = DB::table('products')
                ->join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
                ->whereIn('products.category_id', $data['category_id'])
                ->whereIn('products.brand_id', $data['brand_id'])
                ->where([['products.is_active', true], ['product_warehouses.warehouse_id', $data['warehouse_id']]])
                ->select('products.product_name', 'products.product_code', 'product_warehouses.imei_number', 'product_warehouses.qty')
                ->get();

            $data['category_id'] = implode(",", $data['category_id']);
            $data['brand_id'] = implode(",", $data['brand_id']);
        } elseif (isset($data['category_id'])) {
            $lims_product_list = DB::table('products')
                ->join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
                ->whereIn('products.category_id', $data['category_id'])
                ->where([['products.is_active', true], ['product_warehouses.warehouse_id', $data['warehouse_id']]])
                ->select('products.product_name', 'products.product_code', 'product_warehouses.imei_number', 'product_warehouses.qty')
                ->get();

            $data['category_id'] = implode(",", $data['category_id']);
        } elseif (isset($data['brand_id'])) {
            $lims_product_list = DB::table('products')
                ->join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
                ->whereIn('products.brand_id', $data['brand_id'])
                ->where([['products.is_active', true], ['product_warehouses.warehouse_id', $data['warehouse_id']]])
                ->select('products.product_name', 'products.product_code', 'product_warehouses.imei_number', 'product_warehouses.qty')
                ->get();

            $data['brand_id'] = implode(",", $data['brand_id']);
        } else {
            $lims_product_list = DB::table('products')
                ->join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
                ->where([['products.is_active', true], ['product_warehouses.warehouse_id', $data['warehouse_id']]])
                ->select('products.product_name', 'products.product_code', 'product_warehouses.imei_number', 'product_warehouses.qty')
                ->get();
        }
        if (count($lims_product_list)) {
            $csvData = array('Product Name, Product Code, IMEI or Serial Numbers, Expected, Counted');
            foreach ($lims_product_list as $product) {
                $csvData[] = $product->product_name . ',' . $product->product_code . ',' . str_replace(",", "/", $product->imei_number) . ',' . $product->qty . ',' . '';
            }
            //return $csvData;
            $filename = date('Ymd') . '-' . date('his') . ".csv";
            $file_path = public_path() . '/stock_count/' . $filename;
            $file = fopen($file_path, "w+");
            foreach ($csvData as $cellData) {
                fputcsv($file, explode(',', $cellData));
            }
            fclose($file);

            $data['user_id'] = Auth::id();
            $data['reference_no'] = 'scr-' . date("Ymd") . '-' . date("his");
            $data['initial_file'] = $filename;
            $data['is_adjusted'] = false;
            StockCount::create($data);
            return redirect()->back()->with('message', 'Stock Count created successfully! Please download the initial file to complete it.');
        } else
            return redirect()->back()->with('not_permitted', 'No product found!');
    }

    public function finalize(Request $request)
    {
        $ext = pathinfo($request->final_file->getClientOriginalName(), PATHINFO_EXTENSION);
        //checking if this is a CSV file
        if ($ext != 'csv')
            return redirect()->back()->with('not_permitted', 'Please upload a CSV file');

        $data = $request->all();
        $document = $request->final_file;
        $documentName = date('Ymd') . '-' . date('his') . ".csv";
        $document->move('public/stock_count/', $documentName);
        $data['final_file'] = $documentName;
        $lims_stock_count_data = StockCount::find($data['stock_count_id']);
        $lims_stock_count_data->update($data);
        return redirect()->back()->with('message', 'Stock Count finalized successfully!');
    }

    public function stockDif($id)
    {
        $lims_stock_count_data = StockCount::find($id);
        $file_handle = fopen('public/stock_count/' . $lims_stock_count_data->final_file, 'r');
        $i = 0;
        $temp_dif = -1000000;
        $data = [];
        $product = [];
        while (!feof($file_handle)) {
            $current_line = fgetcsv($file_handle);
            if ($current_line && $i > 0 && ($current_line[3] != $current_line[4])) {
                $product[] = $current_line[0] . ' [' . $current_line[1] . ']';
                $expected[] = $current_line[3];
                $product_data = Product::where('code', $current_line[1])->first();

                if ($current_line[4]) {
                    $difference[] = $temp_dif = $current_line[4] - $current_line[3];
                    $counted[] = $current_line[4];
                } else {
                    $difference[] = $temp_dif = $current_line[3] * (-1);
                    $counted[] = 0;
                }
                $cost[] = $product_data->cost * $temp_dif;
            }
            $i++;
        }
        if ($temp_dif == -1000000) {
            $lims_stock_count_data->is_adjusted = true;
            $lims_stock_count_data->save();
        }
        if (count($product)) {
            $data[] = $product;
            $data[] = $expected;
            $data[] = $counted;
            $data[] = $difference;
            $data[] = $cost;
            $data[] = $lims_stock_count_data->is_adjusted;
        }
        return $data;
    }

    public function qtyAdjustment($id)
    {
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_stock_count_data = StockCount::find($id);
        $warehouse_id = $lims_stock_count_data->warehouse_id;
        $file_handle = fopen('public/stock_count/' . $lims_stock_count_data->final_file, 'r');
        $i = 0;
        $product_id = [];
        while (!feof($file_handle)) {
            $current_line = fgetcsv($file_handle);
            if ($current_line && $i > 0 && ($current_line[3] != $current_line[4])) {
                $product_data = Product::where('code', $current_line[1])->first();
                $product_id[] = $product_data->id;
                $names[] = $current_line[0];
                $code[] = $current_line[1];

                if ($current_line[4])
                    $temp_qty = $current_line[4] - $current_line[3];
                else
                    $temp_qty = $current_line[3] * (-1);

                if ($temp_qty < 0) {
                    $qty[] = $temp_qty * (-1);
                    $action[] = '-';
                } else {
                    $qty[] = $temp_qty;
                    $action[] = '+';
                }
            }
            $i++;
        }
        return view('superadmin.stock_count.qty_adjustment', compact('lims_warehouse_list', 'warehouse_id', 'id', 'product_id', 'names', 'code', 'qty', 'action'));
    }
    // ========================Holiday===================   
    public function holidaysCountindex()
    {
        $approve_permission = true;
        $lims_holiday_list = Holiday::orderBy('id', 'desc')->get();
        return view('superadmin.holiday.index', compact('lims_holiday_list', 'approve_permission'));
    }


    public function holidaysCountStore(Request $request)
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
                $holidays[$start] = date($general_setting->date_format, strtotime($holiday_found->from_date)) . ' ' . trans("file.To") . ' ' . date($general_setting->date_format, strtotime($holiday_found->to_date));
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

    public function holidaysCountUpdate(Request $request)
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

    public function deleteBySelectionHoliday(Request $request)
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
    // ========================giftcard===================    
    public function giftcardindex(Request $request)
    {
        $lims_customer_list = Customer::where('is_active', true)->get();
        $lims_user_list = User::where('status_id', true)->get();
        $lims_gift_card_all = GiftCard::where('is_active', true)->orderBy('id', 'desc')->get();
        if ($request->ajax()) {
            $giftcards = Giftcard::latest()->get();
            return Datatables::of($giftcards)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('card_no'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['card_no'], $request->get('card_no')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['card_no']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['card_no']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })
                ->addColumn('cuser', function ($row) {
                    if ($row->customer_id) {
                        $customer = DB::table('customers')->find($row->customer_id);
                        $client = $customer->name;
                        return $client;
                    } else {
                        $user = DB::table('users')->find($row->user_id);
                        $client = $user->name;
                        return $client;
                    }
                })
                ->addColumn('blance', function ($row) {
                    return ($row->amount - $row->expense);
                })
                ->addColumn('expired_date', function ($row) {
                    if ($row->expired_date >= date("Y-m-d")) {
                        return '<div class="badge badge-success">' . date('d-m-Y', strtotime($row->expired_date)) . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . date('d-m-Y', strtotime($row->expired_date)) . '</div>';
                    }
                })
                ->addColumn('user_name', function ($row) {
                    $username = DB::table('users')->find($row->created_by);
                    $username = $username->name;
                    return $username;
                })

                ->addColumn('status', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $rechargBtn = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#rechargeModal"
                            data-id="' . $row->id . '" 
                            data-amount="' . $row->amount . '"      
                            data-card_no="' . $row->card_no . '"      
                            data-original-title="Edit" class="edit btn btn-primary btn-sm  recharge"><i class="fas fa-money-bill-wave-alt"></i></a>';

                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-card_no="' . $row->card_no . '"
                            data-amount="' . $row->amount . '"                            
                            data-customer_id="' . $row->customer_id . '"      
                            data-created_by="' . $row->created_by . '"                                           
                            data-expired_date="' . date('Y-m-d', strtotime($row->expired_date)) . '"                                           
                            data-user_id="' . $row->user_id . '"                                           
                            data-status="' . $row->is_active . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm  editgiftcard open-Edit_gift_card_Dialog"> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletegiftcard"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton . "" . $rechargBtn;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }
        return view('superadmin.giftcard.index', compact('lims_customer_list', 'lims_user_list', 'lims_gift_card_all'));

    }
    /**
     * Summary of giftcardGenerateCode
     * @return mixed
     */
    public function giftcardGenerateCode()
    {
        // Available alpha caracters
        $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

        // generate a pin based on 2 * 7 digits + a random character
        $pin = mt_rand(1000000, 9999999)
            . mt_rand(1000000, 9999999)
            . $characters[rand(0, strlen($characters) - 1)];

        // shuffle the result
        $string = str_shuffle($pin);
        return $string;
    }
    public function giftcardecharge(Request $request, $id)
    {
        $data = $request->all();
        $data['user_id'] = Auth::id();
        $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
        if ($lims_gift_card_data->customer_id)
            $lims_customer_data = Customer::find($lims_gift_card_data->customer_id);
        else
            $lims_customer_data = User::find($lims_gift_card_data->user_id);

        $lims_gift_card_data->amount += $data['amount'];
        $lims_gift_card_data->save();
        GiftCardRecharge::create($data);
        $message = 'GiftCard recharged successfully';
        if ($lims_customer_data->email) {
            $data['email'] = $lims_customer_data->email;
            $data['name'] = $lims_customer_data->name;
            $data['card_no'] = $lims_gift_card_data->card_no;
            $data['balance'] = $lims_gift_card_data->amount - $lims_gift_card_data->expense;
            try {
                Mail::send('mail.gift_card_recharge', $data, function ($message) use ($data) {
                    $message->to($data['email'])->subject('GiftCard Recharge Info');
                });
            } catch (\Exception $e) {
                $message = 'GiftCard recharged successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('superAdmin/gifcard')->with('message', $message);
    }
    public function giftcardrecharge(Request $request, $id)
    {
        $data = $request->all();
        $data['user_id'] = Auth::id();
        $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
        if ($lims_gift_card_data->customer_id)
            $lims_customer_data = Customer::find($lims_gift_card_data->customer_id);
        else
            $lims_customer_data = User::find($lims_gift_card_data->user_id);
        $lims_gift_card_data->amount += $data['amount'];
        $lims_gift_card_data->save();
        GiftCardRecharge::create($data);
        $message = 'GiftCard recharged successfully';
        if ($lims_customer_data->email) {
            $data['email'] = $lims_customer_data->email;
            $data['name'] = $lims_customer_data->name;
            $data['card_no'] = $lims_gift_card_data->card_no;
            $data['balance'] = $lims_gift_card_data->amount - $lims_gift_card_data->expense;
            try {
                Mail::send('mail.gift_card_recharge', $data, function ($message) use ($data) {
                    $message->to($data['email'])->subject('GiftCard Recharge Info');
                });
            } catch (\Exception $e) {
                $message = 'GiftCard recharged successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('superAdmin/giftcard')->with('message', $message);
    }
    public function giftcardstore(Request $request)
    {
        return (new Categorycrud)->giftcardstore($request);
    }
    public function giftcardupdate(Request $request, $id)
    {
        $request['card_no'] = $request['card_no_edit'];

        $data = $request->all();
        $lims_gift_card_data = GiftCard::find($data['id']);
        $lims_gift_card_data->card_no = $data['card_no_edit'];
        $lims_gift_card_data->amount = $data['amount_edit'];
        if ($data['user_edit']) {
            $lims_gift_card_data->user_id = $data['user_id_edit'];
            $lims_gift_card_data->customer_id = null;
        } else {
            $lims_gift_card_data->customer_id = $data['customer_id_edit'];
            $lims_gift_card_data->user_id = null;
        }
        $lims_gift_card_data->expired_date = $data['expired_date_edit'];
        $lims_gift_card_data->save();
        return redirect('superAdmin/giftcard')->with('message', 'GiftCard updated successfully');
    }
    public function giftcardpublish($id)
    {
        return (new Categorycrud)->giftcardpublish($id);
    }
    public function giftcardunpublish($id)
    {
        return (new Categorycrud)->giftcardunpublish($id);
    }
    public function giftcarddestroy($id)
    {
        return (new Categorycrud)->giftcarddestroy($id);
    }

    // ========================Coustomer===================    
    public function customerindex(Request $request)
    {


        if ($request->ajax()) {
            $customer = Customer::latest()->get();

            return Datatables::of($customer)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })
                ->addColumn('image', function ($row) {
                    if (!isset($row->image)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->image) .
                            '" alt="' . $row->name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('images/' . $row->image) .
                        '" alt="' . $row->name . '" style="height: 40px;" >';
                })
                ->addColumn('coustomer', function ($row) {

                    $customer = $row->name . "</br>" . $row->phone_number . "</br>" . $row->address;
                    return $customer;

                })
                ->addColumn('discountplan', function ($row) {
                    // $product_data = DB::table('customers')
                    //     ->join('discount_plan_customers', 'customers.id', '=', 'discount_plan_customers.customer_id')  
                    //     ->join('discount_plan_discounts', 'discount_plan_customers.discount_plan_id', '=', 'discount_plan_discounts.discount_plan_id')
                    //     ->join('discount_plans', 'discount_plans.id', '=', 'discount_plan_discounts.discount_plan_id')  
                    //     ->select('discount_plans.*')
                    //     ->where('customers.id', $row->id)
                    //     ->get();
    
                    // return $product_data;
    
                    // ====================== oR =========
    
                    foreach ($row->discountPlans as $index => $discount_plan) {
                        if ($index) {
                            return (',' . $discount_plan->name);
                            // return  (','.$discount_plan->name);
                            // $discount_plan = (', '.$discount_plan->name);
                            // return $discount_plan;
                        } else {
                            $discount_plan = $discount_plan->name;
                            return $discount_plan;
                        }
                    }
                })
                ->addColumn('diposiblanse', function ($row) {
                    $diposit = ($row->deposit - $row->expense);
                    $dipovalue = number_format($diposit, 2);
                    return $dipovalue;
                })
                ->addColumn('due', function ($row) {
                    $returned_amount = DB::table('sales')
                        ->join('returns', 'sales.id', '=', 'returns.sale_id')
                        ->where([
                            ['sales.customer_id', $row->id],
                            ['sales.payment_status', '!=', 4]
                        ])
                        ->sum('returns.grand_total');
                    $saleData = DB::table('sales')->where([
                        ['customer_id', $row->id],
                        ['payment_status', '!=', 4]
                    ])
                        ->selectRaw('SUM(grand_total) as grand_total,SUM(paid_amount) as paid_amount')
                        ->first();

                    $diposit = ($saleData->grand_total - $returned_amount - $saleData->paid_amount);
                    $dipovalue = number_format($diposit, 2);
                    return $dipovalue;
                })
                ->addColumn('cgroup', function ($row) {
                    $cgroups = DB::table('customers')
                        ->join('customer_groups', 'customer_groups.id', '=', 'customers.customer_group_id')
                        ->select('customer_groups.*')
                        ->where('customer_groups.id', $row->customer_group_id)
                        ->get();
                    foreach ($cgroups as $cgroup) {
                        return $cgroup->name;
                    }

                })

                ->addColumn('sale_status', function ($row) {

                    if ($row->sale_status == 1) {
                        $completed = '<div class="badge badge-success">' . trans('file.Completed') . '</div>';
                        return $completed;
                    } elseif ($row->sale_status == 2) {
                        $pending = '<div class="badge badge-danger">' . trans('file.Pending') . '</div>';
                        return $pending;
                    } else {
                        $draft = '<div class="badge badge-warning">' . trans('file.Draft') . '</div>';
                        return $draft;
                    }
                })
                ->addColumn('payment_status', function ($row) {
                    if ($row->payment_status == 1) {
                        $pending = '<div class="badge badge-danger">' . trans('file.Pending') . '</div>';
                        return $pending;
                    } elseif ($row->payment_status == 2) {
                        $due = '<div class="badge badge-danger">' . trans('file.Due') . '</div>';
                        return $due;
                    } elseif ($row->payment_status == 3) {
                        $draft = '<div class="badge badge-warning">' . trans('file.Partial') . '</div>';
                        return $draft;
                    } else {
                        $paid = '<div class="badge badge-success">' . trans('file.Paid') . '</div>';
                        return $paid;
                    }
                })


                ->addColumn('status', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-customer_group_id="' . $row->customer_group_id . '" 
                            data-image="' . $row->image . '"                    
                            data-name="' . $row->name . '"
                            data-address="' . $row->address . '"  
                            data-company_name="' . $row->company_name . '"                    
                            data-email="' . $row->email . '"   
                            data-phone_number="' . $row->phone_number . '"                    
                            data-city="' . $row->city . '"
                            data-postal_code="' . $row->postal_code . '"
                            data-country="' . $row->country . '"
                            data-deposit="' . $row->deposit . '"
                            data-tax_number="' . $row->tax_no . '"
                            data-expense="' . $row->expense . '"
                            data-points="' . $row->points . '"
                            data-status="' . $row->is_active . '" 

                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletecustomer"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }
        $lims_customer_group_all = CustomerGroup::where('is_active', true)->get();
        return view('superadmin.customer.index', compact('lims_customer_group_all'));
    }
    public function customercreate()
    {
        $customers = Customer::get();
        return view('superadmin.customer', compact('customers'));
    }
    public function customerstore(Request $request)
    {
        return (new Categorycrud)->customerstore($request);
    }

    public function customerpublish($id)
    {
        return (new Categorycrud)->customerpublish($id);
    }
    public function customerunpublish($id)
    {
        return (new Categorycrud)->customerunpublish($id);
    }
    public function customerdestroy($id)
    {
        return (new Categorycrud)->customerdestroy($id);
    }
    public function customerimagesearch(Request $request)
    {
        // return (new Categorycrud)->customerimagesearch($request);
    }


    // // ========================Coustomer Group===================    
    public function coustomergroupindex(Request $request)
    {

        if ($request->ajax()) {
            $coustomergroups = CustomerGroup::latest()->get();
            return Datatables::of($coustomergroups)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })


                ->addColumn('status', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '"                 
                            data-name="' . $row->name . '"    
                            data-percentage="' . $row->percentage . '"                                                        
                            data-status="' . $row->is_active . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletetex"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }
        $lims_customer_group_all = CustomerGroup::where('is_active', true)->get();
        return view('superadmin.customer_group.index', compact('lims_customer_group_all'));
    }
    public function coustomergroupstore(Request $request)
    {
        $lims_customer_group_data = $request->all();
        $lims_customer_group_data['is_active'] = true;
        CustomerGroup::create($lims_customer_group_data);
        return redirect('superAdmin/coustomergroup')->with('message', 'Data inserted successfully');
    }
    public function coustomergroupedit($id)
    {
        $lims_customer_group_data = CustomerGroup::find($id);
        return $lims_customer_group_data;
    }
    public function coustomergroupupdate(Request $request)
    {

        $input = $request->all();
        $lims_customer_group_data = CustomerGroup::find($input['customer_group_id']);

        $lims_customer_group_data->update($input);
        return redirect('superAdmin/coustomergroup')->with('message', 'Data updated successfully');
    }
    public function importCustomerGroup(Request $request)
    {
        //get file
        $upload = $request->file('file');
        $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
        if ($ext != 'csv')
            return redirect()->back()->with('not_permitted', 'Please upload a CSV file');
        $filename = $upload->getClientOriginalName();
        $upload = $request->file('file');
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

            $customer_group = CustomerGroup::firstOrNew(['name' => $data['name'], 'is_active' => true]);
            $customer_group->name = $data['name'];
            $customer_group->percentage = $data['percentage'];
            $customer_group->is_active = true;
            $customer_group->save();
        }
        return redirect('superAdmin/coustomergroup')->with('message', 'Customer Group imported successfully');

    }
    public function coustomergroupdestroy($id)
    {
        $lims_customer_group_data = CustomerGroup::find($id);
        $lims_customer_group_data->is_active = false;
        $lims_customer_group_data->save();
        return redirect('superAdmin/coustomergroup')->with('not_permitted', 'Data deleted successfully');
    }
    public function exportCustomerGroup(Request $request)
    {
        $lims_customer_group_data = $request['customer_groupArray'];
        $csvData = array('name, percentage');
        foreach ($lims_customer_group_data as $customer_group) {
            if ($customer_group > 0) {
                $data = CustomerGroup::where('id', $customer_group)->first();
                $csvData[] = $data->name . ',' . $data->percentage;
            }
        }
        $filename = "customer_group- " . date('d-m-Y') . ".csv";
        $file_path = public_path() . '/downloads/' . $filename;
        $file_url = url('/') . '/downloads/' . $filename;
        $file = fopen($file_path, "w+");
        foreach ($csvData as $exp_data) {
            fputcsv($file, explode(',', $exp_data));
        }
        fclose($file);
        return $file_url;
    }

    public function coustomerGroupDeleteBySelection(Request $request)
    {
        $customer_group_id = $request['customer_groupIdArray'];
        foreach ($customer_group_id as $id) {
            $lims_customer_group_data = CustomerGroup::find($id);
            $lims_customer_group_data->is_active = false;
            $lims_customer_group_data->save();
        }
        return 'Customer Group deleted successfully!';
    }

    // ========================discount===================    
    public function discountindex(Request $request)
    {
        $discounts = Discount::latest()->get();
        //   $discounts = Discount::with('discountPlans')->orderBy('id', 'desc')->get();
        if ($request->ajax()) {
            $discounts = Discount::with('discountPlans')->orderBy('id', 'desc')->get();
            return Datatables::of($discounts)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })

                ->addColumn('descountrate', function ($row) {
                    return $row->value . ' (' . $row->type . ')';
                })

                ->addColumn('startdate', function ($row) {
                    $stardate = date('d-M-Y', strtotime($row->valid_from));
                    return $stardate;
                })

                ->addColumn('enddate', function ($row) {
                    $stardate = date('d-M-Y', strtotime($row->valid_till));
                    return $stardate;
                })

                ->addColumn('descountPlan', function ($row) {

                    // $product_data = DB::table('discount_plan_discounts')
                    //         ->join('discount_plans', 'discount_plans.id', '=', 'discount_plan_discounts.discount_plan_id')  
                    //         ->join('discounts', 'discounts.id', '=', 'discount_plan_discounts.discount_id')
                    //         ->select('discount_plans.*')
                    //         ->where('discount_plan_discounts.discount_id', $row->id)
                    //         ->get();
    

                    foreach ($row->discountPlans as $key => $discount_plan) {
                        if ($key) {
                            return (',' . $discount_plan->name);
                        } else {
                            return $discount_plan->name;
                        }
                    }
                })

                ->addColumn('status', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="' . route('superAdmin.discount.edit', $row->id) . '" data-toggle="tooltip"  
                            data-id="' . $row->id . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editdiscount "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletedisconunt"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.discount.index', compact('discounts'));

    }
    public function discountcreate(Request $request)
    {
        $lims_discount_plan_list = DiscountPlan::where('is_active', true)->get();
        return view('superadmin.discount.create', compact('lims_discount_plan_list'));
    }
    public function discountstore(Request $request)
    {
        // print_r($request->all());
        // die();
        $data = $request->all();
        $data['valid_from'] = date('Y-m-d', strtotime($data['valid_from']));
        $data['valid_till'] = date('Y-m-d', strtotime($data['valid_till']));
        if (isset($data['product_list'])) {
            $data['product_list'] = implode(",", $data['product_list']);
        }
        $data['days'] = implode(",", $data['days']);
        $lims_discount_data = Discount::create($data);
        foreach ($data['discount_plan_id'] as $key => $discount_plan_id) {
            DiscountPlanDiscount::create([
                'discount_id' => $lims_discount_data->id,
                'discount_plan_id' => $discount_plan_id
            ]);
        }
        return redirect()->route('superAdmin.discount')->with('message', 'Discount created successfully');

        // print_r($request->all());
        // die();
        // return (new Categorycrud)->discountstore($request);
    }

    public function discountedit($id)
    {

        $lims_discount_data = Discount::find($id);



        $discount_plan_ids = DiscountPlanDiscount::where('discount_id', $id)->pluck('discount_plan_id')->toArray();
        $lims_discount_plan_list = DiscountPlan::where('is_active', true)->get();
        return view('superadmin.discount.edit', compact('lims_discount_data', 'discount_plan_ids', 'lims_discount_plan_list'));
    }

    public function discountupdate(Request $request, $id)
    {
        // print_r($request->discount_plan_id );
        // die();
        $data = $request->all();
        $lims_discount_data = Discount::find($id);
        $data['valid_from'] = date('Y-m-d', strtotime(str_replace("/", "-", $data['valid_from'])));
        $data['valid_till'] = date('Y-m-d', strtotime(str_replace("/", "-", $data['valid_till'])));
        if (!isset($data['is_active']))
            $data['is_active'] = 0;
        if ($data['applicable_for'] == 'All')
            $data['product_list'] = '';
        elseif (isset($data['product_list']))
            $data['product_list'] = implode(",", $data['product_list']);
        $data['days'] = implode(",", $data['days']);
        $pre_discount_plan_ids = DiscountPlanDiscount::where('discount_id', $id)->pluck('discount_plan_id')->toArray();
        //deleting previous discount plan id if not exist
        foreach ($pre_discount_plan_ids as $key => $discount_plan_id) {
            if (!in_array($discount_plan_id, $data['discount_plan_id'])) {
                DiscountPlanDiscount::where([
                    ['discount_plan_id', $discount_plan_id],
                    ['discount_id', $id]
                ])->first()->delete();
            }
        }
        //inserting new discount plan id
        foreach ($data['discount_plan_id'] as $key => $discount_plan_id) {
            if (!in_array($discount_plan_id, $pre_discount_plan_ids)) {
                DiscountPlanDiscount::create(['discount_plan_id' => $discount_plan_id, 'discount_id' => $id]);
            }
        }
        $lims_discount_data->update($data);
        return redirect()->route('superAdmin.discount')->with('message', 'Discount updated successfully');

        // print_r($request->all());
        // die();
        // return (new Categorycrud)->discountstore($request);
    }

    public function discountproductSearch($code)
    {

        $lims_product_data = Product::where([
            ['product_code', $code],
            ['is_active', true]
        ])->select('id', 'product_name', 'product_code')->first();

        if (!$lims_product_data) {
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')->where([
                ['product_variants.item_code', $code],
                ['products.is_active', true]
            ])->whereNotNull(['is_variant'])->select('products.id', 'products.product_name', 'products.product_code', 'product_variants.item_code')->first();
        }

        if ($lims_product_data) {
            $product[] = $lims_product_data->id;
            $product[] = $lims_product_data->product_name;
            $product[] = $lims_product_data->product_code;
            if (!empty($lims_product_data->item_code)) {
                $product[] = $lims_product_data->item_code;
            } else {
                $product[] = 'Null';
            }
            return $product;
        } else {
            return "Product not found";
        }
    }

    public function discountpublish($id)
    {
        return (new Categorycrud)->discountpublish($id);
    }
    public function discountunpublish($id)
    {
        return (new Categorycrud)->discountunpublish($id);
    }
    public function discountdestroy($id)
    {
        return (new Categorycrud)->discountdestroy($id);
    }

    // ========================discount Plan===================    
    public function discountplanindex(Request $request)
    {
        $lims_discount_plan_all = DiscountPlan::with('customers')->orderBy('id', 'desc')->get();

        if ($request->ajax()) {
            $discounts = DiscountPlan::latest()->get();
            return Datatables::of($discounts)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })


                ->addColumn('status', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = 'Discount';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletetex"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.discount_plan.index', compact('lims_discount_plan_all'));

    }
    public function discountPlancreate()
    {
        $lims_customer_list = Customer::where('is_active', true)->get();
        return view('superadmin.discount_plan.create', compact('lims_customer_list'));
    }



    public function discountPlanstore(Request $request)
    {
        $data = $request->all();
        if (!isset($data['is_active'])) {
            $data['is_active'] = 0;
        }
        $lims_discount_plan = DiscountPlan::create($data);
        foreach ($data['customer_id'] as $key => $customer_id) {
            DiscountPlanCustomer::create(['discount_plan_id' => $lims_discount_plan->id, 'customer_id' => $customer_id]);
        }
        return redirect()->route('superAdmin.discountPlan')->with('message', 'DiscountPlan created successfully');
    }


    public function discountPlanedit($id)
    {
        $lims_discount_plan = DiscountPlan::find($id);
        $lims_customer_list = Customer::where('is_active', true)->get();
        $customer_ids = DiscountPlanCustomer::where('discount_plan_id', $id)->pluck('customer_id')->toArray();
        return view('superadmin.discount_plan.edit', compact('lims_discount_plan', 'lims_customer_list', 'customer_ids'));
    }

    public function discountPlanupdate(Request $request, $id)
    {
        $data = $request->all();
        $lims_discount_plan = DiscountPlan::find($id);
        if (!isset($data['is_active'])) {
            $data['is_active'] = 0;
        }
        $pre_customer_ids = DiscountPlanCustomer::where('discount_plan_id', $id)->pluck('customer_id')->toArray();
        //deleting previous customer id if not exist
        foreach ($pre_customer_ids as $key => $customer_id) {
            if (!in_array($customer_id, $data['customer_id'])) {
                DiscountPlanCustomer::where([
                    ['discount_plan_id', $id],
                    ['customer_id', $customer_id]
                ])->first()->delete();
            }
        }
        //inserting new customer id
        foreach ($data['customer_id'] as $key => $customer_id) {
            if (!in_array($customer_id, $pre_customer_ids)) {
                DiscountPlanCustomer::create(['discount_plan_id' => $id, 'customer_id' => $customer_id]);
            }
        }
        $lims_discount_plan->update($data);
        return redirect()->route('superAdmin.discountPlan')->with('message', 'DiscountPlan updated successfully');
    }


    public function discountplanpublish($id)
    {
        return (new Categorycrud)->discountplanpublish($id);
    }
    public function discountplanunpublish($id)
    {
        return (new Categorycrud)->discountplanunpublish($id);
    }
    public function discountplandestroy($id)
    {
        return (new Categorycrud)->discountplandestroy($id);
    }

    // ========================warehouse===================    
    public function warehouseindex(Request $request)
    {
        $warehouses = Warehouse::latest()->get();

        if ($request->ajax()) {
            $warehouses = Warehouse::latest()->get();

            return Datatables::of($warehouses)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })


                ->addColumn('is_active', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-name="' . $row->name . '"
                            data-phone="' . $row->phone . '"    
                            data-email="' . $row->email . '"
                            data-address="' . $row->address . '"      
                            data-status="' . $row->is_active . '"      
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletewarehouse"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.warehouse.index', compact('warehouses'));

    }
    public function warehousestore(Request $request)
    {
        return (new Categorycrud)->warehousestore($request);
    }

    public function warehousepublish($id)
    {
        return (new Categorycrud)->warehousepublish($id);
    }
    public function warehouseunpublish($id)
    {
        return (new Categorycrud)->warehouseunpublish($id);
    }
    public function warehousedestroy($id)
    {
        return (new Categorycrud)->warehousedestroy($id);
    }


    // ========================promotion===================    
    public function promotionindex(Request $request)
    {
        $promotions = Promotion::latest()->get();

        if ($request->ajax()) {
            $promotions = Promotion::latest()->get();

            return Datatables::of($promotions)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })


                ->addColumn('is_active', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-name="' . $row->name . '"
                            data-phone="' . $row->phone . '"    
                            data-email="' . $row->email . '"
                            data-address="' . $row->address . '"      
                            data-status="' . $row->is_active . '"      
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletepromotion"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.promotion.index', compact('promotions'));

    }
    public function promotionstore(Request $request)
    {
        return (new Categorycrud)->promotionstore($request);
    }
    public function promotionpublish($id)
    {
        return (new Categorycrud)->promotionpublish($id);
    }
    public function promotionunpublish($id)
    {
        return (new Categorycrud)->promotionunpublish($id);
    }
    public function promotiondestroy($id)
    {
        return (new Categorycrud)->promotiondestroy($id);
    }
    // ========================barcode===================    
    public function barcodeindex(Request $request)
    {
        $products = Product::latest()->where('is_active', '1')->get();
        $barcodes = Barcode::latest()->get();
        $brands = Brand::latest()->where('status', '1')->get();

        if ($request->ajax()) {
            $barcodes = Barcode::latest()->get();
            return Datatables::of($barcodes)
                ->addIndexColumn()
                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('product_name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['product_name'], $request->get('product_name')) ? true : false;
                        });
                    }
                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['product_name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['product_name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })
                ->addColumn('product_code', function ($row) {
                    if (!isset($row->product_code)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->product_code) .
                            '" alt="' . $row->product_name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('/' . $row->product_code) .
                        '" alt="' . $row->product_name . '" style="height: 40px;" >';
                })

                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-product_name="' . $row->product_name . '"
                            data-brand="' . $row->brand . '" 
                            data-price="' . $row->price . '" 
                            data-product_code="' . $row->product_code . '"
                            data-description="' . $row->description . '"

                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletebarcode"><i class="fa fa-trash"></i></a>';
                    $nasted = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action
                            <span class="caret"></span>
                            <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" class="open-EditCategoryDialog btn btn-link" data-toggle="modal" data-target="#editModal" ><i class="dripicons-document-edit"></i> ' . $updateButton . ' </button>
                                </li>
                                <li class="divider"></li>
                                <li>
                                <button type="submit" class="btn btn-link" onclick="return confirmDelete()">' . $deleteButton . '
                                </button> 
                                </li>
                            </ul>
                        </div>';
                    return $nasted;
                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }
        return view('superadmin.barcode.index', compact('barcodes', 'products', 'brands'));

        // return (new Categorycrud)->categoryindex($request);
        // Log::channel('categorylog')->critical('Category Log file', ['data' => $categories]);

    }
    public function barcodestore(Request $request)
    {
        return (new Categorycrud)->barcodestore($request);
    }

    public function barcodeprint(Request $request)
    {
        return (new Categorycrud)->barcodeprint($request);
    }
    public function barcodedestroy($id)
    {
        return (new Categorycrud)->barcodedestroy($id);
    }


    // ========================supplier===================    
    public function supplierindex(Request $request)
    {
        $supplier = Supplier::latest()->get();

        if ($request->ajax()) {
            $supplier = Supplier::latest()->get();

            return Datatables::of($supplier)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })
                ->addColumn('image', function ($row) {
                    if (!isset($row->image)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->image) .
                            '" alt="' . $row->name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('images/' . $row->image) .
                        '" alt="' . $row->name . '" style="height: 40px;" >';
                })


                ->addColumn('status', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-image="' . $row->image . '"                    
                            data-name="' . $row->name . '"
                            data-address="' . $row->address . '"  
                             data-company_name="' . $row->company_name . '"                    
                            data-vat_number="' . $row->vat_number . '"
                            data-email="' . $row->email . '"   
                            data-phone_number="' . $row->phone_number . '"                    
                            data-city="' . $row->city . '"
                            data-postal_code="' . $row->postal_code . '"
                            data-country="' . $row->country . '"

                            data-status="' . $row->is_active . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletesupplier"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.supplier.index', compact('supplier'));

    }
    public function suppliercreate()
    {
        $suppliers = Supplier::get();
        return view('superadmin.supplier.create', compact('suppliers'));
    }
    public function supplierstore(Request $request)
    {
        return (new Categorycrud)->supplierstore($request);
    }

    public function supplierpublish($id)
    {
        return (new Categorycrud)->supplierpublish($id);
    }
    public function supplierunpublish($id)
    {
        return (new Categorycrud)->supplierunpublish($id);
    }
    public function supplierdestroy($id)
    {
        return (new Categorycrud)->supplierdestroy($id);
    }
    public function supplierimagesearch(Request $request)
    {
        // return (new Categorycrud)->supplierimagesearch($request);
    }

    // ========================Biller===================    
    public function billerindex(Request $request)
    {
        $biller = Biller::latest()->get();

        if ($request->ajax()) {
            $biller = Biller::latest()->get();

            return Datatables::of($biller)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['name'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })
                ->addColumn('image', function ($row) {
                    if (!isset($row->image)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->image) .
                            '" alt="' . $row->name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('images/' . $row->image) .
                        '" alt="' . $row->name . '" style="height: 40px;" >';
                })


                ->addColumn('status', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-image="' . $row->image . '"                    
                            data-name="' . $row->name . '"
                            data-address="' . $row->address . '"  
                             data-company_name="' . $row->company_name . '"                    
                            data-vat_number="' . $row->vat_number . '"
                            data-email="' . $row->email . '"   
                            data-phone_number="' . $row->phone_number . '"                    
                            data-city="' . $row->city . '"
                            data-postal_code="' . $row->postal_code . '"
                            data-country="' . $row->country . '"

                            data-status="' . $row->is_active . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletebiller"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.biller.index', compact('biller'));

    }
    public function billercreate()
    {
        $billers = Biller::get();
        return view('superadmin.biller.create', compact('billers'));
    }
    public function billerstore(Request $request)
    {
        return (new Categorycrud)->billerstore($request);
    }

    public function billerpublish($id)
    {
        return (new Categorycrud)->billerpublish($id);
    }
    public function billerunpublish($id)
    {
        return (new Categorycrud)->billerunpublish($id);
    }
    public function billerdestroy($id)
    {
        return (new Categorycrud)->billerdestroy($id);
    }
    public function billerimagesearch(Request $request)
    {
        // return (new Categorycrud)->billerimagesearch($request);
    }
    // ========================Purchase===================    
    public function purchaseindex(Request $request)
    {

        $purchase = Purchase::latest()->get();
        $supplier = Supplier::latest()->get();
        if ($request->ajax()) {
            $purchase = Purchase::latest()->get();
            if ($request->filled('from_date') && $request->filled('to_date')) {
                $purchase = $purchase->whereBetween('created_at', [$request->from_date, $request->to_date]);
            }
            // custom field search
            $custompurchase = Purchase::select('*');
            ;
            if ($request->filled('warehouse_id')) {
                $purchase = $custompurchase->where('warehouse_id', $request->warehouse_id);
            }
            if ($request->filled('purchase_status')) {
                $purchase = $custompurchase->where('purchase_status', $request->purchase_status);
            }
            if ($request->filled('payment_status')) {
                $purchase = $custompurchase->where('payment_status', $request->payment_status);
            }
            if ($request->filled('purchase_name')) {
                $purchase = $custompurchase->where('reference_no', 'like', '%' . $request->purchase_name . '%');
            }
            return Datatables::of($purchase)
                ->addIndexColumn()

                // ->filter(function ($instance) use ($request) {
                //     if (!empty($request->get('purchase_name'))) {
                //         $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                //             return Str::contains($row['reference_no'], $request->get('purchase_name')) ? true : false;
                //         });
                //     } 
                //     if (!empty($request->get('search'))) {
                //         $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                //             if (Str::contains(Str::lower($row['reference_no' ]), Str::lower($request->get('search')))){
                //                 return true;
                //             }else if (Str::contains(Str::lower($row['reference_no' ]), Str::lower($request->get('search')))) {
                //                 return true;
                //             }   
                //             return false;
                //         });
                //     }
                // })     

                ->addColumn('image', function ($row) {
                    if (!isset($row->image)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->image) .
                            '" alt="' . $row->name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('images/' . $row->image) .
                        '" alt="' . $row->name . '" style="height: 40px;" >';
                })

                ->addColumn('suppler', function ($row) {
                    $suppliers = DB::table('purchases')
                        ->join('suppliers', 'suppliers.id', '=', 'purchases.supplier_id')
                        ->select('suppliers.name')
                        ->where('suppliers.id', $row->supplier_id)
                        ->get();
                    foreach ($suppliers as $supplier) {
                        return $supplier->name;
                    }

                })

                ->addColumn('purchase_status', function ($row) {
                    if ($row->purchase_status == 1) {
                        return '<div class="badge badge-success">' . trans('Recieved') . '</div>';
                    } elseif ($row->purchase_status == 2) {
                        return '<div class="badge badge-success">' . trans('Partial') . '</div>';
                    } elseif ($row->purchase_status == 3) {
                        return '<div class="badge badge-danger">' . trans('Pending') . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . trans('Ordered') . '</div>';
                    }

                })

                ->addColumn('name', function ($row) {

                    $products = DB::table('purchases')
                        ->join('product_purchases', 'product_purchases.purchase_id', '=', 'purchases.id')
                        ->join('products', 'product_purchases.product_id', '=', 'products.id')
                        ->select('products.product_name')
                        ->where('product_purchases.purchase_id', $row->id)
                        ->get();
                    foreach ($products as $product) {
                        return $product->product_name;
                    }
                    //     if ($row->is_variant) {
                    //         $product_variant_data = \App\Models\ProductVariant::FindExactProduct('id', $row->is_variant)
                    //                                 ->select('item_code')
                    //                                 ->first();
                    //                                 $row->product_code = $product_variant_data->item_code;
                    //                             }
                    // return $product_variant_data ;
                })

                ->addColumn('returned_amount', function ($row) {
                    $returned_amount = DB::table('return_purchases')->where('purchase_id', $row->id)->sum('grand_total');
                    $returned_amount = number_format($returned_amount, 2);
                    return $returned_amount;
                })

                ->addColumn('due', function ($row) {
                    $returned_amount = DB::table('return_purchases')->where('purchase_id', $row->id)->sum('grand_total');
                    $returned_amount = number_format($returned_amount, 2);
                    $dueamount = number_format($row->grand_total - $returned_amount - $row->paid_amount, 2);

                    return $dueamount;
                })

                ->addColumn('payment_status', function ($row) {
                    if ($row->payment_status == 1)
                        return '<div class="badge badge-danger">' . trans('Due') . '</div>';
                    else
                        return '<div class="badge badge-success">' . trans('Paid') . '</div>';
                })

                ->addColumn('date', function ($row) {
                    $date = date('d-M-Y', strtotime($row->created_at));
                    return $date;
                })

                ->addColumn('action', function ($row) {
                    if ($row->supplier_id) {
                        $supplier = $row->supplier;
                    } else {
                        $supplier = new Supplier();
                    }
                    if ($row->user_id) {

                        $user = $row->supplier;
                    } else {
                        $user = new User();
                    }
                    if ($row->purchase_status == 1) {
                        $purchase_status = '<strong>' . trans('Recieved') . '</strong>';
                    } elseif ($row->purchase_status == 2) {
                        $purchase_status = '<strong>' . trans('Partial') . '</strong>';
                    } elseif ($row->purchase_status == 3) {
                        $purchase_status = '<strong>' . trans('Pending') . '</strong>';
                    } else {
                        $purchase_status = '<strong>' . trans('Ordered') . '</strong>';
                    }
                    // Update Button
                    $viewButton = '<a href="javascript:void(0)" style="box-shadow:none;" class="btn btn-link view" 
                                        data-id = "' . $row->id . '"
                                        data-date = "' . date('d-m-Y', strtotime($row->created_at)) . '"
                                        data-reference_no = "' . $row->reference_no . '"
                                        data-purchase_status = "' . $purchase_status . '"
                                        data-warehouse_name = "' . $row->warehouse->name . '"
                                        data-warehouse_phone = "' . $row->warehouse->phone . '"
                                        data-warehouse_address = "' . $row->warehouse->address . '"
                                        data-supplier_name = "' . $supplier->name . '"
                                        data-company_name = "' . $supplier->company_name . '"
                                        data-supplier_phone_number = "' . $supplier->phone_number . '"
                                        data-supplier_email = "' . $supplier->email . '"
                                        data-supplier_address = "' . $supplier->address . '"
                                        data-total_tax = "' . $row->total_tax . '"
                                        data-total_discount = "' . $row->total_discount . '"
                                        data-total_cost = "' . $row->total_cost . '"
                                        data-order_tax = "' . $row->order_tax . '"
                                        data-order_tax_rate = "' . $row->order_tax_rate . '"
                                        data-order_discount = "' . $row->order_discount . '"
                                        data-shipping_cost = "' . $row->shipping_cost . '"
                                        data-grand_total = "' . $row->grand_total . '"
                                        data-paid_amount = "' . $row->paid_amount . '"
                                        data-user_name = "' . $user->name . '"
                                        data-user_email = "' . $user->email . '"
                                        data-note = "' . preg_replace('/\s+/S', " ", $row->note) . '"
                                        ><i class="fa fa-eye"></i> ' . trans('View') . '</a>';

                    $updateButton = '<a href="' . route('superAdmin.purchase.edit', $row->id) . '" class="btn btn-link"><i class="fas fa-edit"></i> ' . trans('Edit') . '</a>';

                    // View payment
                    $viewpayment = '<a href="javascript:void(0)" class="get-payment btn btn-link" data-id = "' . $row->id . '"><i class="fas fa-money-bill-wave-alt"></i> ' . trans('View Payment') . '</a>';

                    // Add payment
                    $addpayment = '<button type="button" class="add-payment btn btn-link" data-id = "' . $row->id . '" data-toggle="modal" data-target="#add-payment"><i class="fas fa-shopping-basket"></i> ' . trans('Add Payment') . '</button>';

                    // Delete Button
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-link  deletepurchase"><i class="fa fa-trash"></i> ' . trans('Delete') . '</a>';

                    $nasted = '<div class="btn-group">
                                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action
                                            <span class="caret"></span>
                                            <span class="sr-only">Toggle Dropdown</span>
                                            </button>
                                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                                <li>' . $updateButton . '</li>
                                            
                                                <li>' . $viewpayment . '</li> 
                                            
                                                <li>' . $viewButton . '</li>
                                        
                                                <li>' . $addpayment . '</li> 
                                            
                                                <li>' . $deleteButton . '</li>
                                            </ul>
                                        </div>';

                    // return $nasted ;
    
                    return $updateButton . " " . $deleteButton . "" . $viewpayment . "" . $addpayment . "" . $viewButton;
                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }

        if ($request->input('warehouse_id'))
            $warehouse_id = $request->input('warehouse_id');
        else
            $warehouse_id = 0;

        if ($request->input('purchase_status'))
            $purchase_status = $request->input('purchase_status');
        else
            $purchase_status = 0;

        if ($request->input('payment_status'))
            $payment_status = $request->input('payment_status');
        else
            $payment_status = 0;

        if ($request->input('starting_date')) {
            $starting_date = $request->input('starting_date');
            $ending_date = $request->input('ending_date');
        } else {
            $starting_date = date("Y-m-d", strtotime(date('Y-m-d', strtotime('-1 year', strtotime(date('Y-m-d'))))));
            $ending_date = date("Y-m-d");
        }
        $lims_warehouse_list = Warehouse::where('is_active', '1')->get();
        $lims_account_list = Account::where('is_active', true)->get();
        $all_permission = '';
        return view('superadmin.purchase.index', compact('purchase', 'lims_account_list', 'all_permission', 'starting_date', 'ending_date', 'warehouse_id', 'purchase_status', 'payment_status', 'lims_warehouse_list'));
    }
    public function purchasecreate()
    {
        $data = [
            'lims_supplier_list' => Supplier::where('is_active', true)->get(),
            'lims_warehouse_list' => Warehouse::where('is_active', '1')->get(),
            'lims_tax_list' => Tax::where('is_active', '1')->get(),
            'lims_product_list_without_variant' => $this->productWithoutVariant(),
            'lims_product_list_with_variant' => $this->productWithVariant(),
        ];

        return view('superadmin.purchase.create', $data);
    }
    #create

    public function purchasestore(Request $request)
    {
        $data = $request->except('name');
        $data['reference_no'] = 'pr-' . date("Ymd") . '-' . date("his");
        //    return dd($data);
        if (isset($data['created_at'])) {
            $data['created_at'] = date("Y-m-d H:i:s", strtotime($data['created_at']));
        } else {
            $data['created_at'] = date("Y-m-d H:i:s");
        }
        // $data['expired_date'] = date("Y-m-d", strtotime($data['expired_date']));

        $lims_purchase_data = Purchase::create($data);
        $product_id = $data['product_id'];
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $recieved = $data['recieved'];
        $batch_no = $data['batch_no'];
        $expired_date = $data['expired_date'];
        $purchase_unit = $data['purchase_unit'];
        $net_unit_cost = $data['net_unit_cost'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];
        $imei_numbers = $data['imei_number'];
        $product_purchase = [];
        // return dd($data['expired_date']);
        foreach ($product_id as $i => $id) {
            $lims_purchase_unit_data = Unit::where('unit_code', $purchase_unit[$i])->first();

            if ($lims_purchase_unit_data->operator == '*') {
                $quantity = $recieved[$i] * $lims_purchase_unit_data->operation_value;
            } else {
                $quantity = $recieved[$i] / $lims_purchase_unit_data->operation_value;
            }
            $lims_product_data = Product::find($id);

            //dealing with product barch
            if ($batch_no[$i]) {
                $product_batch_data = ProductBatch::where([
                    ['product_id', $lims_product_data->id],
                    ['batch_no', $batch_no[$i]]
                ])->first();
                if ($product_batch_data) {
                    $product_batch_data->expired_date = $expired_date[$i];
                    $product_batch_data->qty += $quantity;
                    $product_batch_data->save();
                } else {
                    $product_batch_data = ProductBatch::create([
                        'product_id' => $lims_product_data->id,
                        'batch_no' => $batch_no[$i],
                        'expired_date' => $expired_date[$i],
                        'qty' => $quantity
                    ]);
                }
                $product_purchase['product_batch_id'] = $product_batch_data->id;
            } else
                $product_purchase['product_batch_id'] = null;

            if ($lims_product_data->is_variant) {
                $lims_product_variant_data = ProductVariant::select('*')->FindExactProductWithCode($lims_product_data->id, $product_code[$i])->first();
                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_id', $id],
                    ['variant_id', $lims_product_variant_data->variant_id],
                    ['warehouse_id', $data['warehouse_id']]
                ])->first();
                $product_purchase['variant_id'] = $lims_product_variant_data->variant_id;
                //add quantity to product variant table
                $lims_product_variant_data->qty += $quantity;
                $lims_product_variant_data->save();
            } else {
                $product_purchase['variant_id'] = null;
                if ($product_purchase['product_batch_id']) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $id],
                        ['product_batch_id', $product_purchase['product_batch_id']],
                        ['warehouse_id', $data['warehouse_id']],
                    ])->first();
                } else {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $id],
                        ['warehouse_id', $data['warehouse_id']],
                    ])->first();
                }
            }
            //add quantity to product table
            $lims_product_data->qty = $lims_product_data->qty + $quantity;
            $lims_product_data->save();
            //add quantity to warehouse
            if ($lims_product_warehouse_data) {
                $lims_product_warehouse_data->qty = $lims_product_warehouse_data->qty + $quantity;
                $lims_product_warehouse_data->product_batch_id = $product_purchase['product_batch_id'];
            } else {
                $lims_product_warehouse_data = new ProductWarehouse();
                $lims_product_warehouse_data->product_id = $id;
                $lims_product_warehouse_data->product_batch_id = $product_purchase['product_batch_id'];
                $lims_product_warehouse_data->warehouse_id = $data['warehouse_id'];
                $lims_product_warehouse_data->qty = $quantity;
                if ($lims_product_data->is_variant)
                    $lims_product_warehouse_data->variant_id = $lims_product_variant_data->variant_id;
            }
            //added imei numbers to product_warehouse table
            // if($imei_numbers[$i]) {
            //     if($lims_product_warehouse_data->imei_number)
            //         $lims_product_warehouse_data->imei_number .= ',' . $imei_numbers[$i];
            //     else
            //         $lims_product_warehouse_data->imei_number = $imei_numbers[$i];
            // }
            $lims_product_warehouse_data->save();

            $product_purchase['purchase_id'] = $lims_purchase_data->id;
            $product_purchase['product_id'] = $id;
            $product_purchase['imei_number'] = $imei_numbers[$i];
            $product_purchase['qty'] = $qty[$i];
            $product_purchase['recieved'] = $recieved[$i];
            $product_purchase['purchase_unit_id'] = $lims_purchase_unit_data->id;
            $product_purchase['net_unit_cost'] = $net_unit_cost[$i];
            $product_purchase['discount'] = $discount[$i];
            $product_purchase['tax_rate'] = $tax_rate[$i];
            $product_purchase['tax'] = $tax[$i];
            $product_purchase['total'] = $total[$i];
            ProductPurchase::create($product_purchase);
        }
        return redirect('superAdmin/purchase')->with('message', 'Purchase created successfully');
    }

    public function addPayment(Request $request)
    {
        $data = $request->all();
        // print_r($data);
        // die();
        $lims_purchase_data = Purchase::find($data['purchase_id']);
        $lims_purchase_data->paid_amount += $data['amount'];
        $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_purchase_data->payment_status = 1;
        elseif ($balance == 0)
            $lims_purchase_data->payment_status = 2;
        $lims_purchase_data->save();

        if ($data['paid_by_id'] == 1)
            $paying_method = 'Cash';
        elseif ($data['paid_by_id'] == 2)
            $paying_method = 'Gift Card';
        elseif ($data['paid_by_id'] == 3)
            $paying_method = 'Credit Card';
        else
            $paying_method = 'Cheque';

        $lims_payment_data = new Payment();
        $lims_payment_data->user_id = Auth::id();
        $lims_payment_data->purchase_id = $lims_purchase_data->id;
        $lims_payment_data->account_id = $data['account_id'];
        $lims_payment_data->payment_reference = 'ppr-' . date("Ymd") . '-' . date("his");
        $lims_payment_data->amount = $data['amount'];
        $lims_payment_data->change = $data['paying_amount'] - $data['amount'];
        $lims_payment_data->paying_method = $paying_method;
        $lims_payment_data->payment_note = $data['payment_note'];
        $lims_payment_data->save();

        $lims_payment_data = Payment::latest()->first();
        $data['payment_id'] = $lims_payment_data->id;

        if ($paying_method == 'Credit Card') {
            $lims_pos_setting_data = PosSetting::latest()->first();
            Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            $token = $data['stripeToken'];
            $amount = $data['amount'];

            // Charge the Customer
            $charge = \Stripe\Charge::create([
                'amount' => $amount * 100,
                'currency' => 'usd',
                'source' => $token,
            ]);

            $data['charge_id'] = $charge->id;
            PaymentWithCreditCard::create($data);
        } elseif ($paying_method == 'Cheque') {
            PaymentWithCheque::create($data);
        }
        return redirect('superAdmin/purchase')->with('message', 'Payment created successfully');
    }
    //   public function updatePayment(Request $request)
    //     {
    //         $data = $request->all();
    //         print_r($data);
    //         die();
    //         $lims_payment_data = Payment::find($data['payment_id']);
    //         $lims_purchase_data = Purchase::find($lims_payment_data->purchase_id);
    //         //updating purchase table
    //         $amount_dif = $lims_payment_data->amount - $data['edit_amount'];
    //         $lims_purchase_data->paid_amount = $lims_purchase_data->paid_amount - $amount_dif;
    //         $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
    //         if($balance > 0 || $balance < 0)
    //             $lims_purchase_data->payment_status = 1;
    //         elseif ($balance == 0)
    //             $lims_purchase_data->payment_status = 2;
    //         $lims_purchase_data->save();

    //         //updating payment data
    //         $lims_payment_data->account_id = $data['account_id'];
    //         $lims_payment_data->amount = $data['edit_amount'];
    //         $lims_payment_data->change = $data['edit_paying_amount'] - $data['edit_amount'];
    //         $lims_payment_data->payment_note = $data['edit_payment_note'];
    //         if($data['edit_paid_by_id'] == 1)
    //             $lims_payment_data->paying_method = 'Cash';
    //         elseif ($data['edit_paid_by_id'] == 2)
    //             $lims_payment_data->paying_method = 'Gift Card';
    //         elseif ($data['edit_paid_by_id'] == 3){
    //             $lims_pos_setting_data = PosSetting::latest()->first();
    //             \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
    //             $token = $data['stripeToken'];
    //             $amount = $data['edit_amount'];
    //             if($lims_payment_data->paying_method == 'Credit Card'){
    //                 $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $lims_payment_data->id)->first();

    //                 \Stripe\Refund::create(array(
    //                   "charge" => $lims_payment_with_credit_card_data->charge_id,
    //                 ));

    //                 $charge = \Stripe\Charge::create([
    //                     'amount' => $amount * 100,
    //                     'currency' => 'usd',
    //                     'source' => $token,
    //                 ]);

    //                 $lims_payment_with_credit_card_data->charge_id = $charge->id;
    //                 $lims_payment_with_credit_card_data->save();
    //             }
    //             else{
    //                 // Charge the Customer
    //                 $charge = \Stripe\Charge::create([
    //                     'amount' => $amount * 100,
    //                     'currency' => 'usd',
    //                     'source' => $token,
    //                 ]);

    //                 $data['charge_id'] = $charge->id;
    //                 PaymentWithCreditCard::create($data);
    //             }
    //             $lims_payment_data->paying_method = 'Credit Card';
    //         }         
    //         else{
    //             if($lims_payment_data->paying_method == 'Cheque'){
    //                 $lims_payment_data->paying_method = 'Cheque';
    //                 $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $data['payment_id'])->first();
    //                 $lims_payment_cheque_data->cheque_no = $data['edit_cheque_no'];
    //                 $lims_payment_cheque_data->save(); 
    //             }
    //             else{
    //                 $lims_payment_data->paying_method = 'Cheque';
    //                 $data['cheque_no'] = $data['edit_cheque_no'];
    //                 PaymentWithCheque::create($data);
    //             }
    //         }
    //         $lims_payment_data->save();
    //         return redirect('purchases')->with('message', 'Payment updated successfully');
    //     }
    public function purchaseedit($id)
    {

        $lims_supplier_list = Supplier::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_product_list_without_variant = $this->productWithoutVariant();
        $lims_product_list_with_variant = $this->productWithVariant();
        $lims_purchase_data = Purchase::find($id);
        $lims_product_purchase_data = ProductPurchase::where('purchase_id', $id)->get();

        return view('superadmin.purchase.edit', compact('lims_warehouse_list', 'lims_supplier_list', 'lims_product_list_without_variant', 'lims_product_list_with_variant', 'lims_tax_list', 'lims_purchase_data', 'lims_product_purchase_data'));
    }

    public function purchasesProductPurchase($id)
    {
        try {
            $lims_product_purchase_data = ProductPurchase::where('purchase_id', $id)->get();
            foreach ($lims_product_purchase_data as $key => $product_purchase_data) {
                $product = Product::find($product_purchase_data->product_id);
                $unit = Unit::find($product_purchase_data->purchase_unit_id);
                if ($product_purchase_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::FindExactProduct($product->id, $product_purchase_data->variant_id)->select('item_code')->first();
                    $product->code = $lims_product_variant_data->item_code;
                }
                if ($product_purchase_data->product_batch_id) {
                    $product_batch_data = ProductBatch::select('batch_no')->find($product_purchase_data->product_batch_id);
                    $product_purchase[7][$key] = $product_batch_data->batch_no;
                } else
                    $product_purchase[7][$key] = 'N/A';
                $product_purchase[0][$key] = $product->name . ' [' . $product->code . ']';
                if ($product_purchase_data->imei_number) {
                    $product_purchase[0][$key] .= '<br>IMEI or Serial Number: ' . $product_purchase_data->imei_number;
                }
                $product_purchase[1][$key] = $product_purchase_data->qty;
                $product_purchase[2][$key] = $unit->unit_code;
                $product_purchase[3][$key] = $product_purchase_data->tax;
                $product_purchase[4][$key] = $product_purchase_data->tax_rate;
                $product_purchase[5][$key] = $product_purchase_data->discount;
                $product_purchase[6][$key] = $product_purchase_data->total;
            }
            return $product_purchase;
        } catch (\Exception $e) {
            /*return response()->json('errors' => [$e->getMessage());*/
            //return response()->json(['errors' => [$e->getMessage()]], 422);
            return 'Something is wrong!';
        }

    }
    public function purchaselimsProductSearch(Request $request)
    {
        $product_code = explode("|", $request['data']);
        $product_code[0] = rtrim($product_code[0], " ");
        $lims_product_data = Product::where([
                                ['product_code', $product_code[0]],
                                ['is_active', true]
                            ])
                            ->whereNull('is_variant')
                            ->first();
        if(!$lims_product_data) {
            $lims_product_data = Product::where([
                                ['name', $product_code[1]],
                                ['is_active', true]
                            ])
                            ->whereNotNull(['is_variant'])
                            ->first();
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->where([
                    ['product_variants.item_code', $product_code[0]],
                    ['products.is_active', true]
                ])
                ->whereNotNull('is_variant')
                ->select('products.*', 'product_variants.item_code', 'product_variants.additional_cost')
                ->first();
            $lims_product_data->cost += $lims_product_data->additional_cost;
        }
        $product[] = $lims_product_data->name;
        if($lims_product_data->is_variant)
            $product[] = $lims_product_data->item_code;
        else
            $product[] = $lims_product_data->code;
            $product[] = $lims_product_data->cost;

        if ($lims_product_data->tax_id) {
            $lims_tax_data = Tax::find($lims_product_data->tax_id);
            $product[] = $lims_tax_data->rate;
            $product[] = $lims_tax_data->name;
        } else {
            $product[] = 0;
            $product[] = 'No Tax';
        }
        $product[] = $lims_product_data->tax_method;

        $units = Unit::where("base_unit", $lims_product_data->unit_id)
                    ->orWhere('id', $lims_product_data->unit_id)
                    ->get();
        $unit_code = array();
        $unit_operator = array();
        $unit_operation_value = array();
        foreach ($units as $unit) {
            if ($lims_product_data->purchase_unit_id == $unit->id) {
                array_unshift($unit_code, $unit->unit_code);
                array_unshift($unit_operator, $unit->operator);
                array_unshift($unit_operation_value, $unit->operation_value);
            } else {
                $unit_code[]  = $unit->unit_code;
                $unit_operator[] = $unit->operator;
                $unit_operation_value[] = $unit->operation_value;
            }
        }

        $product[] = implode(",", $unit_code) . ',';
        $product[] = implode(",", $unit_operator) . ',';
        $product[] = implode(",", $unit_operation_value) . ',';
        $product[] = $lims_product_data->id;
        $product[] = $lims_product_data->is_batch;
        $product[] = $lims_product_data->is_imei;
        return $product;
    }

    public function purchaseupdate(Request $request, $id)
    {
        $data = $request->except('name');
        $document = $request->document;
        // return dd($data);
        $balance = $data['grand_total'] - $data['paid_amount'];
        if ($balance < 0 || $balance > 0) {
            $data['payment_status'] = 1;
        } else {
            $data['payment_status'] = 2;
        }
        $lims_purchase_data = Purchase::find($id);
        $lims_product_purchase_data = ProductPurchase::where('purchase_id', $id)->get();

        $data['created_at'] = date("Y-m-d", strtotime(str_replace("/", "-", $data['created_at'])));

        // $data['expired_date'] = date("Y-m-d", strtotime($data['expired_date']));
        // return dd( $data['expired_date']);

        $product_id = $data['product_id'];
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $recieved = $data['recieved'];
        $batch_no = $data['batch_no'];
        $expired_date = $data['expired_date'];
        $purchase_unit = $data['purchase_unit'];
        $net_unit_cost = $data['net_unit_cost'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];
        $imei_number = $new_imei_number = $data['imei_number'];
        $product_purchase = [];

        foreach ($lims_product_purchase_data as $product_purchase_data) {
            $old_recieved_value = $product_purchase_data->recieved;

            $lims_purchase_unit_data = Unit::find($product_purchase_data->purchase_unit_id);
            if ($lims_purchase_unit_data->operator == '*') {
                $old_recieved_value = ($old_recieved_value * $lims_purchase_unit_data->operation_value);
            } else {
                $old_recieved_value = ($old_recieved_value / $lims_purchase_unit_data->operation_value);
            }
            $lims_product_data = Product::find($product_purchase_data->product_id);
            // print_r($lims_purchase_unit_data);
            if ($lims_product_data->is_variant) {
                $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProduct($lims_product_data->id, $product_purchase_data->variant_id)->first();
                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_id', $lims_product_data->id],
                    ['variant_id', $product_purchase_data->variant_id],
                    ['warehouse_id', $lims_purchase_data->warehouse_id]
                ])->first();
                $lims_product_variant_data->qty -= $old_recieved_value;
                $lims_product_variant_data->save();
            } elseif ($product_purchase_data->product_batch_id) {
                $product_batch_data = ProductBatch::find($product_purchase_data->product_batch_id);
                $product_batch_data->qty -= $old_recieved_value;
                $product_batch_data->save();

                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_id', $product_purchase_data->product_id],
                    ['product_batch_id', $product_purchase_data->product_batch_id],
                    ['warehouse_id', $lims_purchase_data->warehouse_id],
                ])->first();
            } else {
                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_id', $product_purchase_data->product_id],
                    ['warehouse_id', $lims_purchase_data->warehouse_id],
                ])->first();
            }
            if ($product_purchase_data->imei_number) {
                $position = array_search($lims_product_data->id, $product_id);
                if ($imei_number[$position]) {
                    $prev_imei_numbers = explode(",", $product_purchase_data->imei_number);
                    $new_imei_numbers = explode(",", $imei_number[$position]);
                    foreach ($prev_imei_numbers as $prev_imei_number) {
                        if (($pos = array_search($prev_imei_number, $new_imei_numbers)) !== false) {
                            unset($new_imei_numbers[$pos]);
                        }
                    }
                    $new_imei_number[$position] = implode(",", $new_imei_numbers);
                }
            }
            $lims_product_data->qty -= $old_recieved_value;
            $lims_product_warehouse_data->qty -= $old_recieved_value;
            $lims_product_warehouse_data->save();
            $lims_product_data->save();
            $product_purchase_data->delete();
        }

        // die();

        foreach ($product_id as $key => $pro_id) {
            $lims_purchase_unit_data = Unit::where('unit_code', $purchase_unit[$key])->first();
            if ($lims_purchase_unit_data->operator == '*') {
                $new_recieved_value = $recieved[$key] * $lims_purchase_unit_data->operation_value;
            } else {
                $new_recieved_value = $recieved[$key] / $lims_purchase_unit_data->operation_value;
            }
            $lims_product_data = Product::find($pro_id);

            // print_r($lims_product_data);

            //dealing with product barch

            if ($batch_no[$key]) {
                $product_batch_data = ProductBatch::where([
                    ['product_id', $lims_product_data->id],
                    ['batch_no', $batch_no[$key]]
                ])->first();
                if ($product_batch_data) {
                    $product_batch_data->qty += $new_recieved_value;
                    $product_batch_data->expired_date = $expired_date[$key];
                    $product_batch_data->save();
                } else {
                    $product_batch_data = ProductBatch::create([
                        'product_id' => $lims_product_data->id,
                        'batch_no' => $batch_no[$key],
                        'expired_date' => $expired_date[$key],
                        'qty' => $new_recieved_value
                    ]);
                }
                $product_purchase['product_batch_id'] = $product_batch_data->id;
            } else
                $product_purchase['product_batch_id'] = null;

            if ($lims_product_data->is_variant) {
                $lims_product_variant_data = ProductVariant::select('*')->FindExactProductWithCode($pro_id, $product_code[$key])->first();
                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_id', $pro_id],
                    ['variant_id', $lims_product_variant_data->variant_id],
                    ['warehouse_id', $data['warehouse_id']]
                ])->first();
                $product_purchase['variant_id'] = $lims_product_variant_data->variant_id;
                //add quantity to product variant table
                $lims_product_variant_data->qty += $new_recieved_value;
                $lims_product_variant_data->save();
            } else {
                $product_purchase['variant_id'] = null;
                if ($product_purchase['product_batch_id']) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $pro_id],
                        ['product_batch_id', $product_purchase['product_batch_id']],
                        ['warehouse_id', $data['warehouse_id']],
                    ])->first();
                } else {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $pro_id],
                        ['warehouse_id', $data['warehouse_id']],
                    ])->first();
                }
            }
            $qty = $data['qty'];
            $recievedNumber = $data['recieved'];
            print_r($recievedNumber[0]);
            $lims_product_data->qty += $new_recieved_value;
            if ($lims_product_warehouse_data) {
                // $lims_product_warehouse_data->qty =  $qty['0'];
                $lims_product_warehouse_data->qty += $new_recieved_value; // Old qurery
                $lims_product_warehouse_data->save();
            } else {
                $lims_product_warehouse_data = new ProductWarehouse();
                $lims_product_warehouse_data->product_id = $pro_id;
                $lims_product_warehouse_data->product_batch_id = $product_purchase['product_batch_id'];
                if ($lims_product_data->is_variant) {
                    $lims_product_warehouse_data->variant_id = $lims_product_variant_data->variant_id;
                }
                $lims_product_warehouse_data->warehouse_id = $data['warehouse_id'];
                // $lims_product_warehouse_data->qty = $qty['0'];
                $lims_product_warehouse_data->qty = $new_recieved_value;
            }
            //dealing with imei numbers
            if ($imei_number[$key]) {
                if ($lims_product_warehouse_data->imei_number) {
                    $lims_product_warehouse_data->imei_number .= ',' . $new_imei_number[$key];
                } else {
                    $lims_product_warehouse_data->imei_number = $new_imei_number[$key];
                }
            }

            $lims_product_data->save();
            $lims_product_warehouse_data->save();

            $product_purchase['purchase_id'] = $request->id;
            $product_purchase['product_id'] = $pro_id;
            $product_purchase['qty'] = $qty[$key];
            $product_purchase['recieved'] = $recieved[$key]; //$recievedNumber['0'];
            $product_purchase['purchase_unit_id'] = $lims_purchase_unit_data->id;
            $product_purchase['net_unit_cost'] = $net_unit_cost[$key];
            $product_purchase['discount'] = $discount[$key];
            $product_purchase['tax_rate'] = $tax_rate[$key];
            $product_purchase['tax'] = $tax[$key];
            $product_purchase['total'] = $total[$key];
            $product_purchase['imei_number'] = $imei_number[$key];
            ProductPurchase::create($product_purchase);
        }


        // die();
        $lims_purchase_data->update($data);
        return redirect('superAdmin/purchase')->with('message', 'Purchase updated successfully');

    }

    public function purchaseGetPayment($id)
    {
        $lims_payment_list = Payment::where('purchase_id', $id)->get();
        $date = [];
        $payment_reference = [];
        $paid_amount = [];
        $paying_method = [];
        $payment_id = [];
        $payment_note = [];
        $cheque_no = [];
        $change = [];
        $paying_amount = [];
        $account_name = [];
        $account_id = [];
        foreach ($lims_payment_list as $payment) {
            $date[] = date("Y-m-d", strtotime(str_replace("/", "-", $payment['created_at'])));
            $payment_reference[] = $payment->payment_reference;
            $paid_amount[] = $payment->amount;
            $change[] = $payment->change;
            $paying_method[] = $payment->paying_method;
            $paying_amount[] = $payment->amount + $payment->change;
            if ($payment->paying_method == 'Cheque') {
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $payment->id)->first();
                $cheque_no[] = $lims_payment_cheque_data->cheque_no;
            } else {
                $cheque_no[] = null;
            }
            $payment_id[] = $payment->id;
            $payment_note[] = $payment->payment_note;
            $lims_account_data = Account::find($payment->account_id);
            // print_r( $lims_account_data);
            $account_name[] = $lims_account_data->name;
            $account_id[] = $lims_account_data->id;
        }
        $payments[] = $date;
        $payments[] = $payment_reference;
        $payments[] = $paid_amount;
        $payments[] = $paying_method;
        $payments[] = $payment_id;
        $payments[] = $payment_note;
        $payments[] = $cheque_no;
        $payments[] = $change;
        $payments[] = $paying_amount;
        $payments[] = $account_name;
        $payments[] = $account_id;
        // return response()->json(['status' => "success"]);
        return $payments;
    }

    public function purchaseDeletePayment(Request $request)
    {
        $lims_payment_data = Payment::find($request['id']);
        $lims_purchase_data = Purchase::where('id', $lims_payment_data->purchase_id)->first();
        $lims_purchase_data->paid_amount -= $lims_payment_data->amount;
        $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_purchase_data->payment_status = 1;
        elseif ($balance == 0)
            $lims_purchase_data->payment_status = 2;
        $lims_purchase_data->save();

        if($lims_payment_data->paying_method == 'Credit Card'){
            $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $request['id'])->first();
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            \Stripe\Refund::create(array(
              "charge" => $lims_payment_with_credit_card_data->charge_id,
            ));

            $lims_payment_with_credit_card_data->delete();
        }
        elseif ($lims_payment_data->paying_method == 'Cheque') {
            $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $request['id'])->first();
            $lims_payment_cheque_data->delete();
        }
        $lims_payment_data->delete();
        return redirect('superAdmin/purchase')->with('not_permitted', 'Payment deleted successfully');
    }

    public function updatePayment(Request $request)
    {
        $data = $request->all();
        $lims_payment_data = Payment::find($data['payment_id']);
        $lims_purchase_data = Purchase::find($lims_payment_data->purchase_id);
        //updating purchase table
        $amount_dif = $lims_payment_data->amount - $data['edit_amount'];
        $lims_purchase_data->paid_amount = $lims_purchase_data->paid_amount - $amount_dif;
        $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_purchase_data->payment_status = 1;
        elseif ($balance == 0)
            $lims_purchase_data->payment_status = 2;
        $lims_purchase_data->save();

        //updating payment data
        $lims_payment_data->account_id = $data['account_id'];
        $lims_payment_data->amount = $data['edit_amount'];
        $lims_payment_data->change = $data['edit_paying_amount'] - $data['edit_amount'];
        $lims_payment_data->payment_note = $data['edit_payment_note'];
        if ($data['edit_paid_by_id'] == 1)
            $lims_payment_data->paying_method = 'Cash';
        elseif ($data['edit_paid_by_id'] == 2)
            $lims_payment_data->paying_method = 'Gift Card';

        elseif ($data['edit_paid_by_id'] == 3){
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            $token = $data['stripeToken'];
            $amount = $data['edit_amount'];
            if($lims_payment_data->paying_method == 'Credit Card'){
                $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $lims_payment_data->id)->first();

                \Stripe\Refund::create(array(
                  "charge" => $lims_payment_with_credit_card_data->charge_id,
                ));

                $charge = \Stripe\Charge::create([
                    'amount' => $amount * 100,
                    'currency' => 'usd',
                    'source' => $token,
                ]);

                $lims_payment_with_credit_card_data->charge_id = $charge->id;
                $lims_payment_with_credit_card_data->save();
            }
            else{
                // Charge the Customer
                $charge = \Stripe\Charge::create([
                    'amount' => $amount * 100,
                    'currency' => 'usd',
                    'source' => $token,
                ]);

                $data['charge_id'] = $charge->id;
                PaymentWithCreditCard::create($data);
            }
            $lims_payment_data->paying_method = 'Credit Card';
        }         
        else {
            if ($lims_payment_data->paying_method == 'Cheque') {
                $lims_payment_data->paying_method = 'Cheque';
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $data['payment_id'])->first();
                $lims_payment_cheque_data->cheque_no = $data['edit_cheque_no'];
                $lims_payment_cheque_data->save();
            } else {
                $lims_payment_data->paying_method = 'Cheque';
                $data['cheque_no'] = $data['edit_cheque_no'];
                PaymentWithCheque::create($data);
            }
        }

        $lims_payment_data->save();
        return redirect('superAdmin/purchase')->with('message', 'Payment updated successfully');
    }

    public function deletePayment(Request $request)
    {
        $lims_payment_data = Payment::find($request['id']);
        $lims_purchase_data = Purchase::where('id', $lims_payment_data->purchase_id)->first();
        $lims_purchase_data->paid_amount -= $lims_payment_data->amount;
        $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_purchase_data->payment_status = 1;
        elseif ($balance == 0)
            $lims_purchase_data->payment_status = 2;
        $lims_purchase_data->save();

        if($lims_payment_data->paying_method == 'Credit Card'){
            $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $request['id'])->first();
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            \Stripe\Refund::create(array(
              "charge" => $lims_payment_with_credit_card_data->charge_id,
            ));

            $lims_payment_with_credit_card_data->delete();
        }
        elseif ($lims_payment_data->paying_method == 'Cheque') {
            $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $request['id'])->first();
            $lims_payment_cheque_data->delete();
        }
        $lims_payment_data->delete();
        return redirect('superAdmin/purchase')->with('not_permitted', 'Payment deleted successfully');
    }

    public function purchasedestroy($id)
    {
        $lims_purchase_data = Purchase::find($id);
        $lims_product_purchase_data = ProductPurchase::where('purchase_id', $id)->get();
        $lims_payment_data = Payment::where('purchase_id', $id)->get();
        foreach ($lims_product_purchase_data as $product_purchase_data) {
            $lims_purchase_unit_data = Unit::find($product_purchase_data->purchase_unit_id);
            if ($lims_purchase_unit_data->operator == '*')
                $recieved_qty = $product_purchase_data->recieved * $lims_purchase_unit_data->operation_value;
            else
                $recieved_qty = $product_purchase_data->recieved / $lims_purchase_unit_data->operation_value;

            $lims_product_data = Product::find($product_purchase_data->product_id);
            if ($product_purchase_data->variant_id) {
                $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($lims_product_data->id, $product_purchase_data->variant_id)->first();
                $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_purchase_data->product_id, $product_purchase_data->variant_id, $lims_purchase_data->warehouse_id)
                    ->first();
                $lims_product_variant_data->qty -= $recieved_qty;
                $lims_product_variant_data->save();
            } elseif ($product_purchase_data->product_batch_id) {
                $lims_product_batch_data = ProductBatch::find($product_purchase_data->product_batch_id);
                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_batch_id', $product_purchase_data->product_batch_id],
                    ['warehouse_id', $lims_purchase_data->warehouse_id]
                ])->first();

                $lims_product_batch_data->qty -= $recieved_qty;
                $lims_product_batch_data->save();
            } else {
                $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_purchase_data->product_id, $lims_purchase_data->warehouse_id)
                    ->first();
            }
            //deduct imei number if available
            if ($product_purchase_data->imei_number) {
                $imei_numbers = explode(",", $product_purchase_data->imei_number);
                $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
                foreach ($imei_numbers as $number) {
                    if (($j = array_search($number, $all_imei_numbers)) !== false) {
                        unset($all_imei_numbers[$j]);
                    }
                }
                $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
            }

            $lims_product_data->qty -= $recieved_qty;
            $lims_product_warehouse_data->qty -= $recieved_qty;

            $lims_product_warehouse_data->save();
            $lims_product_data->save();
            $product_purchase_data->delete();
        }
        foreach ($lims_payment_data as $payment_data) {
            if ($payment_data->paying_method == "Cheque") {
                $payment_with_cheque_data = PaymentWithCheque::where('payment_id', $payment_data->id)->first();
                $payment_with_cheque_data->delete();
            }
            elseif($payment_data->paying_method == "Credit Card"){
                $payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $payment_data->id)->first();
                $lims_pos_setting_data = PosSetting::latest()->first();
                \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
                \Stripe\Refund::create(array(
                  "charge" => $payment_with_credit_card_data->charge_id,
                ));

                $payment_with_credit_card_data->delete();
            }
            $payment_data->delete();
        }
        $lims_purchase_data->delete();
        return response()->json(['status' => "success"]);



    }

    // ========================Return Purchase===================    
    public function returnPurchaseIndex(Request $request)
    {
        if ($request->ajax()) {
            $purchase = ReturnPurchase::latest()->get();
            return Datatables::of($purchase)
                ->addIndexColumn()
                ->addColumn('date', function ($row) {
                    $date = date("Y-m-d", strtotime($row->created_at));
                    return $date;
                })
                ->addColumn('purchase_reference', function ($row) {
                    if ($row->purchase_id) {
                        $purchase_data = Purchase::select('reference_no')->find($row->purchase_id);
                        $purchase_reference = $purchase_data->reference_no;
                        return $purchase_reference;
                    } else {
                        return 'N/A';
                    }
                })

                ->addColumn('supplier', function ($row) {

                    if ($row->supplier) {
                        $supplier = $row->supplier;
                        $supplier = $row->supplier->name;
                        return $supplier;
                    } else {
                        return "Null";
                    }

                })
                ->addColumn('groundTotal', function ($row) {
                    $ground = number_format($row->grand_total, 2);
                    return ($ground);
                })


                ->addColumn('warehouse', function ($row) {
                    $warehouse = $row->warehouse->name;
                    return $warehouse;

                })



                ->addColumn('purchase_status', function ($row) {
                    if ($row->purchase_status == 1) {
                        return '<div class="badge badge-success">' . trans('Recieved') . '</div>';
                    } elseif ($row->purchase_status == 2) {
                        return '<div class="badge badge-success">' . trans('Partial') . '</div>';
                    } elseif ($row->purchase_status == 3) {
                        return '<div class="badge badge-danger">' . trans('Pending') . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . trans('Ordered') . '</div>';
                    }
                })

                ->addColumn('name', function ($row) {
                    $products = DB::table('purchases')
                        ->join('product_purchases', 'product_purchases.purchase_id', '=', 'purchases.id')
                        ->join('products', 'product_purchases.product_id', '=', 'products.id')
                        ->select('products.product_name')
                        ->where('product_purchases.purchase_id', $row->id)
                        ->get();
                    foreach ($products as $product) {
                        return $product->product_name;
                    }
                    //     if ($row->is_variant) {
                    //         $product_variant_data = \App\Models\ProductVariant::FindExactProduct('id', $row->is_variant)
                    //                                 ->select('item_code')
                    //                                 ->first();
                    //                                 $row->product_code = $product_variant_data->item_code;
                    //                             }
                    // return $product_variant_data ;
                })

                ->addColumn('returned_amount', function ($row) {
                    $returned_amount = DB::table('return_purchases')->where('purchase_id', $row->id)->sum('grand_total');
                    $returned_amount = number_format($returned_amount, 2);
                    return $returned_amount;
                })

                ->addColumn('due', function ($row) {
                    $returned_amount = DB::table('return_purchases')->where('purchase_id', $row->id)->sum('grand_total');
                    $returned_amount = number_format($returned_amount, 2);
                    $dueamount = number_format($row->grand_total - $returned_amount - $row->paid_amount, 2);
                    return $dueamount;
                })

                ->addColumn('payment_status', function ($row) {
                    if ($row->payment_status == 1)
                        return '<div class="badge badge-danger">' . trans('Due') . '</div>';
                    else
                        return '<div class="badge badge-success">' . trans('Paid') . '</div>';
                })

                ->addColumn('date', function ($row) {
                    $date = date('d-M-Y', strtotime($row->created_at));
                    return $date;
                })

                ->addColumn('action', function ($row) {
                    if ($row->supplier_id) {
                        $supplier = $row->supplier;
                    } else {
                        $supplier = new Supplier();
                    }
                    if ($row->user_id) {

                        $user = $row->supplier;
                    } else {
                        $user = new User();
                    }
                    if ($row->purchase_status == 1) {
                        $purchase_status = '<strong>' . trans('Recieved') . '</strong>';
                    } elseif ($row->purchase_status == 2) {
                        $purchase_status = '<strong>' . trans('Partial') . '</strong>';
                    } elseif ($row->purchase_status == 3) {
                        $purchase_status = '<strong>' . trans('Pending') . '</strong>';
                    } else {
                        $purchase_status = '<strong>' . trans('Ordered') . '</strong>';
                    }
                    if ($row->purchase_id) {
                        $purchase_data = Purchase::select('reference_no')->find($row->purchase_id);
                        $purchase_reference = $purchase_data->reference_no;

                    }
                    // Update Button
                    $viewButton =
                        '<a href="javascript:void(0)" style="box-shadow:none;" class="btn btn-link view" 
                                data-id = "' . $row->id . '"
                                data-date = "' . date('d-m-Y', strtotime($row->created_at)) . '"
                                data-reference_no = "' . $row->reference_no . '"
                                data-purchase_reference = "' . $purchase_reference . '"

                                data-total_discount = "' . $row->total_discount . '"
                                data-purchase_status = "' . $purchase_status . '"
                                data-warehouse_name = "' . $row->warehouse->name . '"
                                data-warehouse_phone = "' . $row->warehouse->phone . '"
                                data-warehouse_address = "' . $row->warehouse->address . '"
                                data-supplier_name = "' . $supplier->name . '"
                                data-company_name = "' . $supplier->company_name . '"
                                data-supplier_phone_number = "' . $supplier->phone_number . '"
                                data-supplier_email = "' . $supplier->email . '"
                                data-supplier_address = "' . $supplier->address . '"

                                data-order_tax = "' . $row->order_tax . '"
                                data-total_cost = "' . $row->total_cost . '"
                                data-total_tax = "' . $row->total_tax . '"
                                data-grand_total = "' . $row->grand_total . '"

                                data-return_note = "' . $row->return_note . '"
                                data-staff_note = "' . $row->staff_note . '"
                           
                                data-user_name = "' . $user->name . '"
                                data-user_email = "' . $user->email . '"
                    
                                ><i class="fa fa-eye"></i> ' . trans('View') . '</a>';

                    $updateButton = '<a href="' . route('superAdmin.return-purchase.edit', $row->id) . '" class="btn btn-link"><i class="fas fa-edit"></i> ' . trans('Edit') . '</a>';


                    // Delete Button
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-link  deletereturnpurchase"><i class="fa fa-trash"></i> ' . trans('Delete') . '</a>';

                    $nasted = '<div class="btn-group">
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                        <li>' . $updateButton . '</li>
                                    
                                        <li>' . $viewButton . '</li>
                                    
                                        <li>' . $deleteButton . '</li>
                                    </ul>
                                </div>';

                    // return $nasted ;
    
                    return $updateButton . " " . $deleteButton . "" . $viewButton;
                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }
        // dd("kk"); 
        if ($request->input('warehouse_id'))
            $warehouse_id = $request->input('warehouse_id');
        else
            $warehouse_id = 0;

        if ($request->input('starting_date')) {
            $starting_date = $request->input('starting_date');
            $ending_date = $request->input('ending_date');
        } else {
            $starting_date = date("Y-m-d", strtotime(date('Y-m-d', strtotime('-1 year', strtotime(date('Y-m-d'))))));
            $ending_date = date("Y-m-d");
        }

        $lims_warehouse_list = Warehouse::where('is_active', true)->get();

        return view('superadmin.return_purchase.index', compact('starting_date', 'ending_date', 'warehouse_id', 'lims_warehouse_list'));

    }
    public function returnPurchaseReturnData(Request $request)
    {
        $columns = array(
            1 => 'created_at',
            2 => 'reference_no',
        );

        $warehouse_id = $request->input('warehouse_id');

        if (Auth::user()->role_id > 2 && config('staff_access') == 'own')
            $totalData = ReturnPurchase::where('user_id', Auth::id())
                ->whereDate('created_at', '>=', $request->input('starting_date'))
                ->whereDate('created_at', '<=', $request->input('ending_date'))
                ->count();
        elseif ($warehouse_id != 0)
            $totalData = ReturnPurchase::where('warehouse_id', $warehouse_id)
                ->whereDate('created_at', '>=', $request->input('starting_date'))
                ->whereDate('created_at', '<=', $request->input('ending_date'))
                ->count();
        else
            $totalData = ReturnPurchase::whereDate('created_at', '>=', $request->input('starting_date'))
                ->whereDate('created_at', '<=', $request->input('ending_date'))
                ->count();

        $totalFiltered = $totalData;
        if ($request->input('length') != -1)
            $limit = $request->input('length');
        else
            $limit = $totalData;
        $start = $request->input('start');
        $order = 'return_purchases.' . $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        if (empty($request->input('search.value'))) {
            $q = ReturnPurchase::with('supplier', 'warehouse', 'user')
                ->whereDate('created_at', '>=', $request->input('starting_date'))
                ->whereDate('created_at', '<=', $request->input('ending_date'))
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir);
            if (Auth::user()->role_id > 2 && config('staff_access') == 'own')
                $q = $q->where('user_id', Auth::id());
            elseif ($warehouse_id != 0)
                $q = $q->where('warehouse_id', $warehouse_id);
            $returnss = $q->get();
        } else {
            $search = $request->input('search.value');
            $q = ReturnPurchase::leftJoin('suppliers', 'return_purchases.supplier_id', '=', 'suppliers.id')
                ->whereDate('return_purchases.created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir);
            if (Auth::user()->role_id > 2 && config('staff_access') == 'own') {
                $returnss = $q->select('return_purchases.*')
                    ->with('supplier', 'warehouse', 'user')
                    ->where('return_purchases.user_id', Auth::id())
                    ->orwhere([
                        ['return_purchases.reference_no', 'LIKE', "%{$search}%"],
                        ['return_purchases.user_id', Auth::id()]
                    ])
                    ->orwhere([
                        ['suppliers.name', 'LIKE', "%{$search}%"],
                        ['return_purchases.user_id', Auth::id()]
                    ])
                    ->get();

                $totalFiltered = $q->where('return_purchases.user_id', Auth::id())
                    ->orwhere([
                        ['return_purchases.reference_no', 'LIKE', "%{$search}%"],
                        ['return_purchases.user_id', Auth::id()]
                    ])
                    ->orwhere([
                        ['suppliers.name', 'LIKE', "%{$search}%"],
                        ['return_purchases.user_id', Auth::id()]
                    ])
                    ->count();
            } else {
                $returnss = $q->select('return_purchases.*')
                    ->with('supplier', 'warehouse', 'user')
                    ->orwhere('return_purchases.reference_no', 'LIKE', "%{$search}%")
                    ->orwhere('suppliers.name', 'LIKE', "%{$search}%")
                    ->get();

                $totalFiltered = $q->orwhere('return_purchases.reference_no', 'LIKE', "%{$search}%")
                    ->orwhere('suppliers.name', 'LIKE', "%{$search}%")
                    ->count();
            }
        }
        $data = array();
        if (!empty($returnss)) {
            foreach ($returnss as $key => $returns) {
                $nestedData['id'] = $returns->id;
                $nestedData['key'] = $key;
                $nestedData['date'] = date(config('date_format'), strtotime($returns->created_at->toDateString()));
                $nestedData['reference_no'] = $returns->reference_no;
                $nestedData['warehouse'] = $returns->warehouse->name;
                if ($returns->purchase_id) {
                    $purchase_data = Purchase::select('reference_no')->find($returns->purchase_id);
                    $nestedData['purchase_reference'] = $purchase_data->reference_no;
                } else
                    $nestedData['purchase_reference'] = 'N/A';
                if ($returns->supplier) {
                    $supplier = $returns->supplier;
                    $nestedData['supplier'] = $returns->supplier->name;
                } else {
                    $supplier = new Supplier;
                    $nestedData['supplier'] = 'N/A';
                }
                $nestedData['grand_total'] = number_format($returns->grand_total, 2);
                $nestedData['options'] = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' . trans("file.action") . '
                              <span class="caret"></span>
                              <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" class="btn btn-link view"><i class="fa fa-eye"></i> ' . trans('file.View') . '</button>
                                </li>';
                if (in_array("returns-edit", $request['all_permission'])) {
                    $nestedData['options'] .= '<li>
                        <a href="' . route('return-purchase.edit', $returns->id) . '" class="btn btn-link"><i class="dripicons-document-edit"></i> ' . trans('file.edit') . '</a>
                        </li>';
                }
                '</ul>
                    </div>';
                // data for purchase details by one click

                $nestedData['return'] = array(
                    '[ "' . date(config('date_format'), strtotime($returns->created_at->toDateString())) . '"',
                    ' "' . $returns->reference_no . '"',
                    ' "' . $returns->warehouse->name . '"',
                    ' "' . $returns->warehouse->phone . '"',
                    ' "' . $returns->warehouse->address . '"',
                    ' "' . $supplier->name . '"',
                    ' "' . $supplier->company_name . '"',
                    ' "' . $supplier->email . '"',
                    ' "' . $supplier->phone_number . '"',
                    ' "' . $supplier->address . '"',
                    ' "' . $supplier->city . '"',
                    ' "' . $returns->id . '"',
                    ' "' . $returns->total_tax . '"',
                    ' "' . $returns->total_discount . '"',
                    ' "' . $returns->total_cost . '"',
                    ' "' . $returns->order_tax . '"',
                    ' "' . $returns->order_tax_rate . '"',
                    ' "' . $returns->grand_total . '"',
                    ' "' . preg_replace('/[\n\r]/', "<br>", $returns->return_note) . '"',
                    ' "' . preg_replace('/[\n\r]/', "<br>", $returns->staff_note) . '"',
                    ' "' . $returns->user->name . '"',
                    ' "' . $returns->user->email . '"',
                    ' "' . $nestedData['purchase_reference'] . '"]'
                );
                $data[] = $nestedData;
            }
        }
        $json_data = array(
            "draw" => intval($request->input('draw')),
            "recordsTotal" => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data" => $data
        );

        echo json_encode($json_data);
    }
    public function returnPurchaseCreate(Request $request)
    {

        $lims_purchase_data = Purchase::select('id')->where('reference_no', $request->input('reference_no'))->first();

        // return  $lims_purchase_data;
        $lims_product_purchase_data = ProductPurchase::where('purchase_id', $lims_purchase_data->id)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_account_list = Account::where('is_active', true)->get();
        return view('superadmin.return_purchase.create', compact('lims_warehouse_list', 'lims_tax_list', 'lims_account_list', 'lims_purchase_data', 'lims_product_purchase_data'));

    }
    public function returnPurchaseStore(Request $request)
    {
        $data = $request->except('document');
        //return dd($data);
        $data['reference_no'] = 'prr-' . date("Ymd") . '-' . date("his");
        $data['user_id'] = Auth::id();
        $lims_purchase_data = Purchase::select('warehouse_id', 'supplier_id')->find($data['purchase_id']);
        $data['user_id'] = Auth::id();
        $data['supplier_id'] = $lims_purchase_data->supplier_id;
        $data['warehouse_id'] = $lims_purchase_data->warehouse_id;
        $document = $request->document;
        // if ($document) {
        //     $v = Validator::make(
        //         [
        //             'extension' => strtolower($request->document->getClientOriginalExtension()),
        //         ],
        //         [
        //             'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
        //         ]
        //     );
        //     if ($v->fails())
        //         return redirect()->back()->withErrors($v->errors());

        //     $documentName = $document->getClientOriginalName();
        //     $document->move('public/return/documents', $documentName);
        //     $data['document'] = $documentName;
        // }

        $lims_return_data = ReturnPurchase::create($data);
        $mail_data['email'] = '';
        if ($data['supplier_id']) {
            $lims_supplier_data = Supplier::find($data['supplier_id']);
            //collecting male data
            $mail_data['email'] = $lims_supplier_data->email;
            $mail_data['reference_no'] = $lims_return_data->reference_no;
            $mail_data['total_qty'] = $lims_return_data->total_qty;
            $mail_data['total_price'] = $lims_return_data->total_price;
            $mail_data['order_tax'] = $lims_return_data->order_tax;
            $mail_data['order_tax_rate'] = $lims_return_data->order_tax_rate;
            $mail_data['grand_total'] = $lims_return_data->grand_total;
        }

        $product_id = $data['is_return'];
        $imei_number = $data['imei_number'];
        $product_batch_id = $data['product_batch_id'];
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $purchase_unit = $data['purchase_unit'];
        $net_unit_cost = $data['net_unit_cost'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];

        foreach ($product_id as $pro_id) {
            $key = array_search($pro_id, $data['product_id']);
            //return $key;
            $lims_product_data = Product::find($pro_id);
            $variant_id = null;
            if ($purchase_unit[$key] != 'n/a') {
                $lims_purchase_unit_data = Unit::where('unit_code', $purchase_unit[$key])->first();
                $purchase_unit_id = $lims_purchase_unit_data->id;
                if ($lims_purchase_unit_data->operator == '*')
                    $quantity = $qty[$key] * $lims_purchase_unit_data->operation_value;
                elseif ($lims_purchase_unit_data->operator == '/')
                    $quantity = $qty[$key] / $lims_purchase_unit_data->operation_value;

                if ($lims_product_data->is_variant) {
                    $lims_product_variant_data = ProductVariant::
                        select('id', 'variant_id', 'qty')
                        ->FindExactProductWithCode($pro_id, $product_code[$key])
                        ->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['warehouse_id'])->first();
                    $lims_product_variant_data->qty -= $quantity;
                    $lims_product_variant_data->save();
                    $variant_data = Variant::find($lims_product_variant_data->variant_id);
                    $variant_id = $variant_data->id;
                } elseif ($product_batch_id[$key]) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_batch_id[$key]],
                        ['warehouse_id', $data['warehouse_id']]
                    ])->first();
                    $lims_product_batch_data = ProductBatch::find($product_batch_id[$key]);
                    //increase product batch quantity
                    $lims_product_batch_data->qty -= $quantity;
                    $lims_product_batch_data->save();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['warehouse_id'])->first();

                $lims_product_data->qty -= $quantity;
                $lims_product_warehouse_data->qty -= $quantity;

                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            } else {
                if ($lims_product_data->type == 'combo') {
                    $product_list = explode(",", $lims_product_data->product_list);
                    $variant_list = explode(",", $lims_product_data->variant_list);
                    $qty_list = explode(",", $lims_product_data->qty_list);
                    $price_list = explode(",", $lims_product_data->price_list);

                    foreach ($product_list as $index => $child_id) {
                        $child_data = Product::find($child_id);
                        if ($variant_list[$index]) {
                            $child_product_variant_data = ProductVariant::where([
                                ['product_id', $child_id],
                                ['variant_id', $variant_list[$index]]
                            ])->first();

                            $child_warehouse_data = ProductWarehouse::where([
                                ['product_id', $child_id],
                                ['variant_id', $variant_list[$index]],
                                ['warehouse_id', $data['warehouse_id']],
                            ])->first();

                            $child_product_variant_data->qty += $qty[$key] * $qty_list[$index];
                            $child_product_variant_data->save();
                        } else {
                            $child_warehouse_data = ProductWarehouse::where([
                                ['product_id', $child_id],
                                ['warehouse_id', $data['warehouse_id']],
                            ])->first();
                        }

                        $child_data->qty -= $qty[$key] * $qty_list[$index];
                        $child_warehouse_data->qty -= $qty[$key] * $qty_list[$index];

                        $child_data->save();
                        $child_warehouse_data->save();
                    }
                }
                $purchase_unit_id = 0;
            }
            //add imei number if available
            if ($imei_number[$key]) {
                if ($lims_product_warehouse_data->imei_number)
                    $lims_product_warehouse_data->imei_number .= ',' . $imei_number[$key];
                else
                    $lims_product_warehouse_data->imei_number = $imei_number[$key];
                $lims_product_warehouse_data->save();
            }
            if ($lims_product_data->is_variant)
                $mail_data['products'][$key] = $lims_product_data->product_name . ' [' . $variant_data->variant_name . ']';
            else
                $mail_data['products'][$key] = $lims_product_data->product_name;

            if ($purchase_unit_id)
                $mail_data['unit'][$key] = $lims_purchase_unit_data->unit_code;
            else
                $mail_data['unit'][$key] = '';

            $mail_data['qty'][$key] = $qty[$key];
            $mail_data['total'][$key] = $total[$key];
            PurchaseProductReturn::insert(
                ['return_id' => $lims_return_data->id, 'product_id' => $pro_id, 'product_batch_id' => $product_batch_id[$key], 'variant_id' => $variant_id, 'imei_number' => $imei_number[$key], 'qty' => $qty[$key], 'purchase_unit_id' => $purchase_unit_id, 'net_unit_cost' => $net_unit_cost[$key], 'discount' => $discount[$key], 'tax_rate' => $tax_rate[$key], 'tax' => $tax[$key], 'total' => $total[$key], 'created_at' => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()]
            );
        }
        $message = 'Return created successfully';
        if ($mail_data['email']) {
            try {
                Mail::send('mail.return_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Return Details');
                });
            } catch (\Exception $e) {
                $message = 'Return created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('superAdmin/return-purchase')->with('message', $message);
    }
    public function returnPurchaseEdit($id)
    {


        $lims_supplier_list = Supplier::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_account_list = Account::where('is_active', true)->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_return_data = ReturnPurchase::find($id);
        $lims_product_return_data = PurchaseProductReturn::where('return_id', $id)->get();
        return view('superadmin.return_purchase.edit', compact('lims_supplier_list', 'lims_warehouse_list', 'lims_tax_list', 'lims_account_list', 'lims_return_data', 'lims_product_return_data'));

    }
    public function returnPurchaseUpdate(Request $request, $id)
    {
        $data = $request->except('document');
        //return dd($data);
        $document = $request->document;
        // if ($document) {
        //     $v = Validator::make(
        //         [
        //             'extension' => strtolower($request->document->getClientOriginalExtension()),
        //         ],
        //         [
        //             'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
        //         ]
        //     );
        //     if ($v->fails())
        //         return redirect()->back()->withErrors($v->errors());

        //     $documentName = $document->getClientOriginalName();
        //     $document->move('public/return/documents', $documentName);
        //     $data['document'] = $documentName;
        // }

        $lims_return_data = ReturnPurchase::find($id);
        $lims_product_return_data = PurchaseProductReturn::where('return_id', $id)->get();

        $product_id = $data['product_id'];
        $imei_number = $data['imei_number'];
        $product_batch_id = $data['product_batch_id'];
        $product_code = $data['product_code'];
        $product_variant_id = $data['product_variant_id'];
        $qty = $data['qty'];
        $purchase_unit = $data['purchase_unit'];
        $net_unit_cost = $data['net_unit_cost'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];

        foreach ($lims_product_return_data as $key => $product_return_data) {
            $old_product_id[] = $product_return_data->product_id;
            $old_product_variant_id[] = null;
            $lims_product_data = Product::find($product_return_data->product_id);
            if ($product_return_data->purchase_unit_id != 0) {
                $lims_purchase_unit_data = Unit::find($product_return_data->purchase_unit_id);
                if ($lims_purchase_unit_data->operator == '*')
                    $quantity = $product_return_data->qty * $lims_purchase_unit_data->operation_value;
                elseif ($lims_purchase_unit_data->operator == '/')
                    $quantity = $product_return_data->qty / $lims_purchase_unit_data->operation_value;

                if ($product_return_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($product_return_data->product_id, $product_return_data->variant_id)->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_return_data->product_id, $product_return_data->variant_id, $lims_return_data->warehouse_id)
                        ->first();
                    $old_product_variant_id[$key] = $lims_product_variant_data->id;
                    $lims_product_variant_data->qty += $quantity;
                    $lims_product_variant_data->save();
                } elseif ($product_return_data->product_batch_id) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $product_return_data->product_id],
                        ['product_batch_id', $product_return_data->product_batch_id],
                        ['warehouse_id', $lims_return_data->warehouse_id]
                    ])->first();

                    $product_batch_data = ProductBatch::find($product_return_data->product_batch_id);
                    $product_batch_data->qty += $quantity;
                    $product_batch_data->save();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_return_data->product_id, $lims_return_data->warehouse_id)
                        ->first();

                if ($product_return_data->imei_number) {
                    if ($lims_product_warehouse_data->imei_number)
                        $lims_product_warehouse_data->imei_number .= ',' . $product_return_data->imei_number;
                    else
                        $lims_product_warehouse_data->imei_number = $product_return_data->imei_number;
                }

                $lims_product_data->qty += $quantity;
                $lims_product_warehouse_data->qty += $quantity;
                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }
            if ($product_return_data->variant_id && !(in_array($old_product_variant_id[$key], $product_variant_id))) {
                $product_return_data->delete();
            } elseif (!(in_array($old_product_id[$key], $product_id)))
                $product_return_data->delete();
        }
        foreach ($product_id as $key => $pro_id) {
            $lims_product_data = Product::find($pro_id);
            $product_return['variant_id'] = null;
            if ($purchase_unit[$key] != 'n/a') {
                $lims_purchase_unit_data = Unit::where('unit_code', $purchase_unit[$key])->first();
                $purchase_unit_id = $lims_purchase_unit_data->id;
                if ($lims_purchase_unit_data->operator == '*')
                    $quantity = $qty[$key] * $lims_purchase_unit_data->operation_value;
                elseif ($lims_purchase_unit_data->operator == '/')
                    $quantity = $qty[$key] / $lims_purchase_unit_data->operation_value;

                if ($lims_product_data->is_variant) {
                    $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProductWithCode($pro_id, $product_code[$key])->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['warehouse_id'])
                        ->first();
                    // return $product_code[$key];
                    $variant_data = Variant::find($lims_product_variant_data->variant_id);

                    $product_return['variant_id'] = $lims_product_variant_data->variant_id;
                    $lims_product_variant_data->qty -= $quantity;
                    $lims_product_variant_data->save();
                } elseif ($product_batch_id[$key]) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $pro_id],
                        ['product_batch_id', $product_batch_id[$key]],
                        ['warehouse_id', $data['warehouse_id']]
                    ])->first();

                    $product_batch_data = ProductBatch::find($product_batch_id[$key]);
                    $product_batch_data->qty -= $quantity;
                    $product_batch_data->save();
                } else {
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['warehouse_id'])
                        ->first();
                }
                //deduct imei number if available
                if ($imei_number[$key]) {
                    $imei_numbers = explode(",", $imei_number[$key]);
                    $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
                    foreach ($imei_numbers as $number) {
                        if (($j = array_search($number, $all_imei_numbers)) !== false) {
                            unset($all_imei_numbers[$j]);
                        }
                    }
                    $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
                }

                $lims_product_data->qty -= $quantity;
                $lims_product_warehouse_data->qty -= $quantity;

                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }

            if ($lims_product_data->is_variant)
                $mail_data['products'][$key] = $lims_product_data->name . ' [' . $variant_data->name . ']';
            else
                $mail_data['products'][$key] = $lims_product_data->name;

            if ($purchase_unit_id)
                $mail_data['unit'][$key] = $lims_purchase_unit_data->unit_code;
            else
                $mail_data['unit'][$key] = '';

            $mail_data['qty'][$key] = $qty[$key];
            $mail_data['total'][$key] = $total[$key];

            $product_return['return_id'] = $id;
            $product_return['product_id'] = $pro_id;
            $product_return['imei_number'] = $imei_number[$key];
            $product_return['product_batch_id'] = $product_batch_id[$key];
            $product_return['qty'] = $qty[$key];
            $product_return['purchase_unit_id'] = $purchase_unit_id;
            $product_return['net_unit_cost'] = $net_unit_cost[$key];
            $product_return['discount'] = $discount[$key];
            $product_return['tax_rate'] = $tax_rate[$key];
            $product_return['tax'] = $tax[$key];
            $product_return['total'] = $total[$key];

            if ($product_return['variant_id'] && in_array($product_variant_id[$key], $old_product_variant_id)) {
                PurchaseProductReturn::where([
                    ['product_id', $pro_id],
                    ['variant_id', $product_return['variant_id']],
                    ['return_id', $id]
                ])->update($product_return);
            } elseif ($product_return['variant_id'] === null && (in_array($pro_id, $old_product_id))) {
                PurchaseProductReturn::where([
                    ['return_id', $id],
                    ['product_id', $pro_id]
                ])->update($product_return);
            } else
                PurchaseProductReturn::create($product_return);
        }
        $lims_return_data->update($data);
        $message = 'Return updated successfully';
        if ($data['supplier_id']) {
            $lims_supplier_data = Supplier::find($data['supplier_id']);
            //collecting male data
            $mail_data['email'] = $lims_supplier_data->email;
            $mail_data['reference_no'] = $lims_return_data->reference_no;
            $mail_data['total_qty'] = $lims_return_data->total_qty;
            $mail_data['total_price'] = $lims_return_data->total_cost;
            $mail_data['order_tax'] = $lims_return_data->order_tax;
            $mail_data['order_tax_rate'] = $lims_return_data->order_tax_rate;
            $mail_data['grand_total'] = $lims_return_data->grand_total;

            try {
                Mail::send('mail.return_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Return Details');
                });
            } catch (\Exception $e) {
                $message = 'Return updated successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }

        return redirect('superAdmin/return-purchase')->with('message', $message);
    }

    public function returnPurchaseGetproduct($id)
    {
        //retrieve data of product without variant
        $lims_product_warehouse_data = DB::table('products')

            ->join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->select('products.product_code', 'products.product_name', 'products.product_type', 'product_warehouses.qty')
            ->where([
                ['product_warehouses.warehouse_id', $id],
                ['products.is_active', true]
            ])
            ->whereNull('product_warehouses.variant_id')
            ->whereNull('product_warehouses.product_batch_id')
            ->get();

        config()->set('database.connections.mysql.strict', false);
        \DB::reconnect(); //important as the existing connection if any would be in strict mode




        //retrieve data of product with batch
        $lims_product_with_batch_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.warehouse_id', $id],
            ])
            ->whereNull('product_warehouses.variant_id')
            ->whereNotNull('product_warehouses.product_batch_id')
            ->select('product_warehouses.*')
            ->groupBy('product_warehouses.product_id')
            ->get();

        //now changing back the strict ON
        config()->set('database.connections.mysql.strict', true);
        \DB::reconnect();

        //retrieve data of product with variant
        $lims_product_with_variant_warehouse_data = DB::table('products')
            ->join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->select('products.id', 'products.product_code', 'products.product_name', 'products.product_type', 'product_warehouses.qty', 'product_warehouses.variant_id')
            ->where([
                ['product_warehouses.warehouse_id', $id],
                ['products.is_active', true]
            ])
            ->whereNotNull('product_warehouses.variant_id')
            ->get();

        $product_code = [];
        $product_name = [];
        $product_qty = [];
        $is_batch = [];
        $product_data = [];
        foreach ($lims_product_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $product_code[] = $product_warehouse->product_code;
            $product_name[] = $product_warehouse->product_name;
            $product_type[] = $product_warehouse->product_type;
            $is_batch[] = null;
        }
        //product with batches
        foreach ($lims_product_with_batch_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $lims_product_data = Product::select('product_code', 'product_name', 'product_type', 'is_batch')->find($product_warehouse->product_id);
            $product_code[] = $lims_product_data->product_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->product_type;
            $product_batch_data = ProductBatch::select('id', 'batch_no')->find($product_warehouse->product_batch_id);
            $is_batch[] = $lims_product_data->is_batch;
        }

        foreach ($lims_product_with_variant_warehouse_data as $product_warehouse) {
            $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_warehouse->id, $product_warehouse->variant_id)->first();
            $product_qty[] = $product_warehouse->qty;
            $product_code[] = $lims_product_variant_data->item_code;
            $product_name[] = $product_warehouse->product_name;
            $product_type[] = $product_warehouse->product_type;
            $is_batch[] = null;
        }

        $product_data = [$product_code, $product_name, $product_qty, $product_type, $is_batch];
        return $product_data;
    }

    public function returnPurchaseCheckBatchAvailability($product_id, $batch_no, $warehouse_id)
    {
        $product_batch_data = ProductBatch::where([
            ['product_id', $product_id],
            ['batch_no', $batch_no]
        ])->first();
        if ($product_batch_data) {
            $product_warehouse_data = ProductWarehouse::select('qty')
                ->where([
                    ['product_batch_id', $product_batch_data->id],
                    ['warehouse_id', $warehouse_id]
                ])->first();
            if ($product_warehouse_data) {
                $data['qty'] = $product_warehouse_data->qty;
                $data['product_batch_id'] = $product_batch_data->id;
                $data['expired_date'] = date(config('date_format'), strtotime($product_batch_data->expired_date));
                $data['message'] = 'ok';
            } else {
                $data['qty'] = 0;
                $data['message'] = 'This Batch does not exist in the selected warehouse!';
            }
        } else {
            $data['message'] = 'Wrong Batch Number!';
        }
        return $data;
    }

    public function returnPurchaseProductSearch(Request $request)
    {
        $product_code = explode("(", $request['data']);
        $product_code[0] = rtrim($product_code[0], " ");
        $lims_product_data = Product::where('product_code', $product_code[0])->first();
        $product_variant_id = null;
        if (!$lims_product_data) {
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->select('products.*', 'product_variants.id as product_variant_id', 'product_variants.item_code', 'product_variants.additional_cost')
                ->where('product_variants.item_code', $product_code[0])
                ->first();
            $lims_product_data->product_code = $lims_product_data->item_code;
            $lims_product_data->product_cost += $lims_product_data->additional_cost;
            $product_variant_id = $lims_product_data->product_variant_id;
        }

        $product[] = $lims_product_data->product_name;
        $product[] = $lims_product_data->product_code;
        $product[] = $lims_product_data->product_cost;

        if ($lims_product_data->tax_id) {
            $lims_tax_data = Tax::find($lims_product_data->tax_id);
            $product[] = $lims_tax_data->rate;
            $product[] = $lims_tax_data->name;
        } else {
            $product[] = 0;
            $product[] = 'No Tax';
        }
        $product[] = $lims_product_data->tax_method;

        $units = Unit::where("base_unit", $lims_product_data->unit_id)
            ->orWhere('id', $lims_product_data->unit_id)
            ->get();

        $unit_code = array();
        $unit_operator = array();
        $unit_operation_value = array();
        foreach ($units as $unit) {
            if ($lims_product_data->purchase_unit_id == $unit->id) {
                array_unshift($unit_code, $unit->unit_code);
                array_unshift($unit_operator, $unit->operator);
                array_unshift($unit_operation_value, $unit->operation_value);
            } else {
                $unit_code[] = $unit->unit_code;
                $unit_operator[] = $unit->operator;
                $unit_operation_value[] = $unit->operation_value;
            }
        }

        $product[] = implode(",", $unit_code) . ',';
        $product[] = implode(",", $unit_operator) . ',';
        $product[] = implode(",", $unit_operation_value) . ',';
        $product[] = $lims_product_data->id;
        $product[] = $product_variant_id;
        $product[] = $lims_product_data->is_imei;
        return $product;
    }
    public function returnPurchaseProductReturn($id)
    {
        $lims_product_return_data = PurchaseProductReturn::where('return_id', $id)->get();
        foreach ($lims_product_return_data as $key => $product_return_data) {
            $product = Product::find($product_return_data->product_id);
            if ($product_return_data->purchase_unit_id != 0) {
                $unit_data = Unit::find($product_return_data->purchase_unit_id);
                $unit = $unit_data->unit_code;
            } else
                $unit = '';

            if ($product_return_data->variant_id) {
                $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_return_data->product_id, $product_return_data->variant_id)->first();
                $product->code = $lims_product_variant_data->item_code;
            }
            if ($product_return_data->product_batch_id) {
                $product_batch_data = ProductBatch::select('batch_no')->find($product_return_data->product_batch_id);
                $product_return[7][$key] = $product_batch_data->batch_no;
            } else
                $product_return[7][$key] = 'N/A';
            $product_return[0][$key] = $product->product_name . ' [' . $product->product_code . ']';
            if ($product_return_data->imei_number)
                $product_return[0][$key] .= '<br>IMEI or Serial Number: ' . $product_return_data->imei_number;
            $product_return[1][$key] = $product_return_data->qty;
            $product_return[2][$key] = $unit;
            $product_return[3][$key] = $product_return_data->tax;
            $product_return[4][$key] = $product_return_data->tax_rate;
            $product_return[5][$key] = $product_return_data->discount;
            $product_return[6][$key] = $product_return_data->total;
        }
        return $product_return;
    }
    public function returnpurchasedestroy($id)
    {
        $lims_return_data = ReturnPurchase::find($id);
        $lims_product_return_data = PurchaseProductReturn::where('return_id', $id)->get();

        foreach ($lims_product_return_data as $key => $product_return_data) {
            $lims_product_data = Product::find($product_return_data->product_id);

            if ($product_return_data->purchase_unit_id != 0) {
                $lims_purchase_unit_data = Unit::find($product_return_data->purchase_unit_id);

                if ($lims_purchase_unit_data->operator == '*')
                    $quantity = $product_return_data->qty * $lims_purchase_unit_data->operation_value;
                elseif ($lims_purchase_unit_data->operator == '/')
                    $quantity = $product_return_data->qty / $lims_purchase_unit_data->operation_value;

                if ($product_return_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($product_return_data->product_id, $product_return_data->variant_id)->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_return_data->product_id, $product_return_data->variant_id, $lims_return_data->warehouse_id)->first();
                    $lims_product_variant_data->qty += $quantity;
                    $lims_product_variant_data->save();
                } elseif ($product_return_data->product_batch_id) {
                    $lims_product_batch_data = ProductBatch::find($product_return_data->product_batch_id);
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_return_data->product_batch_id],
                        ['warehouse_id', $lims_return_data->warehouse_id]
                    ])->first();

                    $lims_product_batch_data->qty += $product_return_data->qty;
                    $lims_product_batch_data->save();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_return_data->product_id, $lims_return_data->warehouse_id)->first();

                if ($product_return_data->imei_number) {
                    if ($lims_product_warehouse_data->imei_number)
                        $lims_product_warehouse_data->imei_number .= ',' . $product_return_data->imei_number;
                    else
                        $lims_product_warehouse_data->imei_number = $product_return_data->imei_number;
                }

                $lims_product_data->qty += $quantity;
                $lims_product_warehouse_data->qty += $quantity;
                $lims_product_data->save();
                $lims_product_warehouse_data->save();
                $product_return_data->delete();
            }
        }
        $lims_return_data->delete();
        return redirect('superAdmin/return-purchase')->with('not_permitted', 'Data deleted successfully');
        ;
    }
     // ========================Return Sale===================    

    public function returnSaleIndex(Request $request){
        if ($request->ajax()) {
            $purchase = Returns::latest()->get();
            return Datatables::of($purchase)
                ->addIndexColumn()
                ->addColumn('date', function ($row) {
                    $date = date("Y-m-d", strtotime($row->created_at));
                    return $date;
                })
                ->addColumn('sl_reference', function ($row) {
                    if($row->sale_id) {
                        $sale_data = Sale::select('reference_no')->find($row->sale_id);
                        $sl_reference = $sale_data->reference_no;
                        return $sl_reference;
                    }
                    else{
                        return 'N/A';
                    }
                })
                ->addColumn('warehouse', function ($row) {
                    $warehouse = $row->warehouse->name;
                    return $warehouse;
                })
                ->addColumn('biller', function ($row) {
                  $biller =   $row->biller->name;
                    return  $biller;
                })
                ->addColumn('coustomer', function ($row) {
                    $coustomer = $row->customer->name;
                    return $coustomer;
                })
              
                ->addColumn('groundTotal', function ($row) {
                    $ground = number_format($row->grand_total, 2);
                    return ($ground);
                })

                ->addColumn('action', function ($row) {

                     if($row->sale_id) {
                        $sale_data = Sale::select('reference_no')->find($row->sale_id);
                        $sl_reference = $sale_data->reference_no;
                    }
                    else{
                        $sl_reference =  'N/A';
                    }
                    $user = new User();
                  
                    // View Button
                    $viewButton =
                    '<a href="javascript:void(0)" style="box-shadow:none;" class="btn btn-link view" 
                            data-id = "' . $row->id . '"
                            data-date = "' . date('d-m-Y', strtotime($row->created_at)) . '"
                            data-reference_no = "' . $row->reference_no . '"
                            data-sale_reference = "' .$sl_reference  . '"

                            data-coustomername = "' . $row->customer->name . '"
                            data-coustomerphone = "' . $row->customer->phone_number . '"
                            data-coustomeremail = "' . $row->customer->email . '"
                            data-coustomeraddress = "' . $row->customer->address . '"   
                            
                            data-billername = "' . $row->biller->name . '"
                            data-billerphone = "' . $row->biller->phone_number . '"
                            data-billeremail = "' . $row->biller->email . '"
                            data-billeraddress = "' . $row->biller->address . '"                      

                            
                            data-warehouse_name = "' . $row->warehouse->name . '"
                            data-warehouse_phone = "' . $row->warehouse->phone . '"
                            data-warehouse_address = "' . $row->warehouse->address . '"
                         
                            data-total_discount = "' . $row->total_discount . '"
                            data-order_tax = "' . $row->order_tax . '"
                            data-total_cost = "' . $row->total_price . '"
                            data-total_tax = "' . $row->total_tax . '"
                            data-grand_total = "' . $row->grand_total . '"

                            data-return_note = "' . $row->return_note . '"
                            data-staff_note = "' . $row->staff_note . '"

                            data-user_name = "' . $row->user->name . '"
                            data-user_email = "' . $row->user->email . '"
                
                            ><i class="fa fa-eye"></i> ' . trans('View') . '</a>';
                    $updateButton = '<a href="' . route('superAdmin.return-sale.edit', $row->id) . '" class="btn btn-link"><i class="fas fa-edit"></i> ' . trans('Edit') . '</a>';

                    // Delete Button
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-link  deletereturnpurchase"><i class="fa fa-trash"></i> ' . trans('Delete') . '</a>';

                    $nasted = '<div class="btn-group">
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                        <li>' . $updateButton . '</li>
                                    
                                        <li>' . $viewButton . '</li>
                                    
                                        <li>' . $deleteButton . '</li>
                                    </ul>
                                </div>';

                    // return $nasted ;
    
                    return $updateButton . " " . $deleteButton . "" . $viewButton;
                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }

        if($request->input('warehouse_id')){
            $warehouse_id = $request->input('warehouse_id');
        }else{
                $warehouse_id = 0;
            }

            if($request->input('starting_date')) {
                $starting_date = $request->input('starting_date');
                $ending_date = $request->input('ending_date');
            }
            else {
                $starting_date = date("Y-m-d", strtotime(date('Y-m-d', strtotime('-1 year', strtotime(date('Y-m-d') )))));
                $ending_date = date("Y-m-d");
            }

            $lims_warehouse_list = Warehouse::where('is_active', true)->get();
            return view('superAdmin.return.index',compact('starting_date', 'ending_date', 'warehouse_id', 'lims_warehouse_list'));
    }
    public function returnSaleCreate(Request $request)
    {
        
            $lims_tax_list = Tax::where('is_active',true)->get();
            $lims_sale_data = Sale::select('id')->where('reference_no', $request->input('reference_no'))->first();
        $lims_product_sale_data = ProductSale::where('sale_id', $lims_sale_data->id)->get();
       
            $lims_warehouse_list = Warehouse::where('is_active',true)->get();
            return view('superadmin.return.create', compact('lims_tax_list', 'lims_sale_data', 'lims_product_sale_data', 'lims_warehouse_list'));
    
    }

    public function returnGetCustomerGroup($id)
    {
         $lims_customer_data = Customer::find($id);
         $lims_customer_group_data = CustomerGroup::find($lims_customer_data->customer_group_id);
         return $lims_customer_group_data->percentage;
    }
    public function returnGetProduct($id)
    {
 
        //retrieve data of product without variant
        $lims_product_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
        ->where([
            ['products.is_active', true],
            ['product_warehouses.warehouse_id', $id],
        ])
        ->whereNull('product_warehouses.variant_id')
        ->whereNull('product_warehouses.product_batch_id')
        ->select('product_warehouses.*')
        ->get();

        config()->set('database.connections.mysql.strict', false);
        \DB::reconnect(); //important as the existing connection if any would be in strict mode

        $lims_product_with_batch_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
        ->where([
            ['products.is_active', true],
            ['product_warehouses.warehouse_id', $id],
        ])
        ->whereNull('product_warehouses.variant_id')
        ->whereNotNull('product_warehouses.product_batch_id')
        ->select('product_warehouses.*')
        ->groupBy('product_warehouses.product_id')
        ->get();

        //now changing back the strict ON
        config()->set('database.connections.mysql.strict', true);
        \DB::reconnect();

        //retrieve data of product with variant
        $lims_product_with_variant_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
        ->where([
            ['products.is_active', true],
            ['product_warehouses.warehouse_id', $id],
        ])->whereNotNull('product_warehouses.variant_id')->select('product_warehouses.*')->get();

        $product_code = [];
        $product_name = [];
        $product_qty = [];
        $product_price = [];
        $product_type = [];
        $is_batch = [];
        $product_data = [];
        foreach ($lims_product_warehouse_data as $product_warehouse) 
        {
            $product_qty[] = $product_warehouse->qty;
            $product_price[] = $product_warehouse->price;
            $lims_product_data = Product::select('product_code', 'product_name', 'product_type', 'is_batch')->find($product_warehouse->product_id);
            $product_code[] =  $lims_product_data->product_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->product_type;
            $is_batch[] = null;
        }
        //product with batches
        foreach ($lims_product_with_batch_warehouse_data as $product_warehouse) 
        {
            $product_qty[] = $product_warehouse->qty;
            $product_price[] = $product_warehouse->price;
            $lims_product_data = Product::select('product_code', 'product_name', 'product_type', 'is_batch')->find($product_warehouse->product_id);
            $product_code[] =  $lims_product_data->product_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->type;
            $product_batch_data = ProductBatch::select('id', 'batch_no')->find($product_warehouse->product_batch_id);
            $is_batch[] = $lims_product_data->is_batch;
        }
        foreach ($lims_product_with_variant_warehouse_data as $product_warehouse) 
        {
            $product_qty[] = $product_warehouse->qty;
            $lims_product_data = Product::select('product_name', 'product_type')->find($product_warehouse->product_id);
            $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_warehouse->product_id, $product_warehouse->variant_id)->first();
            $product_code[] =  $lims_product_variant_data->item_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->product_type;
            $is_batch[] = null;
        }
        $lims_product_data = Product::select('product_code', 'product_name', 'product_type')->where('is_active', true)->whereNotIn('product_type', ['standard'])->get();
        foreach ($lims_product_data as $product) 
        {
            $product_qty[] = $product->qty;
            $product_code[] =  $product->product_code;
            $product_name[] = htmlspecialchars($product->product_name);
            $product_type[] = $product->product_type;
            $is_batch[] = null;
        }
        $product_data[] = $product_code;
        $product_data[] = $product_name;
        $product_data[] = $product_qty;
        $product_data[] = $product_type;
        $product_data[] = $product_price;
        $product_data[] = $is_batch;
        return $product_data;
    }
    public function returnLimsProductSearch(Request $request)
    {
        $todayDate = date('Y-m-d');
        $product_code = explode("(", $request['data']);
        $product_code[0] = rtrim($product_code[0], " ");
        $lims_product_data = Product::where('product_code', $product_code[0])->first();
        $product_variant_id = null;
        if(!$lims_product_data) {
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->select('products.*', 'product_variants.id as product_variant_id', 'product_variants.item_code', 'product_variants.additional_price')
                ->where('product_variants.item_code', $product_code[0])
                ->first();
            $lims_product_data->product_code = $lims_product_data->item_code;
            $lims_product_data->product_price += $lims_product_data->additional_price;
            $product_variant_id = $lims_product_data->product_variant_id;
        }
        $product[] = $lims_product_data->product_name;
        $product[] = $lims_product_data->product_code;
        if($lims_product_data->promotion && $todayDate <= $lims_product_data->last_date){
            $product[] = $lims_product_data->promotion_price;
        }
        else
            $product[] = $lims_product_data->product_price;
        
        if($lims_product_data->tax_id) {
            $lims_tax_data = Tax::find($lims_product_data->tax_id);
            $product[] = $lims_tax_data->rate;
            $product[] = $lims_tax_data->name;
        }
        else{
            $product[] = 0;
            $product[] = 'No Tax';
        }
        $product[] = $lims_product_data->tax_method;
        if($lims_product_data->product_type == 'standard'){
            $units = Unit::where("id", $lims_product_data->unit_id)
                    ->orWhere('id', $lims_product_data->unit_id)
                    ->get();
            $unit_code = array();
            $unit_operator = array();
            $unit_operation_value = array();
            foreach ($units as $unit) {
                if($lims_product_data->sale_unit_id == $unit->id) {
                    array_unshift($unit_code, $unit->unit_code);
                    array_unshift($unit_operator, $unit->operator);
                    array_unshift($unit_operation_value, $unit->operation_value);
                }
                else {
                    $unit_code[]  = $unit->unit_code;
                    $unit_operator[] = $unit->operator;
                    $unit_operation_value[] = $unit->operation_value;
                }
            }
            $product[] = implode(",",$unit_code) . ',';
            $product[] = implode(",",$unit_operator) . ',';
            $product[] = implode(",",$unit_operation_value) . ',';     
        }
        
        else{
            $product[] = 'n/a'. ',';
            $product[] = 'n/a'. ',';
            $product[] = 'n/a'. ',';
        }
        $product[] = $lims_product_data->id;
        $product[] = $product_variant_id;
        $product[] = $lims_product_data->promotion;
        $product[] = $lims_product_data->is_imei;
        return $product;
    }
    public function productReturnData($id)
    {
        $lims_product_return_data = ProductReturn::where('return_id', $id)->get();
        foreach ($lims_product_return_data as $key => $product_return_data) {
            $product = Product::find($product_return_data->product_id);
            if($product_return_data->sale_unit_id != 0){
                $unit_data = Unit::find($product_return_data->sale_unit_id);
                $unit = $unit_data->unit_code;
            }
            else
                $unit = '';
            if($product_return_data->variant_id) {
                $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_return_data->product_id, $product_return_data->variant_id)->first();
                $product->product_code = $lims_product_variant_data->item_code;
            }
            if($product_return_data->product_batch_id) {
                $product_batch_data = ProductBatch::select('batch_no')->find($product_return_data->product_batch_id);
                $product_return[7][$key] = $product_batch_data->batch_no;
            }
            else
                $product_return[7][$key] = 'N/A';
            $product_return[0][$key] = $product->product_name . ' [' . $product->product_code . ']';
            if($product_return_data->imei_number)
                $product_return[0][$key] .= '<br>IMEI or Serial Number: ' . $product_return_data->imei_number;
            $product_return[1][$key] = $product_return_data->qty;
            $product_return[2][$key] = $unit;
            $product_return[3][$key] = $product_return_data->tax;
            $product_return[4][$key] = $product_return_data->tax_rate;
            $product_return[5][$key] = $product_return_data->discount;
            $product_return[6][$key] = $product_return_data->total;
        }
        return $product_return;
    }
    public function returnSendMail(Request $request)
    {
        $data = $request->all();
        $lims_return_data = Returns::find($data['return_id']);
        $lims_product_return_data = ProductReturn::where('return_id', $data['return_id'])->get();
        $lims_customer_data = Customer::find($lims_return_data->customer_id);
        if($lims_customer_data->email) {
            //collecting male data
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['reference_no'] = $lims_return_data->reference_no;
            $mail_data['total_qty'] = $lims_return_data->total_qty;
            $mail_data['total_price'] = $lims_return_data->total_price;
            $mail_data['order_tax'] = $lims_return_data->order_tax;
            $mail_data['order_tax_rate'] = $lims_return_data->order_tax_rate;
            $mail_data['grand_total'] = $lims_return_data->grand_total;

            foreach ($lims_product_return_data as $key => $product_return_data) {
                $lims_product_data = Product::find($product_return_data->product_id);
                if($product_return_data->variant_id){
                    $variant_data = Variant::find($product_return_data->variant_id);
                    $mail_data['products'][$key] = $lims_product_data->product_name . ' [' . $variant_data->variant_name .']';
                }
                else
                    $mail_data['products'][$key] = $lims_product_data->product_name;

                if($product_return_data->sale_unit_id){
                    $lims_unit_data = Unit::find($product_return_data->sale_unit_id);
                    $mail_data['unit'][$key] = $lims_unit_data->unit_code;
                }
                else
                    $mail_data['unit'][$key] = '';

                $mail_data['qty'][$key] = $product_return_data->qty;
                $mail_data['total'][$key] = $product_return_data->qty;
            }

            try{
                Mail::send( 'mail.return_details', $mail_data, function( $message ) use ($mail_data)
                {
                    $message->to( $mail_data['email'] )->subject( 'Return Details' );
                });
                $message = 'Mail sent successfully';
            }
            catch(\Exception $e){
                $message = 'Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        else
            $message = 'Customer doesnt have email!';
        
        return redirect()->back()->with('message', $message);
    }
    public function returnSaleStore(Request $request)
    {
        $data = $request->all(); 
        // return dd($data);
        $data['reference_no'] = 'rr-' . date("Ymd") . '-'. date("his");       
        $lims_sale_data = Sale::select('warehouse_id', 'customer_id', 'biller_id')->find($data['sale_id']);
        $data['user_id'] = Auth::id();
        $data['customer_id'] = $lims_sale_data->customer_id;
        $data['warehouse_id'] = $lims_sale_data->warehouse_id;
        $data['biller_id'] = $lims_sale_data->biller_id;
        $cash_register_data = CashRegister::where([
            ['user_id', $data['user_id']],
            ['warehouse_id', $data['warehouse_id']],
            ['status', true]
        ])->first();
        if($cash_register_data)
            $data['cash_register_id'] = $cash_register_data->id;
        $lims_account_data = Account::where('is_default', true)->first();
        $data['account_id'] = $lims_account_data->id;

        // $lims_return_data =  Returns::insert($data);
        $lims_return_data = Returns::create($data);

        $lims_customer_data = Customer::find($data['customer_id']);
        //collecting male data
        $mail_data['email'] = $lims_customer_data->email;
        $mail_data['reference_no'] = $lims_return_data->reference_no;
        $mail_data['total_qty'] = $lims_return_data->total_qty;
        $mail_data['total_price'] = $lims_return_data->total_price;
        $mail_data['order_tax'] = $lims_return_data->order_tax;
        $mail_data['order_tax_rate'] = $lims_return_data->order_tax_rate;
        $mail_data['grand_total'] = $lims_return_data->grand_total;

        $product_id = $data['is_return'];
        $imei_number = $data['imei_number'];
        $product_batch_id = $data['product_batch_id'] ?? '';
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $sale_unit = $data['sale_unit'];
        $net_unit_price = $data['net_unit_price'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];

        foreach ($product_id as $pro_id) {
            $key = array_search($pro_id, $data['product_id']);
           
            $lims_product_data = Product::find($pro_id);
            $variant_id = null;
            if($sale_unit[$key] != 'n/a') {
                $lims_sale_unit_data  = Unit::where('unit_code', $sale_unit[$key])->first();
                $sale_unit_id = $lims_sale_unit_data->id;
                if($lims_sale_unit_data->operator == '*')
                    $quantity = $qty[$key] * $lims_sale_unit_data->operation_value;
                elseif($lims_sale_unit_data->operator == '/')
                    $quantity = $qty[$key] / $lims_sale_unit_data->operation_value;

                if($lims_product_data->is_variant) {
                    $lims_product_variant_data = ProductVariant::
                        select('id', 'variant_id', 'qty')
                        ->FindExactProductWithCode($pro_id, $product_code[$key])
                        ->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['warehouse_id'])->first();
                    $lims_product_variant_data->qty += $quantity;
                    $lims_product_variant_data->save();
                    $variant_data = Variant::find($lims_product_variant_data->variant_id);
                    $variant_id = $variant_data->id;
                }
                elseif($product_batch_id[$key]) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_batch_id[$key] ],
                        ['warehouse_id', $data['warehouse_id'] ]
                    ])->first();
                    $lims_product_batch_data = ProductBatch::find($product_batch_id[$key]);
                    //increase product batch quantity
                    $lims_product_batch_data->qty += $quantity;
                    $lims_product_batch_data->save();
                }
                else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['warehouse_id'])->first();

                $lims_product_data->qty +=  $quantity;
                $lims_product_warehouse_data->qty += $quantity;

                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }
            else {
                if($lims_product_data->product_type == 'combo') {
                    $product_list = explode(",", $lims_product_data->product_list);
                    $variant_list = explode(",", $lims_product_data->variant_list);
                    $qty_list = explode(",", $lims_product_data->qty_list);
                    $price_list = explode(",", $lims_product_data->price_list);

                    foreach ($product_list as $index => $child_id) {
                        $child_data = Product::find($child_id);
                        if($variant_list[$index]) {
                            $child_product_variant_data = ProductVariant::where([
                                ['product_id', $child_id],
                                ['variant_id', $variant_list[$index]]
                            ])->first();

                            $child_warehouse_data = ProductWarehouse::where([
                                ['product_id', $child_id],
                                ['variant_id', $variant_list[$index]],
                                ['warehouse_id', $data['warehouse_id'] ],
                            ])->first();

                            $child_product_variant_data->qty += $qty[$key] * $qty_list[$index];
                            $child_product_variant_data->save();
                        }
                        else {
                            $child_warehouse_data = ProductWarehouse::where([
                                ['product_id', $child_id],
                                ['warehouse_id', $data['warehouse_id'] ],
                            ])->first();
                        }
                        
                        $child_data->qty += $qty[$key] * $qty_list[$index];
                        $child_warehouse_data->qty += $qty[$key] * $qty_list[$index];

                        $child_data->save();
                        $child_warehouse_data->save();
                    }
                }
                $sale_unit_id = 0;
            }
            //add imei number if available
            if($imei_number[$key]) {
                if($lims_product_warehouse_data->imei_number)
                    $lims_product_warehouse_data->imei_number .= ',' . $imei_number[$key];
                 else
                    $lims_product_warehouse_data->imei_number = $imei_number[$key];
                $lims_product_warehouse_data->save(); 
            }
            if($lims_product_data->is_variant)
                $mail_data['products'][$key] = $lims_product_data->product_name . ' [' . $variant_data->variant_name . ']';
            else
                $mail_data['products'][$key] = $lims_product_data->product_name;
            
            if($sale_unit_id)
                $mail_data['unit'][$key] = $lims_sale_unit_data->unit_code;
            else
                $mail_data['unit'][$key] = '';

            $mail_data['qty'][$key] = $qty[$key];
            $mail_data['total'][$key] = $total[$key];

       
            ProductReturn::insert(
                ['return_id' => $lims_return_data->id, 'product_id' => $pro_id, 'product_batch_id' => $product_batch_id[$key], 'variant_id' => $variant_id, 'imei_number' => $imei_number[$key], 'qty' => $qty[$key], 'sale_unit_id' => $sale_unit_id, 'net_unit_price' => $net_unit_price[$key], 'discount' => $discount[$key], 'tax_rate' => $tax_rate[$key], 'tax' => $tax[$key], 'total' => $total[$key], 'created_at' => \Carbon\Carbon::now(),  'updated_at' => \Carbon\Carbon::now()]
            );
        }
        $message = 'Return created successfully';
        if($mail_data['email']){
            try{
                Mail::send( 'mail.return_details', $mail_data, function( $message ) use ($mail_data)
                {
                    $message->to( $mail_data['email'] )->subject( 'Return Details' );
                });
            }
            catch(\Exception $e){
                $message = 'Return created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('superAdmin/return-sale')->with('message', $message);
    }


    public function returnSaleEdit($id)
    {
            $lims_customer_list = Customer::where('is_active',true)->get();
            $lims_warehouse_list = Warehouse::where('is_active',true)->get();
            $lims_biller_list = Biller::where('is_active',true)->get();
            $lims_tax_list = Tax::where('is_active',true)->get();
            $lims_return_data = Returns::find($id);
            $lims_product_return_data = ProductReturn::where('return_id', $id)->get();
            return view('superadmin.return.edit',compact('lims_customer_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_tax_list', 'lims_return_data','lims_product_return_data'));
      
    }
    public function returnSaleUpdate(Request $request, $id)
    {
        $data = $request->except('document');
        //return dd($data);
        $document = $request->document;
        // if ($document) {
        //     $v = Validator::make(
        //         [
        //             'extension' => strtolower($request->document->getClientOriginalExtension()),
        //         ],
        //         [
        //             'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
        //         ]
        //     );
        //     if ($v->fails())
        //         return redirect()->back()->withErrors($v->errors());

        //     $documentName = $document->getClientOriginalName();
        //     $document->move('public/return/documents', $documentName);
        //     $data['document'] = $documentName;
        // }

        $lims_return_data = Returns::find($id);
        $lims_product_return_data = ProductReturn::where('return_id', $id)->get();

        $product_id = $data['product_id'];
        $imei_number = $data['imei_number'];
        $product_batch_id = $data['product_batch_id'];
        $product_code = $data['product_code'];
        $product_variant_id = $data['product_variant_id'];
        $qty = $data['qty'];
        $sale_unit = $data['sale_unit'];
        $net_unit_price = $data['net_unit_price'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];

        foreach ($lims_product_return_data as $key => $product_return_data) {
            $old_product_id[] = $product_return_data->product_id;
            $old_product_variant_id[] = null;
            $lims_product_data = Product::find($product_return_data->product_id);
            if($lims_product_data->type == 'combo') {
                $product_list = explode(",", $lims_product_data->product_list);
                $variant_list = explode(",", $lims_product_data->variant_list);
                $qty_list = explode(",", $lims_product_data->qty_list);

                foreach ($product_list as $index=>$child_id) {
                    $child_data = Product::find($child_id);
                    if($variant_list[$index]) {
                        $child_product_variant_data = ProductVariant::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]]
                        ])->first();

                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]],
                            ['warehouse_id', $lims_return_data->warehouse_id ],
                        ])->first();

                        $child_product_variant_data->qty -= $qty[$key] * $qty_list[$index];
                        $child_product_variant_data->save();
                    }
                    else {
                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['warehouse_id', $lims_return_data->warehouse_id ],
                        ])->first();
                    }

                    $child_data->qty -= $product_return_data->qty * $qty_list[$index];
                    $child_warehouse_data->qty -= $product_return_data->qty * $qty_list[$index];

                    $child_data->save();
                    $child_warehouse_data->save();
                }
            }
            elseif($product_return_data->sale_unit_id != 0) {
                $lims_sale_unit_data = Unit::find($product_return_data->sale_unit_id);
                if ($lims_sale_unit_data->operator == '*')
                    $quantity = $product_return_data->qty * $lims_sale_unit_data->operation_value;
                elseif($lims_sale_unit_data->operator == '/')
                    $quantity = $product_return_data->qty / $lims_sale_unit_data->operation_value;

                if($product_return_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($product_return_data->product_id, $product_return_data->variant_id)->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_return_data->product_id, $product_return_data->variant_id, $lims_return_data->warehouse_id)
                    ->first();
                    $old_product_variant_id[$key] = $lims_product_variant_data->id;
                    $lims_product_variant_data->qty -= $quantity;
                    $lims_product_variant_data->save();
                }
                elseif($product_return_data->product_batch_id) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $product_return_data->product_id],
                        ['product_batch_id', $product_return_data->product_batch_id],
                        ['warehouse_id', $lims_return_data->warehouse_id]
                    ])->first();

                    $product_batch_data = ProductBatch::find($product_return_data->product_batch_id);
                    $product_batch_data->qty -= $quantity;
                    $product_batch_data->save();
                }
                else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_return_data->product_id, $lims_return_data->warehouse_id)
                    ->first();

                $lims_product_data->qty -= $quantity;
                $lims_product_warehouse_data->qty -= $quantity;
                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }
            //deduct imei number if available
            if($product_return_data->imei_number) {
                $imei_numbers = explode(",", $product_return_data->imei_number);
                $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
                foreach ($imei_numbers as $number) {
                    if (($j = array_search($number, $all_imei_numbers)) !== false) {
                        unset($all_imei_numbers[$j]);
                    }
                }
                $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
                $lims_product_warehouse_data->save();   
            }
            if($product_return_data->variant_id && !(in_array($old_product_variant_id[$key], $product_variant_id)) ){
                $product_return_data->delete();
            }
            elseif( !(in_array($old_product_id[$key], $product_id)) )
                $product_return_data->delete();
        }
        foreach ($product_id as $key => $pro_id) {
            $lims_product_data = Product::find($pro_id);
            $product_return['variant_id'] = null;
            if($sale_unit[$key] != 'n/a') {
                $lims_sale_unit_data = Unit::where('unit_code', $sale_unit[$key])->first();
                $sale_unit_id = $lims_sale_unit_data->id;
                if ($lims_sale_unit_data->operator == '*')
                    $quantity = $qty[$key] * $lims_sale_unit_data->operation_value;
                elseif($lims_sale_unit_data->operator == '/')
                    $quantity = $qty[$key] / $lims_sale_unit_data->operation_value;

                if($lims_product_data->is_variant) {
                    $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProductWithCode($pro_id, $product_code[$key])->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['warehouse_id'])
                    ->first();
                    $variant_data = Variant::find($lims_product_variant_data->variant_id);

                    $product_return['variant_id'] = $lims_product_variant_data->variant_id;
                    $lims_product_variant_data->qty += $quantity;
                    $lims_product_variant_data->save();
                }
                elseif($product_batch_id[$key]) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $pro_id],
                        ['product_batch_id', $product_batch_id[$key] ],
                        ['warehouse_id', $data['warehouse_id'] ]
                    ])->first();

                    $product_batch_data = ProductBatch::find($product_batch_id[$key]);
                    $product_batch_data->qty += $quantity;
                    $product_batch_data->save();
                }
                else {
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['warehouse_id'])
                    ->first();
                }

                $lims_product_data->qty +=  $quantity;
                $lims_product_warehouse_data->qty += $quantity;

                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }
            else {
                if($lims_product_data->product_type == 'combo'){
                    $product_list = explode(",", $lims_product_data->product_list);
                    $variant_list = explode(",", $lims_product_data->variant_list);
                    $qty_list = explode(",", $lims_product_data->qty_list);

                    foreach ($product_list as $index=>$child_id) {
                        $child_data = Product::find($child_id);
                        if($variant_list[$index]) {
                            $child_product_variant_data = ProductVariant::where([
                                ['product_id', $child_id],
                                ['variant_id', $variant_list[$index]]
                            ])->first();

                            $child_warehouse_data = ProductWarehouse::where([
                                ['product_id', $child_id],
                                ['variant_id', $variant_list[$index]],
                                ['warehouse_id', $data['warehouse_id'] ],
                            ])->first();

                            $child_product_variant_data->qty += $qty[$key] * $qty_list[$index];
                            $child_product_variant_data->save();
                        }
                        else {
                            $child_warehouse_data = ProductWarehouse::where([
                                ['product_id', $child_id],
                                ['warehouse_id', $data['warehouse_id'] ],
                            ])->first();
                        }

                        $child_data->qty += $qty[$key] * $qty_list[$index];
                        $child_warehouse_data->qty += $qty[$key] * $qty_list[$index];

                        $child_data->save();
                        $child_warehouse_data->save();
                    }
                }
                $sale_unit_id = 0;
            }

            //add imei number if available
            if($imei_number[$key]) {
                if($lims_product_warehouse_data->imei_number)
                    $lims_product_warehouse_data->imei_number .= ',' . $imei_number[$key];
                 else
                    $lims_product_warehouse_data->imei_number = $imei_number[$key];
                $lims_product_warehouse_data->save(); 
            }

            if($lims_product_data->is_variant)
                $mail_data['products'][$key] = $lims_product_data->product_name . ' [' . $variant_data->variant_name .']';
            else
                $mail_data['products'][$key] = $lims_product_data->product_name;

            if($sale_unit_id)
                $mail_data['unit'][$key] = $lims_sale_unit_data->unit_code;
            else
                $mail_data['unit'][$key] = '';

            $mail_data['qty'][$key] = $qty[$key];
            $mail_data['total'][$key] = $total[$key];

            $product_return['return_id'] = $id ;
            $product_return['product_id'] = $pro_id;
            $product_return['imei_number'] = $imei_number[$key];
            $product_return['product_batch_id'] = $product_batch_id[$key];
            $product_return['qty'] = $qty[$key];
            $product_return['sale_unit_id'] = $sale_unit_id;
            $product_return['net_unit_price'] = $net_unit_price[$key];
            $product_return['discount'] = $discount[$key];
            $product_return['tax_rate'] = $tax_rate[$key];
            $product_return['tax'] = $tax[$key];
            $product_return['total'] = $total[$key];

            if($product_return['variant_id'] && in_array($product_variant_id[$key], $old_product_variant_id)) {
                ProductReturn::where([
                    ['product_id', $pro_id],
                    ['variant_id', $product_return['variant_id']],
                    ['return_id', $id]
                ])->update($product_return);
            }
            elseif( $product_return['variant_id'] === null && (in_array($pro_id, $old_product_id)) ) {
                ProductReturn::where([
                    ['return_id', $id],
                    ['product_id', $pro_id]
                    ])->update($product_return);
            }
            else
                ProductReturn::create($product_return);
        }
        $lims_return_data->update($data);
        $lims_customer_data = Customer::find($data['customer_id']);
        //collecting male data
        $mail_data['email'] = $lims_customer_data->email;
        $mail_data['reference_no'] = $lims_return_data->reference_no;
        $mail_data['total_qty'] = $lims_return_data->total_qty;
        $mail_data['total_price'] = $lims_return_data->total_price;
        $mail_data['order_tax'] = $lims_return_data->order_tax;
        $mail_data['order_tax_rate'] = $lims_return_data->order_tax_rate;
        $mail_data['grand_total'] = $lims_return_data->grand_total;
        $message = 'Return updated successfully';
        if($mail_data['email']){
            try{
                Mail::send( 'mail.return_details', $mail_data, function( $message ) use ($mail_data)
                {
                    $message->to( $mail_data['email'] )->subject( 'Return Details' );
                });
            }
            catch(\Exception $e){
                $message = 'Return updated successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('superAdmin/return-sale')->with('message', $message);
    }
    public function returnsaledestroy($id)
    {
        $lims_return_data = Returns::find($id);
        $lims_product_return_data = ProductReturn::where('return_id', $id)->get();

        foreach ($lims_product_return_data as $key => $product_return_data) {
            $lims_product_data = Product::find($product_return_data->product_id);
            if( $lims_product_data->type == 'combo' ){
                $product_list = explode(",", $lims_product_data->product_list);
                $variant_list = explode(",", $lims_product_data->variant_list);
                $qty_list = explode(",", $lims_product_data->qty_list);

                foreach ($product_list as $index => $child_id) {
                    $child_data = Product::find($child_id);
                    if($variant_list[$index]) {
                        $child_product_variant_data = ProductVariant::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]]
                        ])->first();

                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]],
                            ['warehouse_id', $lims_return_data->warehouse_id ],
                        ])->first();

                        $child_product_variant_data->qty -= $product_return_data->qty * $qty_list[$index];
                        $child_product_variant_data->save();
                    }
                    else {
                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['warehouse_id', $lims_return_data->warehouse_id ],
                        ])->first();
                    }

                    $child_data->qty -= $product_return_data->qty * $qty_list[$index];
                    $child_warehouse_data->qty -= $product_return_data->qty * $qty_list[$index];

                    $child_data->save();
                    $child_warehouse_data->save();
                }
            }
            elseif($product_return_data->sale_unit_id != 0){
                $lims_sale_unit_data = Unit::find($product_return_data->sale_unit_id);

                if ($lims_sale_unit_data->operator == '*')
                    $quantity = $product_return_data->qty * $lims_sale_unit_data->operation_value;
                elseif($lims_sale_unit_data->operator == '/')
                    $quantity = $product_return_data->qty / $lims_sale_unit_data->operation_value;
                
                if($product_return_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($product_return_data->product_id, $product_return_data->variant_id)->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_return_data->product_id, $product_return_data->variant_id, $lims_return_data->warehouse_id)->first();
                    $lims_product_variant_data->qty -= $quantity;
                    $lims_product_variant_data->save();
                }
                elseif($product_return_data->product_batch_id) {
                    $lims_product_batch_data = ProductBatch::find($product_return_data->product_batch_id);
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_return_data->product_batch_id],
                        ['warehouse_id', $lims_return_data->warehouse_id]
                    ])->first();

                    $lims_product_batch_data->qty -= $product_return_data->qty;
                    $lims_product_batch_data->save();
                }
                else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_return_data->product_id, $lims_return_data->warehouse_id)->first();

                $lims_product_data->qty -= $quantity;
                $lims_product_warehouse_data->qty -= $quantity;
                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }
            //deduct imei number if available
            if($product_return_data->imei_number) {
                $imei_numbers = explode(",", $product_return_data->imei_number);
                $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
                foreach ($imei_numbers as $number) {
                    if (($j = array_search($number, $all_imei_numbers)) !== false) {
                        unset($all_imei_numbers[$j]);
                    }
                }
                $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
                $lims_product_warehouse_data->save();   
            }
            $product_return_data->delete();
        }
        $lims_return_data->delete();
        return redirect('superAdmin/return-sale')->with('not_permitted', 'Data deleted successfully');;
    }
    // ========================Sale===================    
    public function saleindex(Request $request)
    {
        $sales = Sale::latest()->get();
        if ($request->ajax()) {
            $sales = Sale::latest()->get();
            return Datatables::of($sales)
                ->addIndexColumn()

                ->addColumn('date', function ($row) {
                    $date = date('d-M-Y', strtotime($row->created_at));
                    return $date;
                })
                ->addColumn('image', function ($row) {
                    if (!isset($row->image)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->image) .
                            '" alt="' . $row->name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('images/' . $row->image) .
                        '" alt="' . $row->name . '" style="height: 40px;" >';
                })
                ->addColumn('biller', function ($row) {
                    $biller = $row->biller->name;
                    return $biller;
                })
                ->addColumn('coustomer', function ($row) {
                    $coustomer = $row->customer->name . '<br>' . $row->customer->phone_number . '<input type="hidden" class="deposit" value="' . ($row->customer->deposit - $row->customer->expense) . '" />' . '<input type="hidden" class="points" value="' . $row->customer->points . '" />';
                    return $coustomer;
                })
                ->addColumn('sale_status', function ($row) {
                    if ($row->sale_status == 1) {
                        $completed = '<div class="badge badge-success">' . trans('file.Completed') . '</div>';
                        return $completed;
                    } elseif ($row->sale_status == 2) {
                        $pending = '<div class="badge badge-danger">' . trans('file.Pending') . '</div>';
                        return $pending;
                    } else {
                        $draft = '<div class="badge badge-warning">' . trans('file.Draft') . '</div>';
                        return $draft;
                    }
                })
                ->addColumn('payment_status', function ($row) {
                    if ($row->payment_status == 1) {
                        $pending = '<div class="badge badge-danger">' . trans('file.Pending') . '</div>';
                        return $pending;
                    } elseif ($row->payment_status == 2) {
                        $due = '<div class="badge badge-danger">' . trans('file.Due') . '</div>';
                        return $due;
                    } elseif ($row->payment_status == 3) {
                        $draft = '<div class="badge badge-warning">' . trans('file.Partial') . '</div>';
                        return $draft;
                    } else {
                        $paid = '<div class="badge badge-success">' . trans('file.Paid') . '</div>';
                        return $paid;
                    }
                })

                ->addColumn('delevery', function ($row) {
                    $delivery_data = DB::table('deliveries')->select('status')->where('sale_id', $row->id)->first();
                    if ($delivery_data) {
                        if ($delivery_data->status == 1) {
                            $packing = '<div class="badge badge-info">' . trans('file.Packing') . '</div>';
                            return $packing;
                        } elseif ($delivery_data->status == 2) {
                            $delivering = '<div class="badge badge-info">' . trans('file.Delivering') . '</div>';
                            return $delivering;
                        } elseif ($delivery_data->status == 3) {
                            $delivered = '<div class="badge badge-info">' . trans('file.Delivered') . '</div>';
                            return $delivered;
                        }
                    } else {
                        $value = 'N/A';
                        return $value;
                    }
                })
                ->addColumn('grand_total', function ($row) {
                    $grandTotal = number_format($row->grand_total, 2);
                    return $grandTotal;
                })

                ->addColumn('returned_amount', function ($row) {
                    $returned_amount = DB::table('returns')->where('sale_id', $row->id)->sum('grand_total');
                    $returned_amount = number_format($returned_amount, 2);
                    return $returned_amount;
                })

                ->addColumn('paid_amount', function ($row) {
                    $paidAmount = number_format($row->paid_amount, 2);
                    return $paidAmount;
                })
                ->addColumn('due', function ($row) {
                    $returned_amount = DB::table('returns')->where('sale_id', $row->id)->sum('grand_total');
                    $returned_amount = number_format($returned_amount, 2);
                    $dueamount = number_format($row->grand_total - $returned_amount - $row->paid_amount, 2);
                    return $dueamount;
                })

                ->addColumn('action', function ($row) {
                    if($row->sale_status != 3){
                        $updateButton = ' <a href="'.route('superAdmin.sale.edit', $row->id).'" class="btn btn-link"><i class="dripicons-document-edit"></i> '.trans('file.edit').'</a>';
                    }else{
                        $updateButton = '<a href="'.url('superAdmin/sale/'.$row->id.'/create').'" class="btn btn-link"><i class="dripicons-document-edit"></i> '.trans('file.edit').'</a>';
                    }
                    // $updateButton = ($row->sale_status != 3) ? '<a href="' . route('superAdmin.sale.edit', $row->id) . '" class="btn btn-link"><i class="fas fa-edit"></i> ' . trans('Edit') . '</a>' : '<a href="' . route('superAdmin.sale/' . $row->id . '/create') . '" class="btn btn-link"><i class="dripicons-document-edit"></i> ' . trans('file.edit') . '</a>';

                    // Generate Invoice
                    $generateInvoice = '<a href="' . route('superAdmin.sale.invoice', $row->id) . '" class="btn btn-link"><i class="fa fa-copy"></i> ' . trans('file.Generate Invoice') . '</a>';

                    // View payment
                    $viewpayment = '<a href="javascript:void(0)" class="get-payment btn btn-link" data-id = "' . $row->id . '"><i class="fas fa-money-bill-wave-alt"></i> ' . trans('View Payment') . '</a>';

                    // Add payment
                    $addpayment = '<button type="button" class="add-payment btn btn-link" data-id = "' . $row->id . '" data-toggle="modal" data-target="#add-payment"><i class="fas fa-shopping-basket"></i> ' . trans('Add Payment') . '</button>';

                    // Add Delivery
                    $addDelevery = ' <button type="button" class="add-delivery btn btn-link" data-id = "' . $row->id . '"><i class="fa fa-truck"></i> ' . trans('file.Add Delivery') . '</button>';

                    // Delete Button
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-link  deletesale"><i class="fa fa-trash"></i> ' . trans('Delete') . '</a>';


                    return $updateButton . " " . $deleteButton . "" . $viewpayment . "" . $addpayment . "" . $generateInvoice . "" . $addDelevery;
                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }

        if ($request->input('warehouse_id'))
            $warehouse_id = $request->input('warehouse_id');
        else
            $warehouse_id = 0;

        if ($request->input('sale_status'))
            $sale_status = $request->input('sale_status');
        else
            $sale_status = 0;

        if ($request->input('payment_status'))
            $payment_status = $request->input('payment_status');
        else
            $payment_status = 0;

        if ($request->input('starting_date')) {
            $starting_date = $request->input('starting_date');
            $ending_date = $request->input('ending_date');
        } else {
            $starting_date = date("Y-m-d", strtotime(date('Y-m-d', strtotime('-1 year', strtotime(date('Y-m-d'))))));
            $ending_date = date("Y-m-d");
        }

        $lims_gift_card_list = GiftCard::where("is_active", true)->get();
        $lims_pos_setting_data = PosSetting::latest()->first();
        $lims_reward_point_setting_data = RewardPointSetting::latest()->first();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_account_list = Account::where('is_active', true)->get();
        $lims_deliveres_list = Courier::latest()->get();


        return view('superadmin.sale.index', compact('starting_date', 'ending_date', 'warehouse_id', 'sale_status', 'payment_status', 'lims_gift_card_list', 'lims_pos_setting_data', 'lims_reward_point_setting_data', 'lims_account_list', 'lims_warehouse_list', 'lims_deliveres_list'));



    }
    #salecreate
    public function salecreate()
    {
        $lims_customer_list = Customer::where('is_active', true)->get();
        if (Auth::user()->role_id > 2) {
            $lims_warehouse_list = Warehouse::where([
                ['is_active', true],
                ['id', Auth::user()->warehouse_id]
            ])->get();
            $lims_biller_list = Biller::where([
                ['is_active', true],
                ['id', Auth::user()->biller_id]
            ])->get();
        } else {
            $lims_warehouse_list = Warehouse::where('is_active', true)->get();
            $lims_biller_list = Biller::where('is_active', true)->get();
        }

        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_pos_setting_data = PosSetting::latest()->first();
        $lims_reward_point_setting_data = RewardPointSetting::latest()->first();

        return view('superadmin.sale.create', compact('lims_customer_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_pos_setting_data', 'lims_tax_list', 'lims_reward_point_setting_data'));


    }

    public function salestore(Request $request)
    {
        $data = $request->all();

  

        $qty = $data['qty'];
        $product_id = $data['product_id'];
        // $variant_id = $data['variant_id'];
        $variant = productPurchase::where('product_id', $product_id[0])->get();
        if ($variant[0]->variant_id) {
            $productwarehouse = ProductWarehouse::where(
                'product_id','=', $product_id['0'],
            )->where('variant_id', '=', $variant['0']->variant_id)->first();
        } else {
            $productwarehouse = ProductWarehouse::where(
                'product_id', '=', $product_id['0'],
            )->first();
        }
        // if($productwarehouse->qty <= $qty[0]){
        //     echo "No";
        // }else{
        //     print_r($productwarehouse->qty);
        // }

        // print_r($variant[0]->variant_id);
        // print_r($qty[0]);
        // die();


        // if(isset($request->reference_no)) {
        //     $this->validate($request, [
        //         'reference_no' => [
        //             'max:191', 'required', 'unique:sales'
        //         ],
        //     ]);
        // }
        if ($productwarehouse->qty < $qty[0]) {
            $message = "Your quantity overloaded from stock product quantity";
            return Redirect::to('superAdmin/sale')->with('message', $message);
        } else {

            $data['user_id'] = Auth::id();
            $cash_register_data = CashRegister::where([
                ['user_id', $data['user_id']],
                ['warehouse_id', $data['warehouse_id']],
                ['status', true]
            ])->first();

            if ($cash_register_data)
                $data['cash_register_id'] = $cash_register_data->id;

            if (isset($data['created_at']))
                $data['created_at'] = date("Y-m-d H:i:s", strtotime($data['created_at']));
            else
                $data['created_at'] = date("Y-m-d H:i:s");
            //return dd($data);
            if ($data['pos']) {
                if (!isset($data['reference_no']))
                    $data['reference_no'] = 'posr-' . date("Ymd") . '-' . date("his");

                $balance = $data['grand_total'] - $data['paid_amount'];
                if ($balance > 0 || $balance < 0)
                    $data['payment_status'] = 2;
                else
                    $data['payment_status'] = 4;

                if ($data['draft']) {
                    $lims_sale_data = Sale::find($data['sale_id']);
                    $lims_product_sale_data = ProductSale::where('sale_id', $data['sale_id'])->get();
                    foreach ($lims_product_sale_data as $product_sale_data) {
                        $product_sale_data->delete();
                    }
                    $lims_sale_data->delete();
                }
            } else {
                if (!isset($data['reference_no']))
                    $data['reference_no'] = 'sr-' . date("Ymd") . '-' . date("his");
            }

            // $document = $request->document;
            // if ($document) {
            //     $v = Validator::make(
            //         [
            //             'extension' => strtolower($request->document->getClientOriginalExtension()),
            //         ],
            //         [
            //             'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
            //         ]
            //     );
            //     if ($v->fails())
            //         return redirect()->back()->withErrors($v->errors());

            //     $documentName = $document->getClientOriginalName();
            //     $document->move('public/sale/documents', $documentName);
            //     $data['document'] = $documentName;
            // }
            if ($data['coupon_active']) {
                $lims_coupon_data = Coupon::find($data['coupon_id']);
                $lims_coupon_data->used += 1;
                $lims_coupon_data->save();
            }


            $lims_sale_data = Sale::create($data);
            $lims_customer_data = Customer::find($data['customer_id']);
            $lims_reward_point_setting_data = RewardPointSetting::latest()->first();
            //checking if customer gets some points or not
            if ($lims_reward_point_setting_data->is_active && $data['grand_total'] >= $lims_reward_point_setting_data->minimum_amount) {
                $point = (int) ($data['grand_total'] / $lims_reward_point_setting_data->per_point_amount);
                $lims_customer_data->points += $point;
                $lims_customer_data->save();
            }

            //collecting male data
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['reference_no'] = $lims_sale_data->reference_no;
            $mail_data['sale_status'] = $lims_sale_data->sale_status;
            $mail_data['payment_status'] = $lims_sale_data->payment_status;
            $mail_data['total_qty'] = $lims_sale_data->total_qty;
            $mail_data['total_price'] = $lims_sale_data->total_price;
            $mail_data['order_tax'] = $lims_sale_data->order_tax;
            $mail_data['order_tax_rate'] = $lims_sale_data->order_tax_rate;
            $mail_data['order_discount'] = $lims_sale_data->order_discount;
            $mail_data['shipping_cost'] = $lims_sale_data->shipping_cost;
            $mail_data['grand_total'] = $lims_sale_data->grand_total;
            $mail_data['paid_amount'] = $lims_sale_data->paid_amount;

            $product_id = $data['product_id'];
            $product_batch_id = $data['product_batch_id'];
            $imei_number = $data['imei_number'];
            $product_code = $data['product_code'];
            $qty = $data['qty'];
            $sale_unit = $data['sale_unit'];
            $net_unit_price = $data['net_unit_price'];
            $discount = $data['discount'];
            $tax_rate = $data['tax_rate'];
            $tax = $data['tax'];
            $total = $data['subtotal'];
            $product_sale = [];


            foreach ($product_id as $i => $id) {
                $lims_product_data = Product::where('id', $id)->first();
                $product_sale['variant_id'] = null;
                $product_sale['product_batch_id'] = null;
                if ($lims_product_data->type == 'combo' && $data['sale_status'] == 1) {
                    $product_list = explode(",", $lims_product_data->product_list);
                    $variant_list = explode(",", $lims_product_data->variant_list);
                    if ($lims_product_data->variant_list)
                        $variant_list = explode(",", $lims_product_data->variant_list);
                    else
                        $variant_list = [];
                    $qty_list = explode(",", $lims_product_data->qty_list);
                    $price_list = explode(",", $lims_product_data->price_list);

                    foreach ($product_list as $key => $child_id) {
                        $child_data = Product::find($child_id);
                        if (count($variant_list) && $variant_list[$key]) {
                            $child_product_variant_data = ProductVariant::where([
                                ['product_id', $child_id],
                                ['variant_id', $variant_list[$key]]
                            ])->first();

                            $child_warehouse_data = ProductWarehouse::where([
                                ['product_id', $child_id],
                                ['variant_id', $variant_list[$key]],
                                ['warehouse_id', $data['warehouse_id']],
                            ])->first();

                            $child_product_variant_data->qty -= $qty[$i] * $qty_list[$key];
                            $child_product_variant_data->save();
                        } else {
                            $child_warehouse_data = ProductWarehouse::where([
                                ['product_id', $child_id],
                                ['warehouse_id', $data['warehouse_id']],
                            ])->first();
                        }

                        $child_data->qty -= $qty[$i] * $qty_list[$key];
                        $child_warehouse_data->qty -= $qty[$i] * $qty_list[$key];

                        $child_data->save();
                        $child_warehouse_data->save();
                    }
                }

                if ($sale_unit[$i] != 'n/a') {
                    $lims_sale_unit_data = Unit::where('unit_code', $sale_unit[$i])->first();
                    $sale_unit_id = $lims_sale_unit_data->id;
                    if ($lims_product_data->is_variant) {
                        $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProductWithCode($id, $product_code[$i])->first();
                        $product_sale['variant_id'] = optional($lims_product_variant_data)->variant_id;
                    }
                    if ($lims_product_data->is_batch && $product_batch_id[$i]) {
                        $product_sale['product_batch_id'] = $product_batch_id[$i];
                    }

                    if ($data['sale_status'] == 1) {
                        if ($lims_sale_unit_data->operator == '*')
                            $quantity = $qty[$i] * $lims_sale_unit_data->operation_value;
                        elseif ($lims_sale_unit_data->operator == '/')
                            $quantity = $qty[$i] / $lims_sale_unit_data->operation_value;
                        //deduct quantity
                        $lims_product_data->qty = $lims_product_data->qty - $quantity;
                        $lims_product_data->save();
                        //deduct product variant quantity if exist
                        if ($lims_product_data->is_variant) {
                            $lims_product_variant_data->qty -= $quantity;
                            $lims_product_variant_data->save();
                            $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($id, $lims_product_variant_data->variant_id, $data['warehouse_id'])->first();
                        } elseif ($product_batch_id[$i]) {
                            $lims_product_warehouse_data = ProductWarehouse::where([
                                ['product_batch_id', $product_batch_id[$i]],
                                ['warehouse_id', $data['warehouse_id']]
                            ])->first();
                            $lims_product_batch_data = ProductBatch::find($product_batch_id[$i]);
                            //deduct product batch quantity
                            $lims_product_batch_data->qty -= $quantity;
                            $lims_product_batch_data->save();
                        } else {
                            $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($id, $data['warehouse_id'])->first();
                        }
                        //deduct quantity from warehouse
                        $lims_product_warehouse_data->qty -= $quantity;
                        $lims_product_warehouse_data->save();
                    }
                } else
                    $sale_unit_id = 0;

                if ($product_sale['variant_id']) {
                    $variant_data = Variant::select('variant_name')->find($product_sale['variant_id']);
                    $mail_data['products'][$i] = $lims_product_data->product_name . ' [' . $variant_data->variant_name . ']';
                } else
                    $mail_data['products'][$i] = $lims_product_data->product_name;
                //deduct imei number if available
                if ($imei_number[$i]) {
                    $imei_numbers = explode(",", $imei_number[$i]);
                    $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
                    foreach ($imei_numbers as $number) {
                        if (($j = array_search($number, $all_imei_numbers)) !== false) {
                            unset($all_imei_numbers[$j]);
                        }
                    }
                    $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
                    $lims_product_warehouse_data->save();
                }
                if ($lims_product_data->type == 'digital')
                    $mail_data['file'][$i] = url('/public/product/files') . '/' . $lims_product_data->file;
                else
                    $mail_data['file'][$i] = '';
                if ($sale_unit_id)
                    $mail_data['unit'][$i] = $lims_sale_unit_data->unit_code;
                else
                    $mail_data['unit'][$i] = '';

                $product_sale['sale_id'] = $lims_sale_data->id;
                $product_sale['product_id'] = $id;
                $product_sale['imei_number'] = $imei_number[$i];
                $product_sale['qty'] = $mail_data['qty'][$i] = $qty[$i];
                $product_sale['sale_unit_id'] = $sale_unit_id;
                $product_sale['net_unit_price'] = $net_unit_price[$i];
                $product_sale['discount'] = $discount[$i];
                $product_sale['tax_rate'] = $tax_rate[$i];
                $product_sale['tax'] = $tax[$i];
                $product_sale['total'] = $mail_data['total'][$i] = $total[$i];
                ProductSale::create($product_sale);
            }


            // print_r($productwarehouse->qty);

            if ($data['sale_status'] == 3){

                $message = 'Sale successfully added to draft';
            }
            else{

                $message = ' Sale created successfully';
            }
            if ($mail_data['email'] && $data['sale_status'] == 1) {
                try {
                    Mail::send('mail.sale_details', $mail_data, function ($message) use ($mail_data) {
                        $message->to($mail_data['email'])->subject('Sale Details');
                    });
                } catch (\Exception $e) {
                    $message = 'Sale created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
                }


                if ($data['payment_status'] == 3 || $data['payment_status'] == 4 || ($data['payment_status'] == 2 && $data['pos'] && $data['paid_amount'] > 0)) {

                    $lims_payment_data = new Payment();
                    $lims_payment_data->user_id = Auth::id();

                    if ($data['paid_by_id'] == 1)
                        $paying_method = 'Cash';
                    elseif ($data['paid_by_id'] == 2) {
                        $paying_method = 'Gift Card';
                    } elseif ($data['paid_by_id'] == 3)
                        $paying_method = 'Credit Card';
                    elseif ($data['paid_by_id'] == 4)
                        $paying_method = 'Cheque';
                    elseif ($data['paid_by_id'] == 5)
                        $paying_method = 'Paypal';
                    elseif ($data['paid_by_id'] == 6)
                        $paying_method = 'Deposit';
                    elseif ($data['paid_by_id'] == 7) {
                        $paying_method = 'Points';
                        $lims_payment_data->used_points = $data['used_points'];
                    }

                    if ($cash_register_data)
                        $lims_payment_data->cash_register_id = $cash_register_data->id;
                    $lims_account_data = Account::where('is_default', true)->first();
                    $lims_payment_data->account_id = $lims_account_data->id;
                    $lims_payment_data->sale_id = $lims_sale_data->id;
                    $data['payment_reference'] = 'spr-' . date("Ymd") . '-' . date("his");
                    $lims_payment_data->payment_reference = $data['payment_reference'];
                    $lims_payment_data->amount = $data['paid_amount'];
                    $lims_payment_data->change = $data['paying_amount'] - $data['paid_amount'];
                    $lims_payment_data->paying_method = $paying_method;
                    $lims_payment_data->payment_note = $data['payment_note'];
                    $lims_payment_data->save();

                    $lims_payment_data = Payment::latest()->first();
                    $data['payment_id'] = $lims_payment_data->id;
                    
                    if($paying_method == 'Credit Card'){
                        $lims_pos_setting_data = PosSetting::latest()->first();
                        Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
                        $token = $data['stripeToken'];
                        $grand_total = $data['grand_total'];

                        $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('customer_id', $data['customer_id'])->first();

                        if(!$lims_payment_with_credit_card_data) {
                            // Create a Customer:
                            $customer = \Stripe\Customer::create([
                                'source' => $token
                            ]);

                            // Charge the Customer instead of the card:
                            $charge = \Stripe\Charge::create([
                                'amount' => $grand_total * 100,
                                'currency' => 'usd',
                                'customer' => $customer->id
                            ]);
                            $data['customer_stripe_id'] = $customer->id;
                        }
                        else {
                            $customer_id = 
                            $lims_payment_with_credit_card_data->customer_stripe_id;

                            $charge = \Stripe\Charge::create([
                                'amount' => $grand_total * 100,
                                'currency' => 'usd',
                                'customer' => $customer_id, // Previously stored, then retrieved
                            ]);
                            $data['customer_stripe_id'] = $customer_id;
                        }
                        $data['charge_id'] = $charge->id;
                        PaymentWithCreditCard::create($data);
                    }
                    if ($paying_method == 'Gift Card') {
                        $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
                        $lims_gift_card_data->expense += $data['paid_amount'];
                        $lims_gift_card_data->save();
                        PaymentWithGiftCard::create($data);
                    } elseif ($paying_method == 'Cheque') {
                        PaymentWithCheque::create($data);
                    }
                    // elseif ($paying_method == 'Paypal') {
                    //     $provider = new ExpressCheckout;
                    //     $paypal_data = [];
                    //     $paypal_data['items'] = [];
                    //     foreach ($data['product_id'] as $key => $product_id) {
                    //         $lims_product_data = Product::find($product_id);
                    //         $paypal_data['items'][] = [
                    //             'name' => $lims_product_data->name,
                    //             'price' => ($data['subtotal'][$key]/$data['qty'][$key]),
                    //             'qty' => $data['qty'][$key]
                    //         ];
                    //     }
                    //     $paypal_data['items'][] = [
                    //         'name' => 'Order Tax',
                    //         'price' => $data['order_tax'],
                    //         'qty' => 1
                    //     ];
                    //     $paypal_data['items'][] = [
                    //         'name' => 'Order Discount',
                    //         'price' => $data['order_discount'] * (-1),
                    //         'qty' => 1
                    //     ];
                    //     $paypal_data['items'][] = [
                    //         'name' => 'Shipping Cost',
                    //         'price' => $data['shipping_cost'],
                    //         'qty' => 1
                    //     ];
                    //     if($data['grand_total'] != $data['paid_amount']){
                    //         $paypal_data['items'][] = [
                    //             'name' => 'Due',
                    //             'price' => ($data['grand_total'] - $data['paid_amount']) * (-1),
                    //             'qty' => 1
                    //         ];
                    //     }
                    //     //return $paypal_data;
                    //     $paypal_data['invoice_id'] = $lims_sale_data->reference_no;
                    //     $paypal_data['invoice_description'] = "Reference # {$paypal_data['invoice_id']} Invoice";
                    //     $paypal_data['return_url'] = url('/sale/paypalSuccess');
                    //     $paypal_data['cancel_url'] = url('/sale/create');

                    //     $total = 0;
                    //     foreach($paypal_data['items'] as $item) {
                    //         $total += $item['price']*$item['qty'];
                    //     }

                    //     $paypal_data['total'] = $total;
                    //     $response = $provider->setExpressCheckout($paypal_data);
                    //      // This will redirect user to PayPal
                    //     return redirect($response['paypal_link']);
                    // }
                    elseif ($paying_method == 'Deposit') {
                        $lims_customer_data->expense += $data['paid_amount'];
                        $lims_customer_data->save();
                    } elseif ($paying_method == 'Points') {
                        $lims_customer_data->points -= $data['used_points'];
                        $lims_customer_data->save();
                    }
                }
            }
        }
        if ($lims_sale_data->sale_status == '1') {
            return Redirect::to('superAdmin/sale.invoice' . '/' . $lims_sale_data->id)->with('message', $message);
        } elseif ($data['pos']) {
                return redirect('superAdmin/sale.pos')->with('message', $message);
                // return Redirect::to('superAdmin/pos')->with('message', $message);
        } else {
                return redirect('superAdmin/sale')->with('message', $message);
                // return Redirect::to('superAdmin/sale')->with('message', $message);
        }
    }
    public function showDetails($warehouse_id)
    {
        $cash_register_data = CashRegister::where([
            ['user_id', Auth::id()],
            ['warehouse_id', $warehouse_id],
            ['status', true]
        ])->first();

        $data['cash_in_hand'] = $cash_register_data->cash_in_hand;
        $data['total_sale_amount'] = Sale::where([
            ['cash_register_id', $cash_register_data->id],
            ['sale_status', 1]
        ])->sum('grand_total');
        $data['total_payment'] = Payment::where('cash_register_id', $cash_register_data->id)->sum('amount');
        $data['cash_payment'] = Payment::where([
            ['cash_register_id', $cash_register_data->id],
            ['paying_method', 'Cash']
        ])->sum('amount');
        $data['credit_card_payment'] = Payment::where([
            ['cash_register_id', $cash_register_data->id],
            ['paying_method', 'Credit Card']
        ])->sum('amount');
        $data['gift_card_payment'] = Payment::where([
            ['cash_register_id', $cash_register_data->id],
            ['paying_method', 'Gift Card']
        ])->sum('amount');
        $data['deposit_payment'] = Payment::where([
            ['cash_register_id', $cash_register_data->id],
            ['paying_method', 'Deposit']
        ])->sum('amount');
        $data['cheque_payment'] = Payment::where([
            ['cash_register_id', $cash_register_data->id],
            ['paying_method', 'Cheque']
        ])->sum('amount');
        $data['paypal_payment'] = Payment::where([
            ['cash_register_id', $cash_register_data->id],
            ['paying_method', 'Paypal']
        ])->sum('amount');
        $data['total_sale_return'] = Returns::where('cash_register_id', $cash_register_data->id)->sum('grand_total');
        $data['total_expense'] = Expense::where('cash_register_id', $cash_register_data->id)->sum('amount');
        $data['total_cash'] = $data['cash_in_hand'] + $data['total_payment'] - ($data['total_sale_return'] + $data['total_expense']);
        $data['id'] = $cash_register_data->id;
        return $data;
    }
    public function createSale($id)
    {

        $lims_biller_list = Biller::where('is_active', true)->get();
        $lims_customer_list = Customer::where('is_active', true)->get();
        $lims_customer_group_all = CustomerGroup::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_sale_data = Sale::find($id);
        $lims_product_sale_data = ProductSale::where('sale_id', $id)->get();
        $lims_product_list = Product::where([
            ['featured', 1],
            ['is_active', true]
        ])->get();
        foreach ($lims_product_list as $key => $product) {
            $images = explode(",", $product->image);
            $product->base_image = $images[0];
        }
        $product_number = count($lims_product_list);
        $lims_pos_setting_data = PosSetting::latest()->first();
        $lims_brand_list = Brand::where('status', true)->get();
        $lims_category_list = Category::where('status', true)->get();
        $lims_coupon_list = Coupon::where('is_active', true)->get();

        return view('superadmin.sale.create_sale', compact('lims_biller_list', 'lims_customer_list', 'lims_warehouse_list', 'lims_tax_list', 'lims_sale_data', 'lims_product_sale_data', 'lims_pos_setting_data', 'lims_brand_list', 'lims_category_list', 'lims_coupon_list', 'lims_product_list', 'product_number', 'lims_customer_group_all'));

    }
    public function todaySale()
    {
        $data['total_sale_amount'] = Sale::whereDate('created_at', date("Y-m-d"))->sum('grand_total');
        $data['total_payment'] = Payment::whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['cash_payment'] = Payment::where([
            ['paying_method', 'Cash']
        ])->whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['credit_card_payment'] = Payment::where([
            ['paying_method', 'Credit Card']
        ])->whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['gift_card_payment'] = Payment::where([
            ['paying_method', 'Gift Card']
        ])->whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['deposit_payment'] = Payment::where([
            ['paying_method', 'Deposit']
        ])->whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['cheque_payment'] = Payment::where([
            ['paying_method', 'Cheque']
        ])->whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['paypal_payment'] = Payment::where([
            ['paying_method', 'Paypal']
        ])->whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['total_sale_return'] = Returns::whereDate('created_at', date("Y-m-d"))->sum('grand_total');
        $data['total_expense'] = Expense::whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['total_cash'] = $data['total_payment'] - ($data['total_sale_return'] + $data['total_expense']);
        return $data;
    }
    public function todayProfit($warehouse_id)
    {
        if ($warehouse_id == 0)
            $product_sale_data = ProductSale::select(DB::raw('product_id, product_batch_id, sum(qty) as sold_qty, sum(total) as sold_amount'))->whereDate('created_at', date("Y-m-d"))->groupBy('product_id', 'product_batch_id')->get();
        else
            $product_sale_data = Sale::join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
                ->select(DB::raw('product_sales.product_id, product_sales.product_batch_id, sum(product_sales.qty) as sold_qty, sum(product_sales.total) as sold_amount'))
                ->where('sales.warehouse_id', $warehouse_id)->whereDate('sales.created_at', date("Y-m-d"))
                ->groupBy('product_sales.product_id', 'product_sales.product_batch_id')->get();

        $product_revenue = 0;
        $product_cost = 0;
        $profit = 0;
        foreach ($product_sale_data as $key => $product_sale) {
            if ($warehouse_id == 0) {
                if ($product_sale->product_batch_id)
                    $product_purchase_data = ProductPurchase::where([
                        ['product_id', $product_sale->product_id],
                        ['product_batch_id', $product_sale->product_batch_id]
                    ])->get();
                else
                    $product_purchase_data = ProductPurchase::where('product_id', $product_sale->product_id)->get();
            } else {
                if ($product_sale->product_batch_id) {
                    $product_purchase_data = Purchase::join('product_purchases', 'purchases.id', '=', 'product_purchases.purchase_id')
                        ->where([
                            ['product_purchases.product_id', $product_sale->product_id],
                            ['product_purchases.product_batch_id', $product_sale->product_batch_id],
                            ['purchases.warehouse_id', $warehouse_id]
                        ])->select('product_purchases.*')->get();
                } else
                    $product_purchase_data = Purchase::join('product_purchases', 'purchases.id', '=', 'product_purchases.purchase_id')
                        ->where([
                            ['product_purchases.product_id', $product_sale->product_id],
                            ['purchases.warehouse_id', $warehouse_id]
                        ])->select('product_purchases.*')->get();
            }

            $purchased_qty = 0;
            $purchased_amount = 0;
            $sold_qty = $product_sale->sold_qty;
            $product_revenue += $product_sale->sold_amount;
            foreach ($product_purchase_data as $key => $product_purchase) {
                $purchased_qty += $product_purchase->qty;
                $purchased_amount += $product_purchase->total;
                if ($purchased_qty >= $sold_qty) {
                    $qty_diff = $purchased_qty - $sold_qty;
                    $unit_cost = $product_purchase->total / $product_purchase->qty;
                    $purchased_amount -= ($qty_diff * $unit_cost);
                    break;
                }
            }

            $product_cost += $purchased_amount;
            $profit += $product_sale->sold_amount - $purchased_amount;
        }

        $data['product_revenue'] = $product_revenue;
        $data['product_cost'] = $product_cost;
        if ($warehouse_id == 0)
            $data['expense_amount'] = Expense::whereDate('created_at', date("Y-m-d"))->sum('amount');
        else
            $data['expense_amount'] = Expense::where('warehouse_id', $warehouse_id)->whereDate('created_at', date("Y-m-d"))->sum('amount');

        $data['profit'] = $profit - $data['expense_amount'];
        return $data;
    }
    public function salePrintLastReciept()
    {
        $sale = Sale::where('sale_status', 1)->latest()->first();
        return redirect()->route('superAdmin.sale.invoice', $sale->id);
    }
    public function sellGetProduct($id)
    {
        $lims_product_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.warehouse_id', $id],
                ['product_warehouses.qty', '>', 0]
            ])
            ->whereNull('product_warehouses.variant_id')
            ->whereNull('product_warehouses.product_batch_id')
            ->select('product_warehouses.*')
            // ->select('product_warehouses.*',  'products.is_embeded')
            ->get();

        config()->set('database.connections.mysql.strict', false);
        DB::reconnect(); //important as the existing connection if any would be in strict mode

        $lims_product_with_batch_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.warehouse_id', $id],
                ['product_warehouses.qty', '>', 0]
            ])
            ->whereNull('product_warehouses.variant_id')
            ->whereNotNull('product_warehouses.product_batch_id')
            ->select('product_warehouses.*')
            // ->select('product_warehouses.*', 'products.is_embeded')
            ->groupBy('product_warehouses.product_id')
            ->get();

        //now changing back the strict ON
        config()->set('database.connections.mysql.strict', true);
        DB::reconnect();

        $lims_product_with_variant_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.warehouse_id', $id],
                ['product_warehouses.qty', '>', 0]
            ])
            ->whereNotNull('product_warehouses.variant_id')
            ->select('product_warehouses.*')
            // ->select('product_warehouses.*', 'products.is_embeded')
            ->get();

        $product_code = [];
        $product_name = [];
        $product_qty = [];
        $product_type = [];
        $product_id = [];
        $product_list = [];
        $qty_list = [];
        $product_price = [];
        $batch_no = [];
        $product_batch_id = [];
        $expired_date = [];
        $is_embeded = [];
        //product without variant
        foreach ($lims_product_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $product_price[] = $product_warehouse->product_price;
            $lims_product_data = Product::find($product_warehouse->product_id);
            $product_code[] = $lims_product_data->product_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->product_type;
            $product_id[] = $lims_product_data->id;
            $product_list[] = $lims_product_data->product_list;
            $qty_list[] = $lims_product_data->qty_list;
            $batch_no[] = null;
            $product_batch_id[] = null;
            $expired_date[] = null;
            if ($product_warehouse->is_embeded)
                $is_embeded[] = $product_warehouse->is_embeded;
            else
                $is_embeded[] = 0;
        }
        //product with batches
        foreach ($lims_product_with_batch_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $product_price[] = $product_warehouse->product_price;
            $lims_product_data = Product::find($product_warehouse->product_id);
            $product_code[] = $lims_product_data->product_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->product_type;
            $product_id[] = $lims_product_data->id;
            $product_list[] = $lims_product_data->product_list;
            $qty_list[] = $lims_product_data->qty_list;
            $product_batch_data = ProductBatch::select('id', 'batch_no', 'expired_date')->find($product_warehouse->product_batch_id);
            $batch_no[] = $product_batch_data->batch_no;
            $product_batch_id[] = $product_batch_data->id;
            $expired_date[] = date(config('date_format'), strtotime($product_batch_data->expired_date));
            if ($product_warehouse->is_embeded)
                $is_embeded[] = $product_warehouse->is_embeded;
            else
                $is_embeded[] = 0;
        }
        //product with variant
        foreach ($lims_product_with_variant_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $lims_product_data = Product::find($product_warehouse->product_id);
            $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_warehouse->product_id, $product_warehouse->variant_id)->first();
            $product_code[] = $lims_product_variant_data->item_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->product_type;
            $product_id[] = $lims_product_data->id;
            $product_list[] = $lims_product_data->product_list;
            $qty_list[] = $lims_product_data->qty_list;
            $batch_no[] = null;
            $product_batch_id[] = null;
            $expired_date[] = null;
            if ($product_warehouse->is_embeded)
                $is_embeded[] = $product_warehouse->is_embeded;
            else
                $is_embeded[] = 0;
        }
        //retrieve product with type of digital, combo and service
        $lims_product_data = Product::whereNotIn('product_type', ['standard'])->where('is_active', true)->get();
        foreach ($lims_product_data as $product) {
            $product_qty[] = $product->qty;
            $product_code[] = $product->product_code;
            $product_name[] = $product->product_name;
            $product_type[] = $product->product_type;
            $product_id[] = $product->id;
            $product_list[] = $product->product_list;
            $qty_list[] = $product->qty_list;
            $batch_no[] = null;
            $product_batch_id[] = null;
            $expired_date[] = null;
            $is_embeded[] = 0;
        }
        $product_data = [$product_code, $product_name, $product_qty, $product_type, $product_id, $product_list, $qty_list, $product_price, $batch_no, $product_batch_id, $expired_date, $is_embeded];
        return $product_data;
    }

    public function saleGetcustomergroup($id)
    {
        $lims_customer_data = Customer::find($id);
        $lims_customer_group_data = CustomerGroup::find($lims_customer_data->customer_group_id);
        return $lims_customer_group_data->percentage;
    }
    public function saleDeliveryStore(Request $request)
    {
        $data = $request->except('file');
        $delivery = Delivery::firstOrNew(['reference_no' => $data['reference_no']]);
        $document = $request->file;
        // if ($document) {
        //     $ext = pathinfo($document->getClientOriginalName(), PATHINFO_EXTENSION);
        //     $documentName = $data['reference_no'] . '.' . $ext;
        //     $document->move('public/documents/delivery', $documentName);
        //     $delivery->file = $documentName;
        // }
        $delivery->sale_id = $data['sale_id'];
        $delivery->user_id = Auth::id();
        $delivery->courier_id = $data['courier_id'];
        $delivery->address = $data['address'];
        $delivery->delivered_by = $data['delivered_by'];
        $delivery->recieved_by = $data['recieved_by'];
        $delivery->status = $data['status'];
        $delivery->note = $data['note'];
        $delivery->save();
        $lims_sale_data = Sale::find($data['sale_id']);
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        $message = 'Delivery created successfully';
        if ($lims_customer_data->email && $data['status'] != 1) {
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['customer'] = $lims_customer_data->name;
            $mail_data['sale_reference'] = $lims_sale_data->reference_no;
            $mail_data['delivery_reference'] = $delivery->reference_no;
            $mail_data['status'] = $data['status'];
            $mail_data['address'] = $data['address'];
            $mail_data['delivered_by'] = $data['delivered_by'];
            //return $mail_data;
            try {
                Mail::send('mail.delivery_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Delivery Details');
                });
            } catch (\Exception $e) {
                $message = 'Delivery created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('superAdmin/delivery')->with('message', $message);
    }

    public function saleCashRegister(Request $request)
    {
        $data = $request->all();
        $data['status'] = true;
        $data['user_id'] = Auth::id();
        CashRegister::create($data);
        return redirect()->back()->with('message', 'Cash register created successfully');
    }

    public function salecheckAvailability($warehouse_id)
    {
        $open_register_number = CashRegister::where([
            ['user_id', Auth::id()],
            ['warehouse_id', $warehouse_id],
            ['status', true]
        ])->count();
        if ($open_register_number)
            return 'true';
        else
            return 'false';
    }
    public function getFeatured()
    {
        $data = [];
        $lims_product_list = Product::where([
            ['is_active', true],
            ['featured', true]
        ])->select('products.id', 'products.product_name', 'products.product_code', 'products.product_image', 'products.is_variant')->get();

        $index = 0;
        foreach ($lims_product_list as $product) {
            if ($product->is_variant) {
                $lims_product_data = Product::select('id')->find($product->id);
                $lims_product_variant_data = $lims_product_data->variant()->orderBy('position')->get();
                foreach ($lims_product_variant_data as $key => $variant) {
                    $data['product_name'][$index] = $product->product_name . ' [' . $variant->variant_name . ']';
                    $data['product_code'][$index] = $variant->pivot['item_code'];
                    $images = explode(",", $product->product_image);
                    $data['product_image'][$index] = $images[0];
                    $index++;
                }
            } else {
                $data['product_name'][$index] = $product->product_name;
                $data['product_code'][$index] = $product->product_code;
                $images = explode(",", $product->product_image);
                $data['product_image'][$index] = $images[0];
                $index++;
            }
        }
        return $data;
    }


    public function saleGetGiftCard()
    {
        $gift_card = GiftCard::where("is_active", true)->whereDate('expired_date', '>=', date("Y-m-d"))->get(['id', 'card_no', 'amount', 'expense']);
        return json_encode($gift_card);
    }
    public function saleGenInvoice($id)
    {

        $lims_sale_data = Sale::find($id);
        $lims_product_sale_data = ProductSale::where('sale_id', $id)->get();
        $lims_biller_data = Biller::find($lims_sale_data->biller_id);
        $lims_warehouse_data = Warehouse::find($lims_sale_data->warehouse_id);
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        $lims_payment_data = Payment::where('sale_id', $id)->get();

        // $grand_total = $grandtotal = number_format((float)$lims_sale_data->grand_total, 0, '.', '') + number_format((float)$lims_sale_data->order_tax, 2, '.', '')+number_format((float)$lims_sale_data->shipping_cost, 0, '.', '') - number_format((float)$lims_sale_data->coupon_discount, 2, '.', '') - number_format((float)$lims_sale_data->coupon_discount, 2, '.', '')- number_format((float)$lims_sale_data->order_discount, 2, '.', '');

        $numberToWords = new NumberToWords();

        if (App::getLocale() == 'ar' || App::getLocale() == 'hi' || App::getLocale() == 'vi' || App::getLocale() == 'en-gb')
            $numberTransformer = $numberToWords->getNumberTransformer('en');
        else
            $numberTransformer = $numberToWords->getNumberTransformer(App::getLocale());
        $numberInWords = $numberTransformer->toWords(round($lims_sale_data->grand_total));

        return view('superadmin.sale.invoice', compact('lims_sale_data', 'lims_product_sale_data', 'lims_biller_data', 'lims_warehouse_data', 'lims_customer_data', 'lims_payment_data', 'numberInWords'));
    }

    public function saleAddPayment(Request $request)
    {
        $data = $request->all();
        if (!$data['amount'])
            $data['amount'] = 0.00;

        $lims_sale_data = Sale::find($data['sale_id']);
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        $lims_sale_data->paid_amount += $data['amount'];
        $balance = $lims_sale_data->grand_total - $lims_sale_data->paid_amount;
        if ($balance > 0 || $balance < 0) {

            $lims_sale_data->payment_status = 2;
        } elseif ($balance == 0) {

            $lims_sale_data->payment_status = 4;
        }

        if ($data['paid_by_id'] == 1) {

            $paying_method = 'Cash';
        } elseif ($data['paid_by_id'] == 2) {

            $paying_method = 'Gift Card';
        } elseif ($data['paid_by_id'] == 3) {

            $paying_method = 'Credit Card';
        } elseif ($data['paid_by_id'] == 4) {

            $paying_method = 'Cheque';
        } elseif ($data['paid_by_id'] == 5) {

            $paying_method = 'Paypal';
        } elseif ($data['paid_by_id'] == 6) {

            $paying_method = 'Deposit';
        } elseif ($data['paid_by_id'] == 7) {

            $paying_method = 'Points';
        }


        $cash_register_data = CashRegister::where([
            ['user_id', Auth::id()],
            ['warehouse_id', $lims_sale_data->warehouse_id],
            ['status', true]
        ])->first();

        $lims_payment_data = new Payment();
        $lims_payment_data->user_id = Auth::id();
        $lims_payment_data->sale_id = $lims_sale_data->id;
        if ($cash_register_data) {
            $lims_payment_data->cash_register_id = $cash_register_data->id;
        }
        $lims_payment_data->account_id = $data['account_id'];
        $data['payment_reference'] = 'spr-' . date("Ymd") . '-' . date("his");
        $lims_payment_data->payment_reference = $data['payment_reference'];
        $lims_payment_data->amount = $data['amount'];
        $lims_payment_data->change = $data['paying_amount'] - $data['amount'];
        $lims_payment_data->paying_method = $paying_method;
        $lims_payment_data->payment_note = $data['payment_note'];
        $lims_payment_data->save();
        $lims_sale_data->save();

        $lims_payment_data = Payment::latest()->first();
        $data['payment_id'] = $lims_payment_data->id;

        if ($paying_method == 'Gift Card') {
            $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
            $lims_gift_card_data->expense += $data['amount'];
            $lims_gift_card_data->save();
            PaymentWithGiftCard::create($data);
        }
        elseif($paying_method == 'Credit Card'){
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            $token = $data['stripeToken'];
            $amount = $data['amount'];

            $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('customer_id', $lims_sale_data->customer_id)->first();

            if(!$lims_payment_with_credit_card_data) {
                // Create a Customer:
                $customer = \Stripe\Customer::create([
                    'source' => $token
                ]);

                // Charge the Customer instead of the card:
                $charge = \Stripe\Charge::create([
                    'amount' => $amount * 100,
                    'currency' => 'usd',
                    'customer' => $customer->id,
                ]);
                $data['customer_stripe_id'] = $customer->id;
            }
            else {
                $customer_id = 
                $lims_payment_with_credit_card_data->customer_stripe_id;

                $charge = \Stripe\Charge::create([
                    'amount' => $amount * 100,
                    'currency' => 'usd',
                    'customer' => $customer_id, // Previously stored, then retrieved
                ]);
                $data['customer_stripe_id'] = $customer_id;
            }
            $data['customer_id'] = $lims_sale_data->customer_id;
            $data['charge_id'] = $charge->id;
            PaymentWithCreditCard::create($data);
        }
        elseif ($paying_method == 'Cheque') {
            PaymentWithCheque::create($data);
        }
        // elseif ($paying_method == 'Paypal') {
        //     $provider = new ExpressCheckout;
        //     $paypal_data['items'] = [];
        //     $paypal_data['items'][] = [
        //         'name' => 'Paid Amount',
        //         'price' => $data['amount'],
        //         'qty' => 1
        //     ];
        //     $paypal_data['invoice_id'] = $lims_payment_data->payment_reference;
        //     $paypal_data['invoice_description'] = "Reference: {$paypal_data['invoice_id']}";
        //     $paypal_data['return_url'] = url('/sale/paypalPaymentSuccess/'.$lims_payment_data->id);
        //     $paypal_data['cancel_url'] = url('/sale');

        //     $total = 0;
        //     foreach($paypal_data['items'] as $item) {
        //         $total += $item['price']*$item['qty'];
        //     }

        //     $paypal_data['total'] = $total;
        //     $response = $provider->setExpressCheckout($paypal_data);
        //     return redirect($response['paypal_link']);
        // }
        elseif ($paying_method == 'Deposit') {
            $lims_customer_data->expense += $data['amount'];
            $lims_customer_data->save();
        } elseif ($paying_method == 'Points') {
            $lims_reward_point_setting_data = RewardPointSetting::latest()->first();
            $used_points = ceil($data['amount'] / $lims_reward_point_setting_data->per_point_amount);

            $lims_payment_data->used_points = $used_points;
            $lims_payment_data->save();

            $lims_customer_data->points -= $used_points;
            $lims_customer_data->save();
        }
        $message = 'Payment created successfully';
        if ($lims_customer_data->email) {
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['sale_reference'] = $lims_sale_data->reference_no;
            $mail_data['payment_reference'] = $lims_payment_data->payment_reference;
            $mail_data['payment_method'] = $lims_payment_data->paying_method;
            $mail_data['grand_total'] = $lims_sale_data->grand_total;
            $mail_data['paid_amount'] = $lims_payment_data->amount;
            try {
                Mail::send('superAdmin.mail.payment_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Payment Details');
                });
            } catch (\Exception $e) {
                $message = 'Payment created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }

        }
        return redirect('superAdmin/sale')->with('message', $message);

    }
    public function saleDeliveryCreate($id)
    {
        $lims_delivery_data = Delivery::where('sale_id', $id)->first();
        if ($lims_delivery_data) {
            $customer_sale = DB::table('sales')->join('customers', 'sales.customer_id', '=', 'customers.id')->where('sales.id', $id)->select('sales.reference_no', 'customers.name')->get();
            $delivery_data[] = $lims_delivery_data->reference_no;
            $delivery_data[] = $customer_sale[0]->reference_no;
            $delivery_data[] = $lims_delivery_data->status;
            $delivery_data[] = $lims_delivery_data->delivered_by;
            $delivery_data[] = $lims_delivery_data->recieved_by;
            $delivery_data[] = $customer_sale[0]->name;
            $delivery_data[] = $lims_delivery_data->address;
            $delivery_data[] = $lims_delivery_data->note;
        } else {
            $customer_sale = DB::table('sales')->join('customers', 'sales.customer_id', '=', 'customers.id')->where('sales.id', $id)->select('sales.reference_no', 'customers.name', 'customers.address', 'customers.city', 'customers.country')->get();

            $delivery_data[] = 'dr-' . date("Ymd") . '-' . date("his");
            $delivery_data[] = $customer_sale[0]->reference_no;
            $delivery_data[] = '';
            $delivery_data[] = '';
            $delivery_data[] = '';
            $delivery_data[] = $customer_sale[0]->name;
            $delivery_data[] = $customer_sale[0]->address . ' ' . $customer_sale[0]->city . ' ' . $customer_sale[0]->country;
            $delivery_data[] = '';
        }
        return $delivery_data;
    }

    public function saleedit($id)
    {

        $lims_customer_list = Customer::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_biller_list = Biller::where('is_active', true)->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_sale_data = Sale::find($id);
        $lims_product_sale_data = ProductSale::where('sale_id', $id)->get();
        return view('superadmin.sale.edit', compact('lims_customer_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_tax_list', 'lims_sale_data', 'lims_product_sale_data'));

    }

    public function saleUpdatePayment(Request $request)
    {
        $data = $request->all();
        //return $data;
        $lims_payment_data = Payment::find($data['payment_id']);
        $lims_sale_data = Sale::find($lims_payment_data->sale_id);
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        //updating sale table
        $amount_dif = $lims_payment_data->amount - $data['edit_amount'];
        $lims_sale_data->paid_amount = $lims_sale_data->paid_amount - $amount_dif;
        $balance = $lims_sale_data->grand_total - $lims_sale_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_sale_data->payment_status = 2;
        elseif ($balance == 0)
            $lims_sale_data->payment_status = 4;
        $lims_sale_data->save();

        if ($lims_payment_data->paying_method == 'Deposit') {
            $lims_customer_data->expense -= $lims_payment_data->amount;
            $lims_customer_data->save();
        } elseif ($lims_payment_data->paying_method == 'Points') {
            $lims_customer_data->points += $lims_payment_data->used_points;
            $lims_customer_data->save();
            $lims_payment_data->used_points = 0;
        }
        if($data['edit_paid_by_id'] == 1){

            $lims_payment_data->paying_method = 'Cash';
        }
        elseif ($data['edit_paid_by_id'] == 2){
            if($lims_payment_data->paying_method == 'Gift Card'){
                $lims_payment_gift_card_data = PaymentWithGiftCard::where('payment_id', $data['payment_id'])->first();

                $lims_gift_card_data = GiftCard::find($lims_payment_gift_card_data->gift_card_id);
                $lims_gift_card_data->expense -= $lims_payment_data->amount;
                $lims_gift_card_data->save();

                $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
                $lims_gift_card_data->expense += $data['edit_amount'];
                $lims_gift_card_data->save();

                $lims_payment_gift_card_data->gift_card_id = $data['gift_card_id'];
                $lims_payment_gift_card_data->save(); 
            }
            else{
                $lims_payment_data->paying_method = 'Gift Card';
                $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
                $lims_gift_card_data->expense += $data['edit_amount'];
                $lims_gift_card_data->save();
                PaymentWithGiftCard::create($data);
            }
        }
        elseif ($data['edit_paid_by_id'] == 3){
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            if($lims_payment_data->paying_method == 'Credit Card'){
                $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $lims_payment_data->id)->first();

                \Stripe\Refund::create(array(
                    "charge" => $lims_payment_with_credit_card_data->charge_id,
                ));

                $customer_id = 
                $lims_payment_with_credit_card_data->customer_stripe_id;

                $charge = \Stripe\Charge::create([
                    'amount' => $data['edit_amount'] * 100,
                    'currency' => 'usd',
                    'customer' => $customer_id
                ]);
                $lims_payment_with_credit_card_data->charge_id = $charge->id;
                $lims_payment_with_credit_card_data->save();
            }
            else{
                $token = $data['stripeToken'];
                $amount = $data['edit_amount'];
                $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('customer_id', $lims_sale_data->customer_id)->first();

                if(!$lims_payment_with_credit_card_data) {
                    $customer = \Stripe\Customer::create([
                        'source' => $token
                    ]);

                    $charge = \Stripe\Charge::create([
                        'amount' => $amount * 100,
                        'currency' => 'usd',
                        'customer' => $customer->id,
                    ]);
                    $data['customer_stripe_id'] = $customer->id;
                }
                else {
                    $customer_id = 
                    $lims_payment_with_credit_card_data->customer_stripe_id;

                    $charge = \Stripe\Charge::create([
                        'amount' => $amount * 100,
                        'currency' => 'usd',
                        'customer' => $customer_id
                    ]);
                    $data['customer_stripe_id'] = $customer_id;
                }
                $data['customer_id'] = $lims_sale_data->customer_id;
                $data['charge_id'] = $charge->id;
                PaymentWithCreditCard::create($data);
            }
            $lims_payment_data->paying_method = 'Credit Card';
        }
        elseif($data['edit_paid_by_id'] == 4){
            if($lims_payment_data->paying_method == 'Cheque'){
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $data['payment_id'])->first();
                $lims_payment_cheque_data->cheque_no = $data['edit_cheque_no'];
                $lims_payment_cheque_data->save(); 
            }
            else{
                $lims_payment_data->paying_method = 'Cheque';
                $data['cheque_no'] = $data['edit_cheque_no'];
                PaymentWithCheque::create($data);
            }
        }
        // elseif($data['edit_paid_by_id'] == 5){
        //     //updating payment data
        //     $lims_payment_data->amount = $data['edit_amount'];
        //     $lims_payment_data->paying_method = 'Paypal';
        //     $lims_payment_data->payment_note = $data['edit_payment_note'];
        //     $lims_payment_data->save();

        //     $provider = new ExpressCheckout;
        //     $paypal_data['items'] = [];
        //     $paypal_data['items'][] = [
        //         'name' => 'Paid Amount',
        //         'price' => $data['edit_amount'],
        //         'qty' => 1
        //     ];
        //     $paypal_data['invoice_id'] = $lims_payment_data->payment_reference;
        //     $paypal_data['invoice_description'] = "Reference: {$paypal_data['invoice_id']}";
        //     $paypal_data['return_url'] = url('/sale/paypalPaymentSuccess/'.$lims_payment_data->id);
        //     $paypal_data['cancel_url'] = url('/sale');

        //     $total = 0;
        //     foreach($paypal_data['items'] as $item) {
        //         $total += $item['price']*$item['qty'];
        //     }

        //     $paypal_data['total'] = $total;
        //     $response = $provider->setExpressCheckout($paypal_data);
        //     return redirect($response['paypal_link']);
        // }   
        elseif($data['edit_paid_by_id'] == 6){
            $lims_payment_data->paying_method = 'Deposit';
            $lims_customer_data->expense += $data['edit_amount'];
            $lims_customer_data->save();
        }
        elseif($data['edit_paid_by_id'] == 7) {
            $lims_payment_data->paying_method = 'Points';
            $lims_reward_point_setting_data = RewardPointSetting::latest()->first();
            $used_points = ceil($data['edit_amount'] / $lims_reward_point_setting_data->per_point_amount);
            $lims_payment_data->used_points = $used_points;
            $lims_customer_data->points -= $used_points;
            $lims_customer_data->save();
        }
        //updating payment data
        $lims_payment_data->account_id = $data['account_id'];
        $lims_payment_data->amount = $data['edit_amount'];
        $lims_payment_data->change = $data['edit_paying_amount'] - $data['edit_amount'];
        $lims_payment_data->payment_note = $data['edit_payment_note'];
        $lims_payment_data->save();
        $message = 'Payment updated successfully';
        //collecting male data
        if ($lims_customer_data->email) {
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['sale_reference'] = $lims_sale_data->reference_no;
            $mail_data['payment_reference'] = $lims_payment_data->payment_reference;
            $mail_data['payment_method'] = $lims_payment_data->paying_method;
            $mail_data['grand_total'] = $lims_sale_data->grand_total;
            $mail_data['paid_amount'] = $lims_payment_data->amount;
            try {
                Mail::send('mail.payment_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Payment Details');
                });
            } catch (\Exception $e) {
                $message = 'Payment updated successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('superAdmin/sale')->with('message', $message);
    }

    public function salesProductSale($id)
    {
        try {
            $lims_product_sale_data = ProductPurchase::where('sale_id', $id)->get();
            foreach ($lims_product_sale_data as $key => $product_sale_data) {
                $product = Product::find($product_sale_data->product_id);
                $unit = Unit::find($product_sale_data->sale_unit_id);
                if ($product_sale_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::FindExactProduct($product->id, $product_sale_data->variant_id)->select('item_code')->first();
                    $product->code = $lims_product_variant_data->item_code;
                }
                if ($product_sale_data->product_batch_id) {
                    $product_batch_data = ProductBatch::select('batch_no')->find($product_sale_data->product_batch_id);
                    $product_sale[7][$key] = $product_batch_data->batch_no;
                } else
                    $product_sale[7][$key] = 'N/A';
                $product_sale[0][$key] = $product->name . ' [' . $product->code . ']';
                if ($product_sale_data->imei_number) {
                    $product_sale[0][$key] .= '<br>IMEI or Serial Number: ' . $product_sale_data->imei_number;
                }
                $product_sale[1][$key] = $product_sale_data->qty;
                $product_sale[2][$key] = $unit->unit_code;
                $product_sale[3][$key] = $product_sale_data->tax;
                $product_sale[4][$key] = $product_sale_data->tax_rate;
                $product_sale[5][$key] = $product_sale_data->discount;
                $product_sale[6][$key] = $product_sale_data->total;
            }
            return $product_sale;
        } catch (\Exception $e) {
            /*return response()->json('errors' => [$e->getMessage());*/
            //return response()->json(['errors' => [$e->getMessage()]], 422);
            return 'Something is wrong!';
        }

    }

    public function saleupdate(Request $request, $id)
    {
        $data = $request->except('document');
        //return dd($data);
        $document = $request->document;
        // if ($document) {
        //     $v = Validator::make(
        //         [
        //             'extension' => strtolower($request->document->getClientOriginalExtension()),
        //         ],
        //         [
        //             'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
        //         ]
        //     );
        //     if ($v->fails())
        //         return redirect()->back()->withErrors($v->errors());

        //     $documentName = $document->getClientOriginalName();
        //     $document->move('public/sale/documents', $documentName);
        //     $data['document'] = $documentName;
        // }
        $balance = $data['grand_total'] - $data['paid_amount'];
        if ($balance < 0 || $balance > 0)
            $data['payment_status'] = 2;
        else
            $data['payment_status'] = 4;
        $lims_sale_data = Sale::find($id);
        $lims_product_sale_data = ProductSale::where('sale_id', $id)->get();
        $data['created_at'] = date("Y-m-d", strtotime(str_replace("/", "-", $data['created_at'])));
        $product_id = $data['product_id'];
        $imei_number = $data['imei_number'];
        $product_batch_id = $data['product_batch_id'];
        $product_code = $data['product_code'];
        $product_variant_id = $data['product_variant_id'];
        $qty = $data['qty'];
        $sale_unit = $data['sale_unit'];
        $net_unit_price = $data['net_unit_price'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];
        $old_product_id = [];
        $product_sale = [];
        foreach ($lims_product_sale_data as $key => $product_sale_data) {
            $old_product_id[] = $product_sale_data->product_id;
            $old_product_variant_id[] = null;
            $lims_product_data = Product::find($product_sale_data->product_id);

            if (($lims_sale_data->sale_status == 1) && ($lims_product_data->product_type == 'combo')) {
                $product_list = explode(",", $lims_product_data->product_list);
                $variant_list = explode(",", $lims_product_data->variant_list);
                if ($lims_product_data->variant_list)
                    $variant_list = explode(",", $lims_product_data->variant_list);
                else
                    $variant_list = [];
                $qty_list = explode(",", $lims_product_data->qty_list);

                foreach ($product_list as $index => $child_id) {
                    $child_data = Product::find($child_id);
                    if (count($variant_list) && $variant_list[$index]) {
                        $child_product_variant_data = ProductVariant::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]]
                        ])->first();

                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]],
                            ['warehouse_id', $lims_sale_data->warehouse_id],
                        ])->first();

                        $child_product_variant_data->qty += $product_sale_data->qty * $qty_list[$index];
                        $child_product_variant_data->save();
                    } else {
                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['warehouse_id', $lims_sale_data->warehouse_id],
                        ])->first();
                    }

                    $child_data->qty += $product_sale_data->qty * $qty_list[$index];
                    $child_warehouse_data->qty += $product_sale_data->qty * $qty_list[$index];

                    $child_data->save();
                    $child_warehouse_data->save();
                }
            } elseif (($lims_sale_data->sale_status == 1) && ($product_sale_data->sale_unit_id != 0)) {
                $old_product_qty = $product_sale_data->qty;
                $lims_sale_unit_data = Unit::find($product_sale_data->sale_unit_id);
                if ($lims_sale_unit_data->operator == '*')
                    $old_product_qty = $old_product_qty * $lims_sale_unit_data->operation_value;
                else
                    $old_product_qty = $old_product_qty / $lims_sale_unit_data->operation_value;
                if ($product_sale_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($product_sale_data->product_id, $product_sale_data->variant_id)->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_sale_data->product_id, $product_sale_data->variant_id, $lims_sale_data->warehouse_id)
                        ->first();
                    $old_product_variant_id[$key] = $lims_product_variant_data->id;
                    $lims_product_variant_data->qty += $old_product_qty;
                    $lims_product_variant_data->save();
                } elseif ($product_sale_data->product_batch_id) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $product_sale_data->product_id],
                        ['product_batch_id', $product_sale_data->product_batch_id],
                        ['warehouse_id', $lims_sale_data->warehouse_id]
                    ])->first();

                    $product_batch_data = ProductBatch::find($product_sale_data->product_batch_id);
                    $product_batch_data->qty += $old_product_qty;
                    $product_batch_data->save();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_sale_data->product_id, $lims_sale_data->warehouse_id)
                        ->first();
                $lims_product_data->qty += $old_product_qty;
                $lims_product_warehouse_data->qty += $old_product_qty;
                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }

            if ($product_sale_data->imei_number) {
                if ($lims_product_warehouse_data->imei_number)
                    $lims_product_warehouse_data->imei_number .= ',' . $product_sale_data->imei_number;
                else
                    $lims_product_warehouse_data->imei_number = $product_sale_data->imei_number;
                $lims_product_warehouse_data->save();
            }

            if ($product_sale_data->variant_id && !(in_array($old_product_variant_id[$key], $product_variant_id))) {
                $product_sale_data->delete();
            } elseif (!(in_array($old_product_id[$key], $product_id)))
                $product_sale_data->delete();
        }
        foreach ($product_id as $key => $pro_id) {
            $lims_product_data = Product::find($pro_id);
            $product_sale['variant_id'] = null;
            if ($lims_product_data->producnt_type == 'combo' && $data['sale_status'] == 1) {
                $product_list = explode(",", $lims_product_data->product_list);
                $variant_list = explode(",", $lims_product_data->variant_list);
                if ($lims_product_data->variant_list)
                    $variant_list = explode(",", $lims_product_data->variant_list);
                else
                    $variant_list = [];
                $qty_list = explode(",", $lims_product_data->qty_list);

                foreach ($product_list as $index => $child_id) {
                    $child_data = Product::find($child_id);
                    if (count($variant_list) && $variant_list[$index]) {
                        $child_product_variant_data = ProductVariant::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]],
                        ])->first();

                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]],
                            ['warehouse_id', $data['warehouse_id']],
                        ])->first();

                        $child_product_variant_data->qty -= $qty[$key] * $qty_list[$index];
                        $child_product_variant_data->save();
                    } else {
                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['warehouse_id', $data['warehouse_id']],
                        ])->first();
                    }


                    $child_data->qty -= $qty[$key] * $qty_list[$index];
                    $child_warehouse_data->qty -= $qty[$key] * $qty_list[$index];

                    $child_data->save();
                    $child_warehouse_data->save();
                }
            }
            $unit = explode(",", $sale_unit[$key]);
            if ($unit != 'n/a') {
                $lims_sale_unit_data = Unit::where('unit_code', $unit)->first();
                // dd($lims_sale_unit_data);
                $sale_unit_id = $lims_sale_unit_data->id;
                if ($data['sale_status'] == 1) {
                    $new_product_qty = $qty[$key];
                    if ($lims_sale_unit_data->operator == '*') {
                        $new_product_qty = $new_product_qty * $lims_sale_unit_data->operation_value;
                    } else {
                        $new_product_qty = $new_product_qty / $lims_sale_unit_data->operation_value;
                    }
                    if ($lims_product_data->is_variant) {
                        $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProductWithCode($pro_id, $product_code[$key])->first();
                        $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['warehouse_id'])
                            ->first();

                        $product_sale['variant_id'] = $lims_product_variant_data->variant_id;
                        $lims_product_variant_data->qty -= $new_product_qty;
                        $lims_product_variant_data->save();
                    } elseif ($product_batch_id[$key]) {
                        $lims_product_warehouse_data = ProductWarehouse::where([
                            ['product_id', $pro_id],
                            ['product_batch_id', $product_batch_id[$key]],
                            ['warehouse_id', $data['warehouse_id']]
                        ])->first();

                        $product_batch_data = ProductBatch::find($product_batch_id[$key]);
                        $product_batch_data->qty -= $new_product_qty;
                        $product_batch_data->save();
                    } else {
                        $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['warehouse_id'])
                            ->first();
                    }
                    $lims_product_data->qty -= $new_product_qty;
                    $lims_product_warehouse_data->qty -= $new_product_qty;
                    $lims_product_data->save();
                    $lims_product_warehouse_data->save();
                }
            } else
                $sale_unit_id = 0;

            //deduct imei number if available
            if ($imei_number[$key]) {
                $imei_numbers = explode(",", $imei_number[$key]);
                $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
                foreach ($imei_numbers as $number) {
                    if (($j = array_search($number, $all_imei_numbers)) !== false) {
                        unset($all_imei_numbers[$j]);
                    }
                }
                $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
                $lims_product_warehouse_data->save();
            }

            //collecting mail data
            if ($product_sale['variant_id']) {
                $variant_data = Variant::select('variant_name')->find($product_sale['variant_id']);
                $mail_data['products'][$key] = $lims_product_data->product_name . ' [' . $variant_data->variant_name . ']';
            } else
                $mail_data['products'][$key] = $lims_product_data->product_name;

            if ($lims_product_data->product_type == 'digital')
                $mail_data['file'][$key] = url('/public/product/files') . '/' . $lims_product_data->file;
            else
                $mail_data['file'][$key] = '';
            if ($sale_unit_id)
                $mail_data['unit'][$key] = $lims_sale_unit_data->unit_code;
            else
                $mail_data['unit'][$key] = '';

            $product_sale['sale_id'] = $id;
            $product_sale['product_id'] = $pro_id;
            $product_sale['imei_number'] = $imei_number[$key];
            $product_sale['product_batch_id'] = $product_batch_id[$key];
            $product_sale['qty'] = $mail_data['qty'][$key] = $qty[$key];
            $product_sale['sale_unit_id'] = $sale_unit_id;
            $product_sale['net_unit_price'] = $net_unit_price[$key];
            $product_sale['discount'] = $discount[$key];
            $product_sale['tax_rate'] = $tax_rate[$key];
            $product_sale['tax'] = $tax[$key];
            $product_sale['total'] = $mail_data['total'][$key] = $total[$key];

            if ($product_sale['variant_id'] && in_array($product_variant_id[$key], $old_product_variant_id)) {
                ProductSale::where([
                    ['product_id', $pro_id],
                    ['variant_id', $product_sale['variant_id']],
                    ['sale_id', $id]
                ])->update($product_sale);
            } elseif ($product_sale['variant_id'] === null && (in_array($pro_id, $old_product_id))) {
                ProductSale::where([
                    ['sale_id', $id],
                    ['product_id', $pro_id]
                ])->update($product_sale);
            } else
                ProductSale::create($product_sale);
        }
        $lims_sale_data->update($data);
        $lims_customer_data = Customer::find($data['customer_id']);
        $message = 'Sale updated successfully';
        //collecting mail data
        if ($lims_customer_data->email) {
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['reference_no'] = $lims_sale_data->reference_no;
            $mail_data['sale_status'] = $lims_sale_data->sale_status;
            $mail_data['payment_status'] = $lims_sale_data->payment_status;
            $mail_data['total_qty'] = $lims_sale_data->total_qty;
            $mail_data['total_price'] = $lims_sale_data->total_price;
            $mail_data['order_tax'] = $lims_sale_data->order_tax;
            $mail_data['order_tax_rate'] = $lims_sale_data->order_tax_rate;
            $mail_data['order_discount'] = $lims_sale_data->order_discount;
            $mail_data['shipping_cost'] = $lims_sale_data->shipping_cost;
            $mail_data['grand_total'] = $lims_sale_data->grand_total;
            $mail_data['paid_amount'] = $lims_sale_data->paid_amount;
            if ($mail_data['email']) {
                try {
                    Mail::send('mail.sale_details', $mail_data, function ($message) use ($mail_data) {
                        $message->to($mail_data['email'])->subject('Sale Details');
                    });
                } catch (\Exception $e) {
                    $message = 'Sale updated successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
                }
            }
        }

        return redirect('superAdmin/sale')->with('message', 'sale updated successfully');
    }
    public function saleProductSearch(Request $request)
    {
        $todayDate = date('Y-m-d');
        $product_code = explode("(", $request['data']);
        $product_info = explode("?", $request['data']);
        $customer_id = $product_info[1];
        if (strpos($request['data'], '|')) {
            $product_info = explode("|", $request['data']);
            $embeded_code = $product_code[0];
            $product_code[0] = substr($embeded_code, 0, 7);
            $qty = substr($embeded_code, 7, 5) / 1000;
        } else {
            $product_code[0] = rtrim($product_code[0], " ");
            $qty = $product_info[2];
        }
        $product_variant_id = null;
        $all_discount = DB::table('discount_plan_customers')
            ->join('discount_plans', 'discount_plans.id', '=', 'discount_plan_customers.discount_plan_id')
            ->join('discount_plan_discounts', 'discount_plans.id', '=', 'discount_plan_discounts.discount_plan_id')
            ->join('discounts', 'discounts.id', '=', 'discount_plan_discounts.discount_id')
            ->where([
                ['discount_plans.is_active', true],
                ['discounts.is_active', true],
                ['discount_plan_customers.customer_id', $customer_id]
            ])
            ->select('discounts.*')
            ->get();
        $lims_product_data = Product::where([
            ['product_code', $product_code[0]],
            ['is_active', true]
        ])->first();
        if (!$lims_product_data) {
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->select('products.*', 'product_variants.id as product_variant_id', 'product_variants.item_code', 'product_variants.additional_price')
                ->where([
                    ['product_variants.item_code', $product_code[0]],
                    ['products.is_active', true]
                ])->first();
            $product_variant_id = $lims_product_data->product_variant_id;
        }

        $product[] = $lims_product_data->product_name;
        if ($lims_product_data->is_variant) {
            $product[] = $lims_product_data->item_code;
            $lims_product_data->product_price += $lims_product_data->additional_price;
        } else {
            $product[] = $lims_product_data->product_code;
        }

        $no_discount = 1;
        foreach ($all_discount as $key => $discount) {
            $product_list = explode(",", $discount->product_list);
            $days = explode(",", $discount->days);

            if (($discount->applicable_for == 'All' || in_array($lims_product_data->id, $product_list)) && ($todayDate >= $discount->valid_from && $todayDate <= $discount->valid_till && in_array(date('D'), $days) && $qty >= $discount->minimum_qty && $qty <= $discount->maximum_qty)) {
                if ($discount->type == 'flat') {
                    $product[] = $lims_product_data->product_price - $discount->value;
                } elseif ($discount->type == 'percentage') {
                    $product[] = $lims_product_data->product_price - ($lims_product_data->product_price * ($discount->value / 100));
                }
                $no_discount = 0;
                break;
            } else {
                continue;
            }
        }

        if ($lims_product_data->promotion && $todayDate <= $lims_product_data->last_date && $no_discount) {
            $product[] = $lims_product_data->promotion_price;
        } elseif ($no_discount)
            $product[] = $lims_product_data->product_price;

        if ($lims_product_data->tax_id) {
            $lims_tax_data = Tax::find($lims_product_data->tax_id);
            $product[] = $lims_tax_data->rate;
            $product[] = $lims_tax_data->name;
        } else {
            $product[] = 0;
            $product[] = 'No Tax';
        }
        $product[] = $lims_product_data->tax_method;
        if ($lims_product_data->product_type == 'standard') {
            $units = Unit::where("base_unit", $lims_product_data->unit_id)
                ->orWhere('id', $lims_product_data->unit_id)
                ->get();
            $unit_code = array();
            $unit_operator = array();
            $unit_operation_value = array();
            foreach ($units as $unit) {
                if ($lims_product_data->sale_unit_id == $unit->id) {
                    array_unshift($unit_code, $unit->unit_code);
                    array_unshift($unit_operator, $unit->operator);
                    array_unshift($unit_operation_value, $unit->operation_value);
                } else {
                    $unit_code[] = $unit->unit_code;
                    $unit_operator[] = $unit->operator;
                    $unit_operation_value[] = $unit->operation_value;
                }
            }
            $product[] = implode(",", $unit_code) . ',';
            $product[] = implode(",", $unit_operator) . ',';
            $product[] = implode(",", $unit_operation_value) . ',';
        } else {
            $product[] = 'n/a' . ',';
            $product[] = 'n/a' . ',';
            $product[] = 'n/a' . ',';
        }
        $product[] = $lims_product_data->id;
        $product[] = $product_variant_id;
        $product[] = $lims_product_data->promotion;
        $product[] = $lims_product_data->is_batch;
        $product[] = $lims_product_data->is_imei;
        $product[] = $lims_product_data->is_variant;
        $product[] = $qty;
        return $product;

    }
    public function getProductByFilter($category_id, $brand_id)
    {
        $data = [];
        if (($category_id != 0) && ($brand_id != 0)) {
            $lims_product_list = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->where([
                    ['products.is_active', true],
                    ['products.category_id', $category_id],
                    ['brand_id', $brand_id]
                ])->orWhere([
                        ['categories.parent_id', $category_id],
                        ['products.is_active', true],
                        ['brand_id', $brand_id]
                    ])->select('products.product_name', 'products.product_code', 'products.product_image')->get();
        } elseif (($category_id != 0) && ($brand_id == 0)) {
            $lims_product_list = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->where([
                    ['products.is_active', true],
                    ['products.category_id', $category_id],
                ])->orWhere([
                        ['categories.parent_id', $category_id],
                        ['products.is_active', true]
                    ])->select('products.id', 'products.product_name', 'products.product_code', 'products.product_image', 'products.is_variant')->get();
        } elseif (($category_id == 0) && ($brand_id != 0)) {
            $lims_product_list = Product::where([
                ['brand_id', $brand_id],
                ['is_active', true]
            ])
                ->select('products.id', 'products.product_name', 'products.product_code', 'products.product_image', 'products.is_variant')
                ->get();
        } else
            $lims_product_list = Product::where('is_active', true)->get();

        $index = 0;
        foreach ($lims_product_list as $product) {
            if ($product->is_variant) {
                $lims_product_data = Product::select('id')->find($product->id);
                $lims_product_variant_data = $lims_product_data->variant()->orderBy('position')->get();
                foreach ($lims_product_variant_data as $key => $variant) {
                    $data['product_name'][$index] = $product->product_name . ' [' . $variant->variant_name . ']';
                    $data['product_code'][$index] = $variant->pivot['item_code'];
                    $images = explode(",", $product->product_image);
                    $data['product_image'][$index] = $images[0];
                    $index++;
                }
            } else {
                $data['product_name'][$index] = $product->product_name;
                $data['product_code'][$index] = $product->product_code;
                $images = explode(",", $product->product_image);
                $data['product_image'][$index] = $images[0];
                $index++;
            }
        }
        return $data;
    }

    public function saleCheckBatchAvailability($product_id, $batch_no, $warehouse_id)
    {
        $product_batch_data = ProductBatch::where([
            ['product_id', $product_id],
            ['batch_no', $batch_no]
        ])->first();
        if ($product_batch_data) {
            $product_warehouse_data = ProductWarehouse::select('qty')
                ->where([
                    ['product_batch_id', $product_batch_data->id],
                    ['warehouse_id', $warehouse_id]
                ])->first();
            if ($product_warehouse_data) {
                $data['qty'] = $product_warehouse_data->qty;
                $data['product_batch_id'] = $product_batch_data->id;
                $data['expired_date'] = date(config('date_format'), strtotime($product_batch_data->expired_date));
                $data['message'] = 'ok';
            } else {
                $data['qty'] = 0;
                $data['message'] = 'This Batch does not exist in the selected warehouse!';
            }
        } else {
            $data['message'] = 'Wrong Batch Number!';
        }
        return $data;
    }
    public function saleCheckDiscount(Request $request)
    {
        $qty = $request->input('qty');
        $customer_id = $request->input('customer_id');
        $lims_product_data = Product::select('id', 'price', 'promotion', 'promotion_price', 'last_date')->find($request->input('product_id'));
        $todayDate = date('Y-m-d');
        $all_discount = DB::table('discount_plan_customers')
            ->join('discount_plans', 'discount_plans.id', '=', 'discount_plan_customers.discount_plan_id')
            ->join('discount_plan_discounts', 'discount_plans.id', '=', 'discount_plan_discounts.discount_plan_id')
            ->join('discounts', 'discounts.id', '=', 'discount_plan_discounts.discount_id')
            ->where([
                ['discount_plans.is_active', true],
                ['discounts.is_active', true],
                ['discount_plan_customers.customer_id', $customer_id]
            ])
            ->select('discounts.*')
            ->get();
        $no_discount = 1;
        foreach ($all_discount as $key => $discount) {
            $product_list = explode(",", $discount->product_list);
            $days = explode(",", $discount->days);

            if (($discount->applicable_for == 'All' || in_array($lims_product_data->id, $product_list)) && ($todayDate >= $discount->valid_from && $todayDate <= $discount->valid_till && in_array(date('D'), $days) && $qty >= $discount->minimum_qty && $qty <= $discount->maximum_qty)) {
                if ($discount->type == 'flat') {
                    $price = $lims_product_data->price - $discount->value;
                } elseif ($discount->type == 'percentage') {
                    $price = $lims_product_data->price - ($lims_product_data->price * ($discount->value / 100));
                }
                $no_discount = 0;
                break;
            } else {
                continue;
            }
        }

        if ($lims_product_data->promotion && $todayDate <= $lims_product_data->last_date && $no_discount) {
            $price = $lims_product_data->promotion_price;
        } elseif ($no_discount)
            $price = $lims_product_data->price;

        $data = [$price, $lims_product_data->promotion];
        return $data;
    }
    public function saleGetPayment($id)
    {
        $lims_payment_list = Payment::where('sale_id', $id)->get();
        $date = [];
        $payment_reference = [];
        $paid_amount = [];
        $paying_method = [];
        $payment_id = [];
        $payment_note = [];
        $gift_card_id = [];
        $cheque_no = [];
        $change = [];
        $paying_amount = [];
        $account_name = [];
        $account_id = [];

        foreach ($lims_payment_list as $payment) {
            $date[] = date(config('date_format'), strtotime($payment->created_at->toDateString())) . ' ' . $payment->created_at->toTimeString();
            $payment_reference[] = $payment->payment_reference;
            $paid_amount[] = $payment->amount;
            $change[] = $payment->change;
            $paying_method[] = $payment->paying_method;
            $paying_amount[] = $payment->amount + $payment->change;
            if ($payment->paying_method == 'Gift Card') {
                $lims_payment_gift_card_data = PaymentWithGiftCard::where('payment_id', $payment->id)->first();
                $gift_card_id[] = $lims_payment_gift_card_data->gift_card_id;
            } elseif ($payment->paying_method == 'Cheque') {
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $payment->id)->first();
                $cheque_no[] = $lims_payment_cheque_data->cheque_no;
            } else {
                $cheque_no[] = $gift_card_id[] = null;
            }
            $payment_id[] = $payment->id;
            $payment_note[] = $payment->payment_note;
            $lims_account_data = Account::find($payment->account_id);
            $account_name[] = $lims_account_data->name;
            $account_id[] = $lims_account_data->id;
        }
        $payments[] = $date;
        $payments[] = $payment_reference;
        $payments[] = $paid_amount;
        $payments[] = $paying_method;
        $payments[] = $payment_id;
        $payments[] = $payment_note;
        $payments[] = $cheque_no;
        $payments[] = $gift_card_id;
        $payments[] = $change;
        $payments[] = $paying_amount;
        $payments[] = $account_name;
        $payments[] = $account_id;
        return $payments;
    }

    public function saleDeletePayment(Request $request)
    {
        $lims_payment_data = Payment::find($request['id']);
        $lims_sale_data = Sale::where('id', $lims_payment_data->sale_id)->first();
        $lims_sale_data->paid_amount -= $lims_payment_data->amount;
        $balance = $lims_sale_data->grand_total - $lims_sale_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_sale_data->payment_status = 1;
        elseif ($balance == 0)
            $lims_sale_data->payment_status = 2;
        $lims_sale_data->save();

        // if($lims_payment_data->paying_method == 'Credit Card'){
        //     $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $request['id'])->first();
        //     $lims_pos_setting_data = PosSetting::latest()->first();
        //     \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
        //     \Stripe\Refund::create(array(
        //       "charge" => $lims_payment_with_credit_card_data->charge_id,
        //     ));

        //     $lims_payment_with_credit_card_data->delete();
        // }
        // elseif ($lims_payment_data->paying_method == 'Cheque') {
        //     $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $request['id'])->first();
        //     $lims_payment_cheque_data->delete();
        // }
        $lims_payment_data->delete();
        return redirect('superAdmin/sale')->with('not_permitted', 'Payment deleted successfully');
    }

    public function saleSendMail(Request $request)
    {
        $data = $request->all();
        $lims_sale_data = Sale::find($data['sale_id']);
        $lims_product_sale_data = ProductSale::where('sale_id', $data['sale_id'])->get();
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        if ($lims_customer_data->email) {
            //collecting male data
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['reference_no'] = $lims_sale_data->reference_no;
            $mail_data['sale_status'] = $lims_sale_data->sale_status;
            $mail_data['payment_status'] = $lims_sale_data->payment_status;
            $mail_data['total_qty'] = $lims_sale_data->total_qty;
            $mail_data['total_price'] = $lims_sale_data->total_price;
            $mail_data['order_tax'] = $lims_sale_data->order_tax;
            $mail_data['order_tax_rate'] = $lims_sale_data->order_tax_rate;
            $mail_data['order_discount'] = $lims_sale_data->order_discount;
            $mail_data['shipping_cost'] = $lims_sale_data->shipping_cost;
            $mail_data['grand_total'] = $lims_sale_data->grand_total;
            $mail_data['paid_amount'] = $lims_sale_data->paid_amount;

            foreach ($lims_product_sale_data as $key => $product_sale_data) {
                $lims_product_data = Product::find($product_sale_data->product_id);
                if ($product_sale_data->variant_id) {
                    $variant_data = Variant::select('name')->find($product_sale_data->variant_id);
                    $mail_data['products'][$key] = $lims_product_data->name . ' [' . $variant_data->name . ']';
                } else
                    $mail_data['products'][$key] = $lims_product_data->name;
                if ($lims_product_data->type == 'digital')
                    $mail_data['file'][$key] = url('/public/product/files') . '/' . $lims_product_data->file;
                else
                    $mail_data['file'][$key] = '';
                if ($product_sale_data->sale_unit_id) {
                    $lims_unit_data = Unit::find($product_sale_data->sale_unit_id);
                    $mail_data['unit'][$key] = $lims_unit_data->unit_code;
                } else
                    $mail_data['unit'][$key] = '';

                $mail_data['qty'][$key] = $product_sale_data->qty;
                $mail_data['total'][$key] = $product_sale_data->qty;
            }

            try {
                Mail::send('mail.sale_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Sale Details');
                });
                $message = 'Mail sent successfully';
            } catch (\Exception $e) {
                $message = 'Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        } else
            $message = 'Customer doesnt have email!';

        return redirect()->back()->with('message', $message);
    }

    // public function saleDeletePayment(Request $request)
    // {
    //     $lims_payment_data = Payment::find($request['id']);
    //     $lims_sale_data = Sale::where('id', $lims_payment_data->sale_id)->first();
    //     $lims_sale_data->paid_amount -= $lims_payment_data->amount;
    //     $balance = $lims_sale_data->grand_total - $lims_sale_data->paid_amount;
    //     if($balance > 0 || $balance < 0)
    //         $lims_sale_data->payment_status = 1;
    //     elseif ($balance == 0)
    //         $lims_sale_data->payment_status = 2;
    //     $lims_sale_data->save();

    //     // if($lims_payment_data->paying_method == 'Credit Card'){
    //     //     $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $request['id'])->first();
    //     //     $lims_pos_setting_data = PosSetting::latest()->first();
    //     //     \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
    //     //     \Stripe\Refund::create(array(
    //     //       "charge" => $lims_payment_with_credit_card_data->charge_id,
    //     //     ));

    //     //     $lims_payment_with_credit_card_data->delete();
    //     // }
    //     // elseif ($lims_payment_data->paying_method == 'Cheque') {
    //     //     $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $request['id'])->first();
    //     //     $lims_payment_cheque_data->delete();
    //     // }
    //     $lims_payment_data->delete();
    //     return redirect('superAdmin/sale')->with('not_permitted', 'Payment deleted successfully');
    // }

    public function salePos()
    {
        $lims_customer_list = Customer::where('is_active', true)->get();
        $lims_customer_group_all = CustomerGroup::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_biller_list = Biller::where('is_active', true)->get();
        $lims_reward_point_setting_data = RewardPointSetting::latest()->first();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_product_list = Product::select('id', 'product_name', 'product_code', 'product_image')->ActiveFeatured()->whereNull('is_variant')->get();
        foreach ($lims_product_list as $key => $product) {
            $images = explode(",", $product->image);
            $product->base_image = $images[0];
        }
        $lims_product_list_with_variant = Product::select('id', 'product_name', 'product_code', 'product_image')->ActiveFeatured()->whereNotNull('is_variant')->get();

        foreach ($lims_product_list_with_variant as $product) {
            $images = explode(",", $product->image);
            $product->base_image = $images[0];
            $lims_product_variant_data = $product->variant()->orderBy('position')->get();
            $main_name = $product->name;
            $temp_arr = [];
            foreach ($lims_product_variant_data as $key => $variant) {
                $product->name = $main_name . ' [' . $variant->name . ']';
                $product->code = $variant->pivot['item_code'];
                $lims_product_list[] = clone ($product);
            }
        }

        $product_number = count($lims_product_list);
        $lims_pos_setting_data = PosSetting::latest()->first();
        $lims_brand_list = Brand::where('status', true)->get();
        $lims_category_list = Category::where('status', true)->get();

        if (Auth::user()->role_id > 2 && config('staff_access') == 'own') {
            $recent_sale = Sale::where([
                ['sale_status', 1],
                ['user_id', Auth::id()]
            ])->orderBy('id', 'desc')->take(10)->get();
            $recent_draft = Sale::where([
                ['sale_status', 3],
                ['user_id', Auth::id()]
            ])->orderBy('id', 'desc')->take(10)->get();
        } else {
            $recent_sale = Sale::where('sale_status', 1)->orderBy('id', 'desc')->take(10)->get();
            $recent_draft = Sale::where('sale_status', 3)->orderBy('id', 'desc')->take(10)->get();
        }
        $lims_coupon_list = Coupon::where('is_active', true)->get();
        $flag = 0;

        return view('superadmin.sale.pos', compact('lims_customer_list', 'lims_customer_group_all', 'lims_warehouse_list', 'lims_reward_point_setting_data', 'lims_product_list', 'product_number', 'lims_tax_list', 'lims_biller_list', 'lims_pos_setting_data', 'lims_brand_list', 'lims_category_list', 'recent_sale', 'recent_draft', 'lims_coupon_list', 'flag'));

    }

    public function posSetting()
    {

        $lims_customer_list = Customer::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_biller_list = Biller::where('is_active', true)->get();
        $lims_pos_setting_data = PosSetting::latest()->first();

        return view('superadmin.setting.pos_setting', compact('lims_customer_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_pos_setting_data'));
    }

    public function posSettingStore(Request $request)
    {
        $data = $request->all();
        // if(!env('USER_VERIFIED'))
        //     return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');

        // //writting paypal info in .env file
        // $path = '.env';
        // $searchArray = array('PAYPAL_LIVE_API_USERNAME='.env('PAYPAL_LIVE_API_USERNAME'), 'PAYPAL_LIVE_API_PASSWORD='.env('PAYPAL_LIVE_API_PASSWORD'), 'PAYPAL_LIVE_API_SECRET='.env('PAYPAL_LIVE_API_SECRET') );

        // $replaceArray = array('PAYPAL_LIVE_API_USERNAME='.$data['paypal_username'], 'PAYPAL_LIVE_API_PASSWORD='.$data['paypal_password'], 'PAYPAL_LIVE_API_SECRET='.$data['paypal_signature'] );

        // file_put_contents($path, str_replace($searchArray, $replaceArray, file_get_contents($path)));

        $pos_setting = PosSetting::firstOrNew(['id' => 1]);
        $pos_setting->id = 1;
        $pos_setting->customer_id = $data['customer_id'];
        $pos_setting->warehouse_id = $data['warehouse_id'];
        $pos_setting->biller_id = $data['biller_id'];
        $pos_setting->product_number = $data['product_number'];
        $pos_setting->stripe_public_key = $data['stripe_public_key'];
        $pos_setting->stripe_secret_key = $data['stripe_secret_key'];
        if (!isset($data['keybord_active']))
            $pos_setting->keybord_active = false;
        else
            $pos_setting->keybord_active = true;
        $pos_setting->save();
        return redirect()->back()->with('message', 'POS setting updated successfully');
    }
    public function saledestroy($id)
    {
        $url = url()->previous();
        $lims_sale_data = Sale::find($id);
        $lims_product_sale_data = ProductSale::where('sale_id', $id)->get();
        $lims_delivery_data = Delivery::where('sale_id', $id)->first();
        if ($lims_sale_data->sale_status == 3)
            $message = 'Draft deleted successfully';
        else
            $message = 'Sale deleted successfully';

        foreach ($lims_product_sale_data as $product_sale) {
            $lims_product_data = Product::find($product_sale->product_id);
            //adjust product quantity
            if (($lims_sale_data->sale_status == 1) && ($lims_product_data->type == 'combo')) {
                $product_list = explode(",", $lims_product_data->product_list);
                $variant_list = explode(",", $lims_product_data->variant_list);
                $qty_list = explode(",", $lims_product_data->qty_list);
                if ($lims_product_data->variant_list)
                    $variant_list = explode(",", $lims_product_data->variant_list);
                else
                    $variant_list = [];
                foreach ($product_list as $index => $child_id) {
                    $child_data = Product::find($child_id);
                    if (count($variant_list) && $variant_list[$index]) {
                        $child_product_variant_data = ProductVariant::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]]
                        ])->first();

                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]],
                            ['warehouse_id', $lims_sale_data->warehouse_id],
                        ])->first();

                        $child_product_variant_data->qty += $product_sale->qty * $qty_list[$index];
                        $child_product_variant_data->save();
                    } else {
                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['warehouse_id', $lims_sale_data->warehouse_id],
                        ])->first();
                    }

                    $child_data->qty += $product_sale->qty * $qty_list[$index];
                    $child_warehouse_data->qty += $product_sale->qty * $qty_list[$index];

                    $child_data->save();
                    $child_warehouse_data->save();
                }
            } elseif (($lims_sale_data->sale_status == 1) && ($product_sale->sale_unit_id != 0)) {
                $lims_sale_unit_data = Unit::find($product_sale->sale_unit_id);
                if ($lims_sale_unit_data->operator == '*')
                    $product_sale->qty = $product_sale->qty * $lims_sale_unit_data->operation_value;
                else
                    $product_sale->qty = $product_sale->qty / $lims_sale_unit_data->operation_value;
                if ($product_sale->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($lims_product_data->id, $product_sale->variant_id)->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($lims_product_data->id, $product_sale->variant_id, $lims_sale_data->warehouse_id)->first();
                    $lims_product_variant_data->qty += $product_sale->qty;
                    $lims_product_variant_data->save();
                } elseif ($product_sale->product_batch_id) {
                    $lims_product_batch_data = ProductBatch::find($product_sale->product_batch_id);
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_sale->product_batch_id],
                        ['warehouse_id', $lims_sale_data->warehouse_id]
                    ])->first();

                    $lims_product_batch_data->qty -= $product_sale->qty;
                    $lims_product_batch_data->save();
                } else {
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($lims_product_data->id, $lims_sale_data->warehouse_id)->first();
                }

                $lims_product_data->qty += $product_sale->qty;
                $lims_product_warehouse_data->qty += $product_sale->qty;
                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }
            if ($product_sale->imei_number) {
                if ($lims_product_warehouse_data->imei_number)
                    $lims_product_warehouse_data->imei_number .= ',' . $product_sale->imei_number;
                else
                    $lims_product_warehouse_data->imei_number = $product_sale->imei_number;
                $lims_product_warehouse_data->save();
            }
            $product_sale->delete();
        }

        $lims_payment_data = Payment::where('sale_id', $id)->get();
        foreach ($lims_payment_data as $payment) {
            if ($payment->paying_method == 'Gift Card') {
                $lims_payment_with_gift_card_data = PaymentWithGiftCard::where('payment_id', $payment->id)->first();
                $lims_gift_card_data = GiftCard::find($lims_payment_with_gift_card_data->gift_card_id);
                $lims_gift_card_data->expense -= $payment->amount;
                $lims_gift_card_data->save();
                $lims_payment_with_gift_card_data->delete();
            } elseif ($payment->paying_method == 'Cheque') {
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $payment->id)->first();
                $lims_payment_cheque_data->delete();
            }
            // elseif($payment->paying_method == 'Credit Card'){
            //     $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $payment->id)->first();
            //     $lims_payment_with_credit_card_data->delete();
            // }
            // elseif($payment->paying_method == 'Paypal'){
            //     $lims_payment_paypal_data = PaymentWithPaypal::where('payment_id', $payment->id)->first();
            //     if($lims_payment_paypal_data)
            //         $lims_payment_paypal_data->delete();
            // }
            elseif ($payment->paying_method == 'Deposit') {
                $lims_customer_data = Customer::find($lims_sale_data->customer_id);
                $lims_customer_data->expense -= $payment->amount;
                $lims_customer_data->save();
            }
            $payment->delete();
        }
        if ($lims_delivery_data)
            $lims_delivery_data->delete();
        if ($lims_sale_data->coupon_id) {
            $lims_coupon_data = Coupon::find($lims_sale_data->coupon_id);
            $lims_coupon_data->used -= 1;
            $lims_coupon_data->save();
        }
        $lims_sale_data->delete();
        return response()->json(['status' => "success"]);



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
        if (isset($data['is_active']))
            $data['is_active'] = true;
        else
            $data['is_active'] = false;
        RewardPointSetting::latest()->first()->update($data);
        return redirect()->back()->with('message', 'Reward point setting updated successfully');
    }


    // ======================== Delivery===================    
    public function deliveryindex(Request $request)
    {

        $lims_delivery_all = Delivery::latest()->get();
        $couriarName = DB::table('couriers')->get();
        if ($request->ajax()) {
            $deliverys = Delivery::latest()->get();

            return Datatables::of($deliverys)
                ->addIndexColumn()

                ->addColumn('sale_ref', function ($row) {
                    $sale_ref = optional($row->sale)->reference_no;
                    return $sale_ref;
                })
                ->addColumn('coustomer', function ($row) {
                    $customer_sale = DB::table('sales')
                        ->join('customers', 'sales.customer_id', '=', 'customers.id')
                        ->where('sales.id', $row->sale_id)
                        ->select('sales.reference_no', 'customers.name', 'customers.phone_number', 'customers.city', 'sales.grand_total')
                        ->get();
                    foreach ($customer_sale as $customer) {
                        return $customer->name . '<br>' . $customer->phone_number;
                    }
                })
                ->addColumn('couriar', function ($row) {
                    $couriars = DB::table('deliveries')
                        ->join('couriers', 'couriers.id', '=', 'deliveries.courier_id')
                        ->where('couriers.id', '=', $row->courier_id)
                        ->select('couriers.name')
                        ->get();
                    foreach ($couriars as $couriar) {
                        return $couriar->name;
                    }
                })
                ->addColumn('product', function ($row) {
                    $product_names = DB::table('sales')
                        ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
                        ->join('products', 'products.id', '=', 'product_sales.product_id')
                        ->where('sales.id', $row->sale_id)
                        ->pluck('products.product_name')
                        ->toArray();
                    $product = implode(',', $product_names);
                    return $product;
                })
                ->addColumn('grand_total', function ($row) {
                    $customer_sales = DB::table('sales')
                        ->join('customers', 'sales.customer_id', '=', 'customers.id')
                        ->where('sales.id', $row->sale_id)
                        ->select('sales.reference_no', 'customers.name', 'customers.phone_number', 'customers.city', 'sales.grand_total')
                        ->get();
                    foreach ($customer_sales as $customer_sale) {
                        $grandTotal = number_format($customer_sale->grand_total, 2);
                        return $grandTotal;
                    }
                })
                ->addColumn('status', function ($row) {
                    if ($row->status == 1) {
                        $status = trans('Packing');
                        return $status;
                    } elseif ($row->status == 2) {
                        $status = trans('Delivering');
                        return $status;
                    } else {
                        $status = trans('Delivered');
                        return $status;
                    }
                })

                ->addColumn('action', function ($row) {
                    $customer = '';
                    $grandTotal = '';
                    $customerphone = '';
                    $couriarId = '';

                    $product_names = DB::table('sales')
                        ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
                        ->join('products', 'products.id', '=', 'product_sales.product_id')
                        ->where('sales.id', $row->sale_id)
                        ->pluck('products.product_name')
                        ->toArray();
                    $product = implode(',', $product_names);
                    $customer_sales = DB::table('sales')
                        ->join('customers', 'sales.customer_id', '=', 'customers.id')
                        ->where('sales.id', $row->sale_id)
                        ->select('sales.reference_no', 'customers.name', 'customers.phone_number', 'customers.city', 'sales.grand_total')
                        ->get();
                    foreach ($customer_sales as $customer_sale) {
                        $customer = optional($customer_sale)->name;
                        $grandTotal = optional($customer_sale)->grand_total;
                        $customerphone = optional($customer_sale)->phone_number;
                    }
                    $couriars = DB::table('deliveries')
                        ->join('couriers', 'couriers.id', '=', 'deliveries.courier_id')
                        ->where('deliveries.id', '=', $row->courier_id)
                        ->select('couriers.name')
                        ->get();
                    foreach ($couriars as $couriar) {
                        $couriarId = $couriar->id;
                    }

                    $username = DB::table('users')->find($row->user_id);
                    // $barcode = DNS2D::getBarcodePNG($row->reference_no, 'QRCODE');
                    // Update Button   
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                                data-toggle="modal"
                                data-target="#ajaxModelexa"
                                data-id="' . $row->id . '"                        
                                data-reference_no="' . $row->reference_no . '"  
                                data-sale_reference_no="' . optional($row->sale)->reference_no . '"   
                                data-product_name="' . $product . '"  
                                data-customer="' . $customer . '"   
                                data-couriar="' . $couriarId . '"   
                                data-grand_total="' . $grandTotal . '"   
                                data-address="' . $row->address . '"   
                                data-delivered_by="' . $row->delivered_by . '"   
                                data-recieved_by="' . $row->recieved_by . '"   
                                data-product_name="' . $product . '"    
                                data-note="' . $row->note . '" 
                                data-status="' . $row->status . '"  
                    
                                data-original-title="Edit" class="edit btn btn-primary btn-sm  editdelivery "> <i class="fas fa-edit"></i></a>';

                    // Print button
    
                    $printButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                                    data-toggle="modal"
                                    data-target="#delivery-details"
                                    data-id="' . $row->id . '" 
                                    data-date="' . date("Y-m-d", strtotime($row->created_at->toDateString())) . '" 
                                    data-reference_no="' . $row->reference_no . '"  
                                    data-sale_reference_no="' . optional($row->sale)->reference_no . '"   
                                    data-product_name="' . $product . '"  
                                    data-customer="' . $customer . '" 
                                    data-phone="' . $customerphone . '"    
                                    data-address="' . $row->address . '"   
                                    data-grand_total="' . $grandTotal . '" 
                                    data-address="' . $row->address . '"     
                                    data-product_name="' . $product . '"  
                                    data-user_name="' . $username->name . '"  
                                    data-status="' . $row->status . '" 
                                    data-note="' . $row->note . '"  
                                

                            
                                    data-original-title="Edit" class="edit btn btn-success btn-sm  delivery-link "> <i class="fas fa-file-invoice"></i> </a>';

                    // Delete Button        
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletedelivery"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton . "" . $printButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }

        return view('superadmin.delivery.index', compact('lims_delivery_all', 'couriarName'));

    }
    public function deliveryedit($id)
    {
        $lims_delivery_data = Delivery::find($id);
        $customer_sale = DB::table('sales')->join('customers', 'sales.customer_id', '=', 'customers.id')->where('sales.id', $lims_delivery_data->sale_id)->select('sales.reference_no', 'customers.name')->get();
        $delivery_data[] = $lims_delivery_data->reference_no;
        $delivery_data[] = $customer_sale[0]->reference_no;
        $delivery_data[] = $lims_delivery_data->status;
        $delivery_data[] = $lims_delivery_data->delivered_by;
        $delivery_data[] = $lims_delivery_data->recieved_by;
        $delivery_data[] = $customer_sale[0]->name;
        $delivery_data[] = $lims_delivery_data->address;
        $delivery_data[] = $lims_delivery_data->note;
        return $delivery_data;
    }
    public function deliveryupdate(Request $request)
    {
        // dd($request->all());
        $input = $request->except('reference_no');
        // return $input['id'];
        $lims_delivery_data = Delivery::find($input['id']);
        // $document = $request->file;
        // if ($document) {
        //     $ext = pathinfo($document->getClientOriginalName(), PATHINFO_EXTENSION);
        //     $documentName = $input['reference_no'] . '.' . $ext;
        //     $document->move('public/documents/delivery', $documentName);
        //     $input['file'] = $documentName;
        // }
        $lims_delivery_data->update($input);
        $lims_sale_data = Sale::find($lims_delivery_data->sale_id);
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        $message = 'Delivery updated successfully';

        if ($lims_customer_data->email && $input['status'] != 1) {
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['customer'] = $lims_customer_data->name;
            $mail_data['sale_reference'] = $lims_sale_data->reference_no;
            $mail_data['delivery_reference'] = $lims_delivery_data->reference_no;
            $mail_data['status'] = $input['status'];
            $mail_data['address'] = $input['address'];
            $mail_data['delivered_by'] = $input['delivered_by'];
            $mail_data['recieved_by'] = $input['recieved_by'];
            try {
                Mail::send('mail.delivery_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Delivery Details');
                });
            } catch (\Exception $e) {
                $message = 'Delivery updated successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }

        return redirect('superAdmin/delivery')->with('message', $message);
    }

    public function productDeliveryData($id)
    {
        $lims_delivery_data = Delivery::find($id);
        //return 'madarchod';
        $lims_product_sale_data = ProductSale::where('sale_id', $lims_delivery_data->sale->id)->get();

        foreach ($lims_product_sale_data as $key => $product_sale_data) {
            $product = Product::select('product_name', 'product_code')->find($product_sale_data->product_id);
            if ($product_sale_data->variant_id) {
                $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_sale_data->product_id, $product_sale_data->variant_id)->first();
                $product->code = $lims_product_variant_data->item_code;
            }
            if ($product_sale_data->product_batch_id) {
                $product_batch_data = ProductBatch::select('batch_no', 'expired_date')->find($product_sale_data->product_batch_id);
                if ($product_batch_data) {
                    $batch_no = $product_batch_data->batch_no;
                    $expired_date = date(config('date_format'), strtotime($product_batch_data->expired_date));
                }
            } else {
                $batch_no = 'N/A';
                $expired_date = 'N/A';
            }
            $product_sale[0][$key] = $product->code;
            $product_sale[1][$key] = $product->product_name;
            $product_sale[2][$key] = $batch_no;
            $product_sale[3][$key] = $expired_date;
            $product_sale[4][$key] = $product_sale_data->qty;
        }
        return $product_sale;
    }
    public function deliverysendMail(Request $request)
    {
        dd("send mail");
        $data = $request->all();
        $lims_delivery_data = Delivery::find($data['delivery_id']);
        $lims_sale_data = Sale::find($lims_delivery_data->sale->id);
        $lims_product_sale_data = ProductSale::where('sale_id', $lims_delivery_data->sale->id)->get();
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        if ($lims_customer_data->email) {
            //collecting male data
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['date'] = date(config('date_format'), strtotime($lims_delivery_data->created_at->toDateString()));
            $mail_data['delivery_reference_no'] = $lims_delivery_data->reference_no;
            $mail_data['sale_reference_no'] = $lims_sale_data->reference_no;
            $mail_data['status'] = $lims_delivery_data->status;
            $mail_data['customer_name'] = $lims_customer_data->name;
            $mail_data['address'] = $lims_customer_data->address . ', ' . $lims_customer_data->city;
            $mail_data['phone_number'] = $lims_customer_data->phone_number;
            $mail_data['note'] = $lims_delivery_data->note;
            $mail_data['prepared_by'] = $lims_delivery_data->user->name;
            if ($lims_delivery_data->delivered_by)
                $mail_data['delivered_by'] = $lims_delivery_data->delivered_by;
            else
                $mail_data['delivered_by'] = 'N/A';
            if ($lims_delivery_data->recieved_by)
                $mail_data['recieved_by'] = $lims_delivery_data->recieved_by;
            else
                $mail_data['recieved_by'] = 'N/A';
            //return $mail_data;

            foreach ($lims_product_sale_data as $key => $product_sale_data) {
                $lims_product_data = Product::select('product_code', 'product_name')->find($product_sale_data->product_id);
                $mail_data['codes'][$key] = $lims_product_data->product_code;
                $mail_data['name'][$key] = $lims_product_data->product_name;
                if ($product_sale_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_sale_data->product_id, $product_sale_data->variant_id)->first();
                    $mail_data['codes'][$key] = $lims_product_variant_data->item_code;
                }
                $mail_data['qty'][$key] = $product_sale_data->qty;
            }

            //return $mail_data;

            try {
                Mail::send('mail.delivery_challan', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Delivery Challan');
                });
                $message = 'Mail sent successfully';
            } catch (\Exception $e) {
                $message = 'Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        } else
            $message = 'Customer does not have email!';

        return redirect()->back()->with('message', $message);
    }
    public function deliverydestroy($id)
    {
        $lims_delivery_data = Delivery::find($id);
        $lims_delivery_data->delete();
        return redirect('superAdmin/delivery')->with('not_permitted', 'Delivery deleted successfully');
    }

    // ======================== Ganeral Setting===================    
    public function ganeralsettingindex(Request $request)
    {
        // dd("kk");
        $lims_general_setting_data = GeneralSetting::latest()->first();
        $lims_account_list = Account::where('is_active', true)->get();
        // $lims_currency_list = Currency::get();
        $zones_array = array();
        $timestamp = time();
        foreach (timezone_identifiers_list() as $key => $zone) {
            date_default_timezone_set($zone);
            $zones_array[$key]['zone'] = $zone;
            $zones_array[$key]['diff_from_GMT'] = 'UTC/GMT ' . date('P', $timestamp);
        }
        return view('superadmin.setting.general_setting', compact('lims_general_setting_data', 'lims_account_list', 'zones_array'));

    }
    public function ganeralsettingstore(Request $request)
    {

        // print_r($request->all());
        if (!env('USER_VERIFIED')) {
            return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');
        }

        // $this->validate($request, [
        //     'site_logo' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
        // ]);

        $data = $request->except('site_logo');
        //writting timezone info in .env file
        $path = '.env';
        $searchArray = array('APP_TIMEZONE=' . env('APP_TIMEZONE'));
        $replaceArray = array('APP_TIMEZONE=' . $data['timezone']);
        //    return $replaceArray;

        file_put_contents($path, str_replace($searchArray, $replaceArray, file_get_contents($path)));

        if (isset($data['is_rtl']))
            $data['is_rtl'] = true;
        else
            $data['is_rtl'] = false;

        $general_setting = GeneralSetting::latest()->first();
        $general_setting->id = 1;
        $general_setting->site_title = $data['site_title'];
        $general_setting->is_rtl = $data['is_rtl'];
        // $general_setting->currency = $data['currency'];
        // $general_setting->currency_position = $data['currency_position'];
        $general_setting->staff_access = $data['staff_access'];
        $general_setting->company_name = $data['company_name'];
        $general_setting->vat_registration_number = $data['vat_registration_number'];
        $general_setting->date_format = $data['date_format'];
        $general_setting->developed_by = $data['developed_by'];
        $general_setting->invoice_format = $data['invoice_format'];
        $general_setting->state = $data['state'];
        $logo = $request->site_logo;
        if ($logo) {
            $ext = pathinfo($logo->getClientOriginalName(), PATHINFO_EXTENSION);
            $logoName = date("Ymdhis") . '.' . $ext;
            $logo->move('public/logo', $logoName);
            $general_setting->site_logo = $logoName;
        }
        $general_setting->save();
        return redirect()->back()->with('message', 'Data updated successfully');
    }

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

    public function expenseCategoriesstore(Request $request)
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

    public function expenseCategoriesUpdate(Request $request)
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

    public function expenseCategoriesImport(Request $request)
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

    public function deleteBySelection(Request $request)
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
    public function expenseIngindex(Request $request)
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

    public function expensesstore(Request $request)
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

    public function expensesupdate(Request $request)
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
    // ========================Product===================    
    public function productsindex(Request $request)
    {
        $products = Product::latest()->get();

        if ($request->ajax()) {
            $products = Product::latest()->get();
            if ($request->filled('from_date') && $request->filled('to_date')) {
                $start_date = $request->from_date;
                $end_date = $request->to_date;
                if ($start_date && $end_date) {
                    $start_date = date('Y-m-d', strtotime($start_date));
                    $end_date = date('Y-m-d', strtotime($end_date));

                    $products = $products->whereBetween('created_at', [$start_date, $end_date]);
                }
            }
            return Datatables::of($products)
                ->addIndexColumn()
                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('product_name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['product_name'], $request->get('product_name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['product_name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['product_name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }

                })

                ->addColumn('image', function ($row) {
                    if (!isset($row->product_image)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->product_image) .
                            '" alt="' . $row->product_name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('thumbnail/' . $row->product_image) .
                        '" alt="' . $row->product_name . '" style="height: 40px;" >';
                })
                ->addColumn('status', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';

                        // return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })

                ->addColumn('brand', function ($row) {
                    $brands = DB::table('products')
                        ->join('brands', 'brands.id', '=', 'products.brand_id')
                        ->select('brands.brand_name')
                        ->where('brands.id', $row->brand_id)
                        ->get();
                    foreach ($brands as $brand) {
                        return $brand->brand_name;
                    }

                })
                ->addColumn('category', function ($row) {
                    $categories = DB::table('products')
                        ->join('categories', 'categories.id', '=', 'products.category_id')
                        ->select('categories.name_en')
                        ->where('categories.id', $row->category_id)
                        ->get();
                    foreach ($categories as $category) {
                        return $category->name_en;
                    }

                })
                ->addColumn('unit', function ($row) {
                    $units = DB::table('products')
                        ->join('units', 'units.id', '=', 'products.unit_id')
                        ->select('units.unit_code')
                        ->where('units.id', $row->unit_id)
                        ->get();
                    foreach ($units as $unit) {
                        return $unit->unit_code;
                    }
                })
                ->addColumn('publish', function ($row) {
                    $publishs = DB::table('products')
                        ->where('id', $row->id)
                        ->get();
                    foreach ($publishs as $publish) {
                        $date = date('d-M-Y', strtotime($publish->publish_at));
                        return $date;
                    }
                })


                // date('Y-m-d', strtotime($data['start_date']));
                ->addColumn('action', function ($row) {
                    // Update Button   
    
                    // '<a href="' . route('superAdmin.products.edit', $row->id ) .'">Edit</a>'; 
                    $updateButton = '<a href="' . route('superAdmin.products.edit', $row->id) . '" data-toggle="tooltip"  
                            data-id="' . $row->id . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editproduct "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '"         data-original-title="Delete" class="btn btn-danger btn-sm deleteproducts"><i class="fa fa-trash"></i></a>';

                    // $nasted =  '<div class="btn-group">
                    //     <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action
                    //       <span class="caret"></span>
                    //       <span class="sr-only">Toggle Dropdown</span>
                    //     </button>
                    //     <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                    //         <li>
                    //             <button type="button" class="open-EditCategoryDialog btn btn-link" data-toggle="modal" data-target="#editModal" ><i class="dripicons-document-edit"></i> '.$updateButton. ' </button>
                    //         </li>
                    //         <li class="divider"></li>
                    //         <li>
                    //           <button type="submit" class="btn btn-link" onclick="return confirmDelete()">'.$deleteButton.'
                    //         </button> 
                    //         </li>
                    //     </ul>
                    // </div>';
    
                    // return  $nasted;    
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }
        return view('superadmin.product.index', compact('products'));

        // return (new Categorycrud)->categoryindex($request);
        // Log::channel('categorylog')->critical('Category Log file', ['data' => $categories]);

    }

    public function productscreate()
    {
        $lims_product_list_without_variant = $this->productWithoutVariant();
        $lims_product_list_with_variant = $this->productWithVariant();
        $unites = Unit::where('status', '1')->get();
        $categories = Category::where('status', '1')->get();
        $brands = Brand::where('status', '1')->get();
        $taxs = Tax::where('is_active', '1')->get();
        // print_r($taxs);
        // die();        
        return view('superadmin.product.create', compact('unites', 'categories', 'brands', 'taxs'));
    }
    public function productsstore(Request $request)
    {
        $data = $request->except('name');

        if (isset($data['is_variant'])) {
            $data['variant_option'] = json_encode($data['variant_option']);
            $data['variant_value'] = json_encode($data['variant_value']);
        } else {
            $data['variant_option'] = $data['variant_value'] = null;
        }

        $data['product_name'] = preg_replace('/[\n\r]/', "<br>", htmlspecialchars(trim($request->name)));
        $data['slug'] = trim($request->slug);
        $data['barcode_id'] = $request->barcode_id;
        if ($data['product_type'] == 'combo') {
            $data['product_list'] = implode(",", $data['product_id']);
            $data['variant_list'] = implode(",", $data['variant_id']);
            $data['qty_list'] = implode(",", $data['product_qty']);
            $data['price_list'] = implode(",", $data['unit_price']);
            $data['prodcut_coust'] = $data['unit_id'] = $data['purchase_unit_id'] = $data['sale_unit_id'] = 0;
        } elseif ($data['product_type'] == 'digital' || $data['product_type'] == 'service')
            $data['prodcut_coust'] = $data['unit_id'] = $data['purchase_unit_id'] = $data['sale_unit_id'] = 0;

        $data['product_details'] = str_replace('"', '@', $data['product_details']);

        if ($data['start_date'])
            $data['start_date'] = date('Y-m-d', strtotime($data['start_date']));
        if ($data['end_date'])
            $data['end_date'] = date('Y-m-d', strtotime($data['end_date']));
        $data['is_active'] = $request->status;
        $data['trending'] = $request->trending;
        $data['product_image'] = $request->image_name;
        $data['product_sell_price'] = $request->product_sell_price;
        $data['product_regular_price'] = $request->product_regular_price;
        // print_r($data);
        // die();

        $lims_product_data = Product::create($data);
        // Product variant
        if (!isset($data['is_batch']))
            $data['is_batch'] = null;
        if (isset($data['is_variant'])) {
            foreach ($data['variant_name'] as $key => $variant_name) {
                $lims_variant_data = Variant::firstOrCreate(['variant_name' => $data['variant_name'][$key]]);
                $lims_variant_data->variant_name = $data['variant_name'][$key];
                $lims_variant_data->save();
                $lims_product_variant_data = new ProductVariant;
                $lims_product_variant_data->product_id = $lims_product_data->id;
                $lims_product_variant_data->variant_id = $lims_variant_data->id;
                $lims_product_variant_data->position = $key + 1;
                $lims_product_variant_data->item_code = $data['item_code'][$key];
                $lims_product_variant_data->additional_cost = $data['additional_cost'][$key];
                $lims_product_variant_data->additional_price = $data['additional_price'][$key];
                $lims_product_variant_data->qty = $data['stock'][$key];
                ;
                $lims_product_variant_data->save();
            }
        }
        // Warehouse
        if (isset($data['is_diffPriceWareHouse'])) {
            // if(isset($data['is_diffPrice'])) {
            foreach ($data['diff_price'] as $key => $diff_price) {
                if ($diff_price) {
                    ProductWarehouse::create([
                        "product_id" => $lims_product_data->id,
                        "warehouse_id" => $data["warehouse_id"][$key],
                        "stock" => $data["stock"][$key] ?? 0,
                        "qty" => 0,
                        "price" => $diff_price
                    ]);
                }
            }
        }

        // Product Barcode            
        Barcode::create([
            'product_id' => $lims_product_data->id,
            'product_name' => $lims_product_data->product_name,
            'brand' => $lims_product_data->brand_id,
            'price' => $lims_product_data->product_price,
            'product_code' => DNS1D::getBarcodePNGPath($lims_product_data->product_code, 'C39+', 2, 50),
            // for bar code
            // 'product_code' => DNS2D::getBarcodePNGPath($request->product_code, 'QRCODE', 2, 2),   //for QR code
        ]);

        // dd("kk");
        // $val = $request->all();
        // print_r($data);
        return Redirect::to('superAdmin/products')->with('success', 'Product Update successfully');
        // return (new Categorycrud)->productstore($request);


    }
    public function productsedit($id)
    {

        $lims_product_list_without_variant = $this->productWithoutVariant();
        $lims_product_list_with_variant = $this->productWithVariant();
        $lims_brand_list = Brand::where('status', true)->get();
        $lims_category_list = Category::where('status', true)->get();
        $lims_unit_list = Unit::where('status', '1')->get();
        $lims_tax_list = Tax::where('is_active', '1')->get();
        $lims_product_data = Product::where('id', $id)->first();
        if ($lims_product_data->variant_option) {
            $lims_product_data->variant_option = json_decode($lims_product_data->variant_option);
            $lims_product_data->variant_value = json_decode($lims_product_data->variant_value);
        }
        $lims_product_variant_data = $lims_product_data->variant()->orderBy('position')->get();

        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $noOfVariantValue = 0;

        return view('superadmin.product.edit', compact('lims_product_list_without_variant', 'lims_product_list_with_variant', 'lims_brand_list', 'lims_category_list', 'lims_unit_list', 'lims_tax_list', 'lims_product_data', 'lims_product_variant_data', 'lims_warehouse_list', 'noOfVariantValue'));


        // $product = Product::findOrFail($id);
        // print_r($product);
        // return view('superadmin.product.edit',compact('product'));
    }

    public function productsupdate(Request $request)
    {
        // print_r($request->all());
        // die();

        $lims_product_data = Product::findOrFail($request->input('id'));
        // $data = $request->except('image', 'file', 'prev_img');
        $data = $request->except('name');
        $data['product_name'] = preg_replace('/[\n\r]/', "<br>", htmlspecialchars(trim($request->name)));

        if ($data['product_type'] == 'combo') {
            $data['product_list'] = implode(",", $data['product_id']);
            $data['variant_list'] = implode(",", $data['variant_id']);
            $data['qty_list'] = implode(",", $data['product_qty']);
            $data['price_list'] = implode(",", $data['unit_price']);
            $data['prodcut_coust'] = $data['unit_id'] = $data['purchase_unit_id'] = $data['sale_unit_id'] = 0;
        } elseif ($data['product_type'] == 'digital' || $data['product_type'] == 'service')
            $data['prodcut_coust'] = $data['unit_id'] = $data['purchase_unit_id'] = $data['sale_unit_id'] = 0;

        if (!isset($data['featured']))
            $data['featured'] = 0;

        if (!isset($data['is_embeded']))
            $data['is_embeded'] = 0;

        if (!isset($data['promotion']))
            $data['promotion'] = null;

        if (!isset($data['is_batch']))
            $data['is_batch'] = null;

        if (!isset($data['is_imei']))
            $data['is_imei'] = null;

        $data['product_details'] = str_replace('"', '@', $data['product_details']);
        // $data['product_details'] = $data['product_details'];
        $data['is_active'] = $request->status;
        $data['trending'] = $request->trending;
        $data['product_image'] = $request->image_name;
        if ($data['start_date'])
            $data['start_date'] = date('Y-m-d', strtotime($data['start_date']));
        if ($data['end_date'])
            $data['end_date'] = date('Y-m-d', strtotime($data['end_date']));

        $old_product_variant_ids = ProductVariant::where('product_id', $request->input('id'))->pluck('id')->toArray();
        $new_product_variant_ids = [];
        //dealing with product variant
        if (isset($data['is_variant'])) {
            if (isset($data['variant_option']) && isset($data['variant_value'])) {
                $data['variant_option'] = json_encode($data['variant_option']);
                $data['variant_value'] = json_encode($data['variant_value']);
            }
            foreach ($data['variant_name'] as $key => $variant_name) {
                $lims_variant_data = Variant::firstOrCreate(['variant_name' => $data['variant_name'][$key]]);
                $lims_product_variant_data = ProductVariant::where([
                    ['product_id', $lims_product_data->id],
                    ['variant_id', $lims_variant_data->id]
                ])->first();
                if ($lims_product_variant_data) {
                    $lims_product_variant_data->update([
                        'position' => $key + 1,
                        'item_code' => $data['item_code'][$key],
                        'additional_cost' => $data['additional_cost'][$key],
                        'additional_price' => $data['additional_price'][$key],
                        'qty' => $data['additional_qty'][$key]
                    ]);
                } else {
                    $lims_product_variant_data = new ProductVariant();
                    $lims_product_variant_data->product_id = $lims_product_data->id;
                    $lims_product_variant_data->variant_id = $lims_variant_data->id;
                    $lims_product_variant_data->position = $key + 1;
                    $lims_product_variant_data->item_code = $data['item_code'][$key];
                    $lims_product_variant_data->additional_cost = $data['additional_cost'][$key];
                    $lims_product_variant_data->additional_price = $data['additional_price'][$key];
                    $lims_product_variant_data->qty = $data['additional_qty'][$key];
                    // $lims_product_variant_data->qty = 0;
                    $lims_product_variant_data->save();
                }
                $new_product_variant_ids[] = $lims_product_variant_data->id;
            }
        } else {
            $data['is_variant'] = null;
            $data['variant_option'] = null;
            $data['variant_value'] = null;
        }
        //deleting old product variant if not exist
        foreach ($old_product_variant_ids as $key => $product_variant_id) {
            if (!in_array($product_variant_id, $new_product_variant_ids))
                ProductVariant::find($product_variant_id)->delete();
        }

        if (isset($data['is_diffPriceWareHouse'])) {
            foreach ($data['diff_price'] as $key => $diff_price) {
                if ($diff_price) {
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($lims_product_data->id, $data['warehouse_id'][$key])->first();
                    if ($lims_product_warehouse_data) {
                        $lims_product_warehouse_data->price = $diff_price;
                        $lims_product_warehouse_data->qty = $data["warehouse_qty"][$key];
                        $lims_product_warehouse_data->save();
                    } else {
                        ProductWarehouse::create([
                            "product_id" => $lims_product_data->id,
                            "warehouse_id" => $data["warehouse_id"][$key],

                            "qty" => $data["warehouse_qty"][$key],
                            "price" => $diff_price
                        ]);
                    }
                }
            }
        } else {
            $data['is_diffPriceWareHouse'] = false;
            foreach ($data['warehouse_id'] as $key => $warehouse_id) {
                $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($lims_product_data->id, $warehouse_id)->first();
                if ($lims_product_warehouse_data) {
                    $lims_product_warehouse_data->price = null;
                    $lims_product_warehouse_data->save();
                }
            }
        }

        // Product Barcode            
        $barcode = Barcode::where('product_id', $lims_product_data->id)->first();
        if ($barcode !== null) {
            $barcode->update(
                [
                    'product_id' => $lims_product_data->id,
                    'product_name' => $lims_product_data->product_name,
                    'brand' => $lims_product_data->brand_id,
                    'price' => $lims_product_data->product_price,
                    'product_code' => DNS1D::getBarcodePNGPath($request->product_code, 'C39+', 2, 50),
                    // for bar code
                    // 'product_code' => DNS2D::getBarcodePNGPath($request->product_code, 'QRCODE', 2, 2),   //for QR code
                ]
            );
        }

        $lims_product_data->update($data);
        $request->session()->flash('edit_message', 'Product updated successfully');
        // Session::Flash('edit_message', 'Product updated successfully');    
        return Redirect::to('superAdmin/products')->with('success', 'Product Update successfully');
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');          
    }

    public function productWithoutVariant()
    {
        return Product::ActiveStandard()->select('id', 'product_name', 'product_code')
            ->whereNull('is_variant')->get();
    }

    public function productWithVariant()
    {
        return Product::join('product_variants', 'products.id', 'product_variants.product_id')
            ->ActiveStandard()
            ->whereNotNull('is_variant')
            ->select('products.id', 'products.product_name', 'product_variants.item_code')
            ->orderBy('position')->get();
    }

    //   public function saleUnit($id)
    // {
    //     $unit = Unit::where("base_unit", $id)->orWhere('id', $id)->pluck('unit_code','id');
    //     return json_encode($unit);
    // }
    // public function  productssellUnit(Request $request, $id){
    //     // https://www.itsolutionstuff.com/post/laravel-country-state-city-dropdown-using-ajax-exampleexample.html
    //         $data['states'] = Unit::where("id", $request->unit_id)
    //                 ->get(["unit_code","id"]);
    //     return response()->json($data);
    // } 
    // public function  productspurchaseUnit(Request $request, $id){
    //     $data['cities'] = Unit::where("id", $request->unit_id)
    //                 ->get(["unit_code","id"]);
    //     return response()->json($data);
    // }    

    public function productssellUnitId($id)
    {
        $unit = Unit::where("id", $id)->get(["unit_code", "id"]);
        return json_encode($unit);
    }
    public function productspurchaseUnitId($id)
    {
        $unit = Unit::where("id", $id)->get(["unit_code", "id"]);
        return json_encode($unit);
    }
    public function productspublish($id)
    {
        $publish = Product::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function productsunpublish($id)
    {
        $unpublish = Product::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    }


    public function productsslugsearch(Request $request)
    {
        if ($request->ajax()) {
            $output = "";
            $products = DB::table('products')
                ->where('product_name', $request->slug)
                ->orderBy('id', 'DESC')
                ->first();
            $output = $products->slug;
            $data = array(
                'slug' => $output,
            );
            // echo json_encode($output); // display for output
            return Response($output);
            // return Response::json($output);
        }
    }

    // Product search
    public function limsProductSearch(Request $request)
    {
        $product_code = explode("|", $request['data']);
        $product_code[0] = rtrim($product_code[0], " ");
        $lims_product_data = Product::where([
            ['product_code', $product_code[0]],
            ['is_active', true]
        ])
            ->whereNull('is_variant')
            ->first();
        if (!$lims_product_data) {
            $lims_product_data = Product::where([
                ['product_name', $product_code[1]],
                ['is_active', '1']
            ])
                ->whereNotNull(['is_variant'])
                ->first();
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->where([
                    ['product_variants.item_code', $product_code[0]],
                    ['products.is_active', '1']
                ])
                ->whereNotNull('is_variant')
                ->select('products.*', 'product_variants.item_code', 'product_variants.additional_cost')
                ->first();
            $lims_product_data->product_cost += $lims_product_data->additional_cost;
        }
        $product[] = $lims_product_data->product_name;
        if ($lims_product_data->is_variant)
            $product[] = $lims_product_data->item_code;
        else
            $product[] = $lims_product_data->product_code;
        $product[] = $lims_product_data->product_cost;

        if ($lims_product_data->tax_id) {
            $lims_tax_data = Tax::find($lims_product_data->tax_id);
            $product[] = $lims_tax_data->rate;
            $product[] = $lims_tax_data->name;
        } else {
            $product[] = 0;
            $product[] = 'No Tax';
        }
        $product[] = $lims_product_data->tax_method;

        $units = Unit::where("id", $lims_product_data->unit_id)
            ->orWhere('id', $lims_product_data->unit_id)
            ->get();
        $short_name = array();
        $unit_operator = array();
        $unit_operation_value = array();
        foreach ($units as $unit) {
            if ($lims_product_data->purchase_unit_id == $unit->id) {
                array_unshift($short_name, $unit->short_name);
                array_unshift($unit_operator, $unit->operator);
                array_unshift($unit_operation_value, $unit->operation_value);
            } else {
                $short_name[] = $unit->short_name;
                $unit_operator[] = $unit->operator;
                $unit_operation_value[] = $unit->operation_value;
            }
        }

        $product[] = implode(",", $short_name) . ',';
        $product[] = implode(",", $unit_operator) . ',';
        $product[] = implode(",", $unit_operation_value) . ',';
        $product[] = $lims_product_data->id;
        $product[] = $lims_product_data->is_batch;
        $product[] = $lims_product_data->is_imei;
        return $product;

    }

    public function productsdestroy($id)
    {
        $lims_product_data = Product::findOrFail($id);
        $lims_product_data->is_active = false;
        if ($lims_product_data->image != 'zummXD2dvAtI.png') {
            $images = explode(",", $lims_product_data->image);
            foreach ($images as $key => $image) {
                if (file_exists('public/images/product/' . $image))
                    unlink('public/images/product/' . $image);
            }
        }
        $lims_product_data->save();
        return response()->json(['status' => "success"]);
    }

    // ================== Reporting =============
    public function productQuantityAlert()
    {
        $lims_product_data = Product::select('product_name', 'product_code', 'product_image', 'qty', 'alert_quantity')->where('is_active', true)->whereColumn('alert_quantity', '>', 'qty')->get();
        return view('superadmin.report.qty_alert_report', compact('lims_product_data'));
    }

    public function dailySaleObjective(Request $request)
    {
        if ($request->input('starting_date')) {
            $starting_date = $request->input('starting_date');
            $ending_date = $request->input('ending_date');
        } else {
            $starting_date = date("Y-m-d", strtotime(date('Y-m-d', strtotime('-1 month', strtotime(date('Y-m-d'))))));
            $ending_date = date("Y-m-d");
        }
        return view('superadmin.report.daily_sale_objective', compact('starting_date', 'ending_date'));
    }

    public function dailySaleObjectiveData(Request $request)
    {
        $starting_date = date("Y-m-d", strtotime("+1 day", strtotime($request->input('starting_date'))));
        $ending_date = date("Y-m-d", strtotime("+1 day", strtotime($request->input('ending_date'))));

        $columns = array(
            1 => 'created_at',
        );
        $totalData = DB::table('dso_alerts')
            ->whereDate('created_at', '>=', $starting_date)
            ->whereDate('created_at', '<=', $ending_date)
            ->count();
        $totalFiltered = $totalData;

        if ($request->input('length') != -1)
            $limit = $request->input('length');
        else
            $limit = $totalData;
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        if (empty($request->input('search.value'))) {
            $lims_dso_alert_data = DB::table('dso_alerts')
                ->whereDate('created_at', '>=', $starting_date)
                ->whereDate('created_at', '<=', $ending_date)
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        } else {
            $search = $request->input('search.value');
            $lims_dso_alert_data = DB::table('dso_alerts')
                ->whereDate('dso_alerts.created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        }
        $data = array();
        if (!empty($lims_dso_alert_data)) {
            foreach ($lims_dso_alert_data as $key => $dso_alert_data) {
                $nestedData['id'] = $dso_alert_data->id;
                $nestedData['key'] = $key;
                $nestedData['date'] = date(config('date_format'), strtotime("-1 day", strtotime($dso_alert_data->created_at)));
                foreach (json_decode($dso_alert_data->product_info) as $index => $product_info) {
                    if ($index)
                        $nestedData['product_info'] .= ', ';
                    $nestedData['product_info'] = $product_info->name . ' [' . $product_info->code . ']';
                }
                $nestedData['number_of_products'] = $dso_alert_data->number_of_products;
                $data[] = $nestedData;
            }
        }
        $json_data = array(
            "draw" => intval($request->input('draw')),
            "recordsTotal" => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data" => $data
        );
        echo json_encode($json_data);
    }

    public function productExpiry()
    {
        $date = date('Y-m-d', strtotime('+10 days'));
        $lims_product_data = DB::table('products')
            ->join('product_batches', 'products.id', '=', 'product_batches.product_id')
            ->whereDate('product_batches.expired_date', '<=', $date)
            ->where([
                ['products.is_active', true],
                ['product_batches.qty', '>', 0]
            ])
            ->select('products.product_name', 'products.product_code', 'products.product_image', 'product_batches.batch_no', 'product_batches.batch_no', 'product_batches.expired_date', 'product_batches.qty')
            ->get();
        return view('superadmin.report.product_expiry_report', compact('lims_product_data'));
    }

    public function warehouseStock(Request $request)
    {

        if (isset($request->warehouse_id))
            $warehouse_id = $request->warehouse_id;
        else
            $warehouse_id = 0;
        if (!$warehouse_id) {
            $total_item = DB::table('product_warehouses')
                ->join('products', 'product_warehouses.product_id', '=', 'products.id')
                ->where([
                    ['products.is_active', true],
                    ['product_warehouses.qty', '>', 0]
                ])->count();

            $total_qty = Product::where('is_active', true)->sum('qty');
            $total_price = DB::table('products')->where('is_active', true)->sum(DB::raw('product_price * qty'));
            $total_cost = DB::table('products')->where('is_active', true)->sum(DB::raw('product_cost * qty'));
        } else {
            $total_item = DB::table('product_warehouses')
                ->join('products', 'product_warehouses.product_id', '=', 'products.id')
                ->where([
                    ['products.is_active', true],
                    ['product_warehouses.qty', '>', 0],
                    ['product_warehouses.warehouse_id', $warehouse_id]
                ])->count();
            $total_qty = DB::table('product_warehouses')
                ->join('products', 'product_warehouses.product_id', '=', 'products.id')
                ->where([
                    ['products.is_active', true],
                    ['product_warehouses.warehouse_id', $warehouse_id]
                ])->sum('product_warehouses.qty');
            $total_price = DB::table('product_warehouses')
                ->join('products', 'product_warehouses.product_id', '=', 'products.id')
                ->where([
                    ['products.is_active', true],
                    ['product_warehouses.warehouse_id', $warehouse_id]
                ])->sum(DB::raw('products.product_price * product_warehouses.qty'));
            $total_cost = DB::table('product_warehouses')
                ->join('products', 'product_warehouses.product_id', '=', 'products.id')
                ->where([
                    ['products.is_active', true],
                    ['product_warehouses.warehouse_id', $warehouse_id]
                ])->sum(DB::raw('products.product_cost * product_warehouses.qty'));
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.report.warehouse_stock', compact('total_item', 'total_qty', 'total_price', 'total_cost', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function dailySale($year, $month)
    {


        $start = 1;
        $number_of_day = date('t', mktime(0, 0, 0, $month, 1, $year));
        while ($start <= $number_of_day) {
            if ($start < 10)
                $date = $year . '-' . $month . '-0' . $start;
            else
                $date = $year . '-' . $month . '-' . $start;
            $query1 = array(
                'SUM(total_discount) AS total_discount',
                'SUM(order_discount) AS order_discount',
                'SUM(total_tax) AS total_tax',
                'SUM(order_tax) AS order_tax',
                'SUM(shipping_cost) AS shipping_cost',
                'SUM(grand_total) AS grand_total'
            );
            $sale_data = Sale::whereDate('created_at', $date)->selectRaw(implode(',', $query1))->get();
            $total_discount[$start] = $sale_data[0]->total_discount;
            $order_discount[$start] = $sale_data[0]->order_discount;
            $total_tax[$start] = $sale_data[0]->total_tax;
            $order_tax[$start] = $sale_data[0]->order_tax;
            $shipping_cost[$start] = $sale_data[0]->shipping_cost;
            $grand_total[$start] = $sale_data[0]->grand_total;
            $start++;
        }
        $start_day = date('w', strtotime($year . '-' . $month . '-01')) + 1;
        $prev_year = date('Y', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $prev_month = date('m', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $next_year = date('Y', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $next_month = date('m', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = 0;
        return view('superadmin.report.daily_sale', compact('total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'grand_total', 'start_day', 'year', 'month', 'number_of_day', 'prev_year', 'prev_month', 'next_year', 'next_month', 'lims_warehouse_list', 'warehouse_id'));

    }

    public function dailySaleByWarehouse(Request $request, $year, $month)
    {
        $data = $request->all();
        if ($data['warehouse_id'] == 0)
            return redirect()->back();
        $start = 1;
        $number_of_day = date('t', mktime(0, 0, 0, $month, 1, $year));
        while ($start <= $number_of_day) {
            if ($start < 10)
                $date = $year . '-' . $month . '-0' . $start;
            else
                $date = $year . '-' . $month . '-' . $start;
            $query1 = array(
                'SUM(total_discount) AS total_discount',
                'SUM(order_discount) AS order_discount',
                'SUM(total_tax) AS total_tax',
                'SUM(order_tax) AS order_tax',
                'SUM(shipping_cost) AS shipping_cost',
                'SUM(grand_total) AS grand_total'
            );
            $sale_data = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', $date)->selectRaw(implode(',', $query1))->get();
            $total_discount[$start] = $sale_data[0]->total_discount;
            $order_discount[$start] = $sale_data[0]->order_discount;
            $total_tax[$start] = $sale_data[0]->total_tax;
            $order_tax[$start] = $sale_data[0]->order_tax;
            $shipping_cost[$start] = $sale_data[0]->shipping_cost;
            $grand_total[$start] = $sale_data[0]->grand_total;
            $start++;
        }
        $start_day = date('w', strtotime($year . '-' . $month . '-01')) + 1;
        $prev_year = date('Y', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $prev_month = date('m', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $next_year = date('Y', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $next_month = date('m', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = $data['warehouse_id'];
        return view('superadmin.report.daily_sale', compact('total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'grand_total', 'start_day', 'year', 'month', 'number_of_day', 'prev_year', 'prev_month', 'next_year', 'next_month', 'lims_warehouse_list', 'warehouse_id'));

    }

    public function dailyPurchase($year, $month)
    {

        $start = 1;
        $number_of_day = date('t', mktime(0, 0, 0, $month, 1, $year));
        while ($start <= $number_of_day) {
            if ($start < 10)
                $date = $year . '-' . $month . '-0' . $start;
            else
                $date = $year . '-' . $month . '-' . $start;
            $query1 = array(
                'SUM(total_discount) AS total_discount',
                'SUM(order_discount) AS order_discount',
                'SUM(total_tax) AS total_tax',
                'SUM(order_tax) AS order_tax',
                'SUM(shipping_cost) AS shipping_cost',
                'SUM(grand_total) AS grand_total'
            );
            $purchase_data = Purchase::whereDate('created_at', $date)->selectRaw(implode(',', $query1))->get();
            $total_discount[$start] = $purchase_data[0]->total_discount;
            $order_discount[$start] = $purchase_data[0]->order_discount;
            $total_tax[$start] = $purchase_data[0]->total_tax;
            $order_tax[$start] = $purchase_data[0]->order_tax;
            $shipping_cost[$start] = $purchase_data[0]->shipping_cost;
            $grand_total[$start] = $purchase_data[0]->grand_total;
            $start++;
        }
        $start_day = date('w', strtotime($year . '-' . $month . '-01')) + 1;
        $prev_year = date('Y', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $prev_month = date('m', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $next_year = date('Y', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $next_month = date('m', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = 0;
        return view('superadmin.report.daily_purchase', compact('total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'grand_total', 'start_day', 'year', 'month', 'number_of_day', 'prev_year', 'prev_month', 'next_year', 'next_month', 'lims_warehouse_list', 'warehouse_id'));

    }

    public function dailyPurchaseByWarehouse(Request $request, $year, $month)
    {
        $data = $request->all();
        if ($data['warehouse_id'] == 0)
            return redirect()->back();
        $start = 1;
        $number_of_day = date('t', mktime(0, 0, 0, $month, 1, $year));
        while ($start <= $number_of_day) {
            if ($start < 10)
                $date = $year . '-' . $month . '-0' . $start;
            else
                $date = $year . '-' . $month . '-' . $start;
            $query1 = array(
                'SUM(total_discount) AS total_discount',
                'SUM(order_discount) AS order_discount',
                'SUM(total_tax) AS total_tax',
                'SUM(order_tax) AS order_tax',
                'SUM(shipping_cost) AS shipping_cost',
                'SUM(grand_total) AS grand_total'
            );
            $purchase_data = Purchase::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', $date)->selectRaw(implode(',', $query1))->get();
            $total_discount[$start] = $purchase_data[0]->total_discount;
            $order_discount[$start] = $purchase_data[0]->order_discount;
            $total_tax[$start] = $purchase_data[0]->total_tax;
            $order_tax[$start] = $purchase_data[0]->order_tax;
            $shipping_cost[$start] = $purchase_data[0]->shipping_cost;
            $grand_total[$start] = $purchase_data[0]->grand_total;
            $start++;
        }
        $start_day = date('w', strtotime($year . '-' . $month . '-01')) + 1;
        $prev_year = date('Y', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $prev_month = date('m', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $next_year = date('Y', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $next_month = date('m', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = $data['warehouse_id'];

        return view('superadmin.report.daily_purchase', compact('total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'grand_total', 'start_day', 'year', 'month', 'number_of_day', 'prev_year', 'prev_month', 'next_year', 'next_month', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function monthlySale($year)
    {

        $start = strtotime($year . '-01-01');
        $end = strtotime($year . '-12-31');
        while ($start <= $end) {
            $start_date = $year . '-' . date('m', $start) . '-' . '01';
            $end_date = $year . '-' . date('m', $start) . '-' . '31';

            $temp_total_discount = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('total_discount');
            $total_discount[] = number_format((float) $temp_total_discount, 2, '.', '');

            $temp_order_discount = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('order_discount');
            $order_discount[] = number_format((float) $temp_order_discount, 2, '.', '');

            $temp_total_tax = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('total_tax');
            $total_tax[] = number_format((float) $temp_total_tax, 2, '.', '');

            $temp_order_tax = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('order_tax');
            $order_tax[] = number_format((float) $temp_order_tax, 2, '.', '');

            $temp_shipping_cost = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('shipping_cost');
            $shipping_cost[] = number_format((float) $temp_shipping_cost, 2, '.', '');

            $temp_total = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('grand_total');
            $total[] = number_format((float) $temp_total, 2, '.', '');
            $start = strtotime("+1 month", $start);
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = 0;
        return view('superadmin.report.monthly_sale', compact('year', 'total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'total', 'lims_warehouse_list', 'warehouse_id'));

    }

    public function monthlySaleByWarehouse(Request $request, $year)
    {
        $data = $request->all();
        if ($data['warehouse_id'] == 0)
            return redirect()->back();

        $start = strtotime($year . '-01-01');
        $end = strtotime($year . '-12-31');
        while ($start <= $end) {
            $start_date = $year . '-' . date('m', $start) . '-' . '01';
            $end_date = $year . '-' . date('m', $start) . '-' . '31';

            $temp_total_discount = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('total_discount');
            $total_discount[] = number_format((float) $temp_total_discount, 2, '.', '');

            $temp_order_discount = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('order_discount');
            $order_discount[] = number_format((float) $temp_order_discount, 2, '.', '');

            $temp_total_tax = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('total_tax');
            $total_tax[] = number_format((float) $temp_total_tax, 2, '.', '');

            $temp_order_tax = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('order_tax');
            $order_tax[] = number_format((float) $temp_order_tax, 2, '.', '');

            $temp_shipping_cost = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('shipping_cost');
            $shipping_cost[] = number_format((float) $temp_shipping_cost, 2, '.', '');

            $temp_total = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('grand_total');
            $total[] = number_format((float) $temp_total, 2, '.', '');
            $start = strtotime("+1 month", $start);
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = $data['warehouse_id'];
        return view('superadmin.report.monthly_sale', compact('year', 'total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'total', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function monthlyPurchase($year)
    {

        $start = strtotime($year . '-01-01');
        $end = strtotime($year . '-12-31');
        while ($start <= $end) {
            $start_date = $year . '-' . date('m', $start) . '-' . '01';
            $end_date = $year . '-' . date('m', $start) . '-' . '31';

            $query1 = array(
                'SUM(total_discount) AS total_discount',
                'SUM(order_discount) AS order_discount',
                'SUM(total_tax) AS total_tax',
                'SUM(order_tax) AS order_tax',
                'SUM(shipping_cost) AS shipping_cost',
                'SUM(grand_total) AS grand_total'
            );
            $purchase_data = Purchase::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query1))->get();

            $total_discount[] = number_format((float) $purchase_data[0]->total_discount, 2, '.', '');
            $order_discount[] = number_format((float) $purchase_data[0]->order_discount, 2, '.', '');
            $total_tax[] = number_format((float) $purchase_data[0]->total_tax, 2, '.', '');
            $order_tax[] = number_format((float) $purchase_data[0]->order_tax, 2, '.', '');
            $shipping_cost[] = number_format((float) $purchase_data[0]->shipping_cost, 2, '.', '');
            $grand_total[] = number_format((float) $purchase_data[0]->grand_total, 2, '.', '');
            $start = strtotime("+1 month", $start);
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = 0;
        return view('superadmin.report.monthly_purchase', compact('year', 'total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'grand_total', 'lims_warehouse_list', 'warehouse_id'));

    }

    public function monthlyPurchaseByWarehouse(Request $request, $year)
    {
        $data = $request->all();
        if ($data['warehouse_id'] == 0)
            return redirect()->back();

        $start = strtotime($year . '-01-01');
        $end = strtotime($year . '-12-31');
        while ($start <= $end) {
            $start_date = $year . '-' . date('m', $start) . '-' . '01';
            $end_date = $year . '-' . date('m', $start) . '-' . '31';

            $query1 = array(
                'SUM(total_discount) AS total_discount',
                'SUM(order_discount) AS order_discount',
                'SUM(total_tax) AS total_tax',
                'SUM(order_tax) AS order_tax',
                'SUM(shipping_cost) AS shipping_cost',
                'SUM(grand_total) AS grand_total'
            );
            $purchase_data = Purchase::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query1))->get();

            $total_discount[] = number_format((float) $purchase_data[0]->total_discount, 2, '.', '');
            $order_discount[] = number_format((float) $purchase_data[0]->order_discount, 2, '.', '');
            $total_tax[] = number_format((float) $purchase_data[0]->total_tax, 2, '.', '');
            $order_tax[] = number_format((float) $purchase_data[0]->order_tax, 2, '.', '');
            $shipping_cost[] = number_format((float) $purchase_data[0]->shipping_cost, 2, '.', '');
            $grand_total[] = number_format((float) $purchase_data[0]->grand_total, 2, '.', '');
            $start = strtotime("+1 month", $start);
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = $data['warehouse_id'];
        return view('superadmin.report.monthly_purchase', compact('year', 'total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'grand_total', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function bestSeller()
    {

        $start = strtotime(date("Y-m", strtotime("-2 months")) . '-01');
        $end = strtotime(date("Y") . '-' . date("m") . '-31');

        while ($start <= $end) {
            $start_date = date("Y-m", $start) . '-' . '01';
            $end_date = date("Y-m", $start) . '-' . '31';

            $best_selling_qty = ProductSale::select(DB::raw('product_id, sum(qty) as sold_qty'))->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->groupBy('product_id')->orderBy('sold_qty', 'desc')->take(1)->get();
            if (!count($best_selling_qty)) {
                $product[] = '';
                $sold_qty[] = 0;
            }
            foreach ($best_selling_qty as $best_seller) {
                $product_data = Product::find($best_seller->product_id);
                $product[] = $product_data->name . ': ' . $product_data->code;
                $sold_qty[] = $best_seller->sold_qty;
            }
            $start = strtotime("+1 month", $start);
        }
        $start_month = date("F Y", strtotime('-2 month'));
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = 0;
        //return $product;
        return view('superadmin.report.best_seller', compact('product', 'sold_qty', 'start_month', 'lims_warehouse_list', 'warehouse_id'));

    }

    public function bestSellerByWarehouse(Request $request)
    {
        $data = $request->all();
        if ($data['warehouse_id'] == 0)
            return redirect()->back();

        $start = strtotime(date("Y-m", strtotime("-2 months")) . '-01');
        $end = strtotime(date("Y") . '-' . date("m") . '-31');

        while ($start <= $end) {
            $start_date = date("Y-m", $start) . '-' . '01';
            $end_date = date("Y-m", $start) . '-' . '31';

            $best_selling_qty = DB::table('sales')
                ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')->select(DB::raw('product_sales.product_id, sum(product_sales.qty) as sold_qty'))->where('sales.warehouse_id', $data['warehouse_id'])->whereDate('sales.created_at', '>=', $start_date)->whereDate('sales.created_at', '<=', $end_date)->groupBy('product_id')->orderBy('sold_qty', 'desc')->take(1)->get();

            if (!count($best_selling_qty)) {
                $product[] = '';
                $sold_qty[] = 0;
            }
            foreach ($best_selling_qty as $best_seller) {
                $product_data = Product::find($best_seller->product_id);
                $product[] = $product_data->name . ': ' . $product_data->code;
                $sold_qty[] = $best_seller->sold_qty;
            }
            $start = strtotime("+1 month", $start);
        }
        $start_month = date("F Y", strtotime('-2 month'));
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = $data['warehouse_id'];
        return view('superadmin.report.best_seller', compact('product', 'sold_qty', 'start_month', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function profitLoss(Request $request)
    {
        $start_date = $request['start_date'];
        $end_date = $request['end_date'];
        $query1 = array(
            'SUM(grand_total) AS grand_total',
            'SUM(paid_amount) AS paid_amount',
            'SUM(total_tax + order_tax) AS tax',
            'SUM(total_discount + order_discount) AS discount'
        );
        $query2 = array(
            'SUM(grand_total) AS grand_total',
            'SUM(total_tax + order_tax) AS tax'
        );
        config()->set('database.connections.mysql.strict', false);
        DB::reconnect();
        $product_sale_data = ProductSale::select(DB::raw('product_id, product_batch_id, sale_unit_id, sum(qty) as sold_qty, sum(total) as sold_amount'))
            ->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date)
            ->groupBy('product_id', 'product_batch_id')
            ->get();
        config()->set('database.connections.mysql.strict', true);
        DB::reconnect();
        $data = $this->calculateAverageCOGS($product_sale_data);
        $product_cost = $data[0];
        $product_tax = $data[1];
        /*$product_revenue = 0;
        $product_cost = 0;
        $product_tax = 0;
        $profit = 0;
        foreach ($product_sale_data as $key => $product_sale) {
            if($product_sale->product_batch_id)
                $product_purchase_data = ProductPurchase::where([
                    ['product_id', $product_sale->product_id],
                    ['product_batch_id', $product_sale->product_batch_id]
                ])->get();
            else
                $product_purchase_data = ProductPurchase::where('product_id', $product_sale->product_id)->get();

            $purchased_qty = 0;
            $purchased_amount = 0;
            $purchased_tax = 0;
            $sold_qty = $product_sale->sold_qty;
            $product_revenue += $product_sale->sold_amount;
            foreach ($product_purchase_data as $key => $product_purchase) {
                $purchased_qty += $product_purchase->qty;
                $purchased_amount += $product_purchase->total;
                $purchased_tax += $product_purchase->tax;
                if($purchased_qty >= $sold_qty) {
                    $qty_diff = $purchased_qty - $sold_qty;
                    $unit_cost = $product_purchase->total / $product_purchase->qty;
                    $unit_tax = $product_purchase->tax / $product_purchase->qty;
                    $purchased_amount -= ($qty_diff * $unit_cost);
                    $purchased_tax -= ($qty_diff * $unit_tax);
                    break;
                }
            }
            $product_cost += $purchased_amount;
            $product_tax += $purchased_tax;
        }*/
        $purchase = Purchase::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query1))->get();
        $total_purchase = Purchase::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->count();
        $sale = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query1))->get();
        $total_sale = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->count();
        $return = Returns::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query2))->get();
        $total_return = Returns::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->count();
        $purchase_return = ReturnPurchase::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query2))->get();
        $total_purchase_return = ReturnPurchase::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->count();
        $expense = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('amount');
        $total_expense = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->count();
        $payroll = Payroll::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('amount');
        $total_payroll = Payroll::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->count();
        $total_item = DB::table('product_warehouses')
            ->join('products', 'product_warehouses.product_id', '=', 'products.id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.qty', '>', 0]
            ])->count();
        $payment_recieved_number = DB::table('payments')->whereNotNull('sale_id')->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date)->count();
        $payment_recieved = DB::table('payments')->whereNotNull('sale_id')->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('payments.amount');
        $credit_card_payment_sale = DB::table('payments')
            ->where('paying_method', 'Credit Card')
            ->whereNotNull('payments.sale_id')
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
        $cheque_payment_sale = DB::table('payments')
            ->where('paying_method', 'Cheque')
            ->whereNotNull('payments.sale_id')
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
        $gift_card_payment_sale = DB::table('payments')
            ->where('paying_method', 'Gift Card')
            ->whereNotNull('sale_id')
            ->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date)
            ->sum('amount');
        $paypal_payment_sale = DB::table('payments')
            ->where('paying_method', 'Paypal')
            ->whereNotNull('sale_id')
            ->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date)
            ->sum('amount');
        $deposit_payment_sale = DB::table('payments')
            ->where('paying_method', 'Deposit')
            ->whereNotNull('sale_id')
            ->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date)
            ->sum('amount');
        $cash_payment_sale = $payment_recieved - $credit_card_payment_sale - $cheque_payment_sale - $gift_card_payment_sale - $paypal_payment_sale - $deposit_payment_sale;
        $payment_sent_number = DB::table('payments')->whereNotNull('purchase_id')->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date)->count();
        $payment_sent = DB::table('payments')->whereNotNull('purchase_id')->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('payments.amount');
        $credit_card_payment_purchase = DB::table('payments')
            ->where('paying_method', 'Gift Card')
            ->whereNotNull('payments.purchase_id')
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
        $cheque_payment_purchase = DB::table('payments')
            ->where('paying_method', 'Cheque')
            ->whereNotNull('payments.purchase_id')
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
        $cash_payment_purchase = $payment_sent - $credit_card_payment_purchase - $cheque_payment_purchase;
        $lims_warehouse_all = Warehouse::where('is_active', true)->get();
        $warehouse_name = [];
        foreach ($lims_warehouse_all as $warehouse) {
            $warehouse_name[] = $warehouse->name;
            $warehouse_sale[] = Sale::where('warehouse_id', $warehouse->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query2))->get();
            $warehouse_purchase[] = Purchase::where('warehouse_id', $warehouse->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query2))->get();
            $warehouse_return[] = Returns::where('warehouse_id', $warehouse->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query2))->get();
            $warehouse_purchase_return[] = ReturnPurchase::where('warehouse_id', $warehouse->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query2))->get();
            $warehouse_expense[] = Expense::where('warehouse_id', $warehouse->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('amount');
        }

        return view('superadmin.report.profit_loss', compact('purchase', 'product_cost', 'product_tax', 'total_purchase', 'sale', 'total_sale', 'return', 'purchase_return', 'total_return', 'total_purchase_return', 'expense', 'payroll', 'total_expense', 'total_payroll', 'payment_recieved', 'payment_recieved_number', 'cash_payment_sale', 'cheque_payment_sale', 'credit_card_payment_sale', 'gift_card_payment_sale', 'paypal_payment_sale', 'deposit_payment_sale', 'payment_sent', 'payment_sent_number', 'cash_payment_purchase', 'cheque_payment_purchase', 'credit_card_payment_purchase', 'warehouse_name', 'warehouse_sale', 'warehouse_purchase', 'warehouse_return', 'warehouse_purchase_return', 'warehouse_expense', 'start_date', 'end_date'));
    }

    public function calculateAverageCOGS($product_sale_data)
    {
        $product_cost = 0;
        $product_tax = 0;
        foreach ($product_sale_data as $key => $product_sale) {
            $product_data = Product::select('product_type', 'product_list', 'variant_list', 'qty_list')->find($product_sale->product_id);
            if ($product_data->type == 'combo') {
                $product_list = explode(",", $product_data->product_list);
                if ($product_data->variant_list)
                    $variant_list = explode(",", $product_data->variant_list);
                else
                    $variant_list = [];
                $qty_list = explode(",", $product_data->qty_list);

                foreach ($product_list as $index => $product_id) {
                    if (count($variant_list) && $variant_list[$index]) {
                        $product_purchase_data = ProductPurchase::where([
                            ['product_id', $product_id],
                            ['variant_id', $variant_list[$index]]
                        ])
                            ->select('recieved', 'purchase_unit_id', 'tax', 'total')
                            ->get();
                    } else {
                        $product_purchase_data = ProductPurchase::where('product_id', $product_id)
                            ->select('recieved', 'purchase_unit_id', 'tax', 'total')
                            ->get();
                    }
                    $total_received_qty = 0;
                    $total_purchased_amount = 0;
                    $total_tax = 0;
                    $sold_qty = $product_sale->sold_qty * $qty_list[$index];
                    foreach ($product_purchase_data as $key => $product_purchase) {
                        $purchase_unit_data = Unit::select('operator', 'operation_value')->find($product_purchase->purchase_unit_id);
                        if ($purchase_unit_data->operator == '*')
                            $total_received_qty += $product_purchase->recieved * $purchase_unit_data->operation_value;
                        else
                            $total_received_qty += $product_purchase->recieved / $purchase_unit_data->operation_value;
                        $total_purchased_amount += $product_purchase->total;
                        $total_tax += $product_purchase->tax;
                    }
                    if ($total_received_qty) {
                        $averageCost = $total_purchased_amount / $total_received_qty;
                        $averageTax = $total_tax / $total_received_qty;
                    } else {
                        $averageCost = 0;
                        $averageTax = 0;
                    }
                    $product_cost += $sold_qty * $averageCost;
                    $product_tax += $sold_qty * $averageTax;
                }
            } else {
                if ($product_sale->product_batch_id) {
                    $product_purchase_data = ProductPurchase::where([
                        ['product_id', $product_sale->product_id],
                        ['product_batch_id', $product_sale->product_batch_id]
                    ])
                        ->select('recieved', 'purchase_unit_id', 'tax', 'total')
                        ->get();
                } elseif ($product_sale->variant_id) {
                    $product_purchase_data = ProductPurchase::where([
                        ['product_id', $product_sale->product_id],
                        ['variant_id', $product_sale->variant_id]
                    ])
                        ->select('recieved', 'purchase_unit_id', 'tax', 'total')
                        ->get();
                } else {
                    $product_purchase_data = ProductPurchase::where('product_id', $product_sale->product_id)
                        ->select('recieved', 'purchase_unit_id', 'tax', 'total')
                        ->get();
                }
                $total_received_qty = 0;
                $total_purchased_amount = 0;
                $total_tax = 0;
                if ($product_sale->sale_unit_id) {
                    $sale_unit_data = Unit::select('operator', 'operation_value')->find($product_sale->sale_unit_id);
                    if ($sale_unit_data->operator == '*')
                        $sold_qty = $product_sale->sold_qty * $sale_unit_data->operation_value;
                    else
                        $sold_qty = $product_sale->sold_qty / $sale_unit_data->operation_value;
                } else {
                    $sold_qty = $product_sale->sold_qty;
                }
                foreach ($product_purchase_data as $key => $product_purchase) {
                    $purchase_unit_data = Unit::select('operator', 'operation_value')->find($product_purchase->purchase_unit_id);
                    if ($purchase_unit_data->operator == '*')
                        $total_received_qty += $product_purchase->recieved * $purchase_unit_data->operation_value;
                    else
                        $total_received_qty += $product_purchase->recieved / $purchase_unit_data->operation_value;
                    $total_purchased_amount += $product_purchase->total;
                    $total_tax += $product_purchase->tax;
                }
                if ($total_received_qty) {
                    $averageCost = $total_purchased_amount / $total_received_qty;
                    $averageTax = $total_tax / $total_received_qty;
                } else {
                    $averageCost = 0;
                    $averageTax = 0;
                }
                $product_cost += $sold_qty * $averageCost;
                $product_tax += $sold_qty * $averageTax;
            }
        }
        return [$product_cost, $product_tax];
    }

    public function productReport(Request $request)
    {
        $data = $request->all();
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $warehouse_id = $data['warehouse_id'];
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.report.product_report', compact('start_date', 'end_date', 'warehouse_id', 'lims_warehouse_list'));
    }

    public function productReportData(Request $request)
    {

        $lims_product_all = Product::latest()->get();

        if ($request->ajax()) {
            $lims_product_all = Product::latest()->get();
            return Datatables::of($lims_product_all)
                ->addIndexColumn()



                ->addColumn('productname', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $item_code => $variant_id) {
                            $variant_data = Variant::select('variant_name')->find($variant_id);
                            $productname = $row->product_name . ' [' . $variant_data->variant_name . ']' . '<br>' . $item_code;
                            return $productname;
                        }

                    } else {

                        return $row->product_name . '<br>' . $row->product_code;
                    }
                })
                ->addColumn('category', function ($row) {
                    $category = $row->category->name_en;
                    return $category;
                })
                ->addColumn('purchased_amount', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $purchased_amount = ProductPurchase::where([
                                ['product_id', $row->id],
                                ['variant_id', $variant_id]
                            ])->sum('total');
                            return $purchased_amount;
                        }
                    } else {
                        $purchased_amount = ProductPurchase::where('product_id', $row->id)
                            ->sum('total');
                        return $purchased_amount;
                    }

                })
                ->addColumn('purchased_qty', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $lims_product_purchase_data = ProductPurchase::select('purchase_unit_id', 'qty')->where([
                                ['product_id', $row->id],
                                ['variant_id', $variant_id]
                            ])->get();
                            $purchased_qty = 0;
                            if (count($lims_product_purchase_data)) {
                                foreach ($lims_product_purchase_data as $product_purchase) {
                                    $unit = DB::table('units')->find($product_purchase->purchase_unit_id);
                                    if ($unit->operator == '*') {
                                        $purchased_qty += $product_purchase->qty * $unit->operation_value;
                                    } elseif ($unit->operator == '/') {
                                        $purchased_qty += $product_purchase->qty / $unit->operation_value;
                                    }
                                }
                            }
                            return $purchased_qty;
                        }
                    } else {
                        $lims_product_purchase_data = ProductPurchase::select('purchase_unit_id', 'qty')->where([
                            ['product_id', $row->id]
                        ])->get();
                        $purchased_qty = 0;
                        if (count($lims_product_purchase_data)) {
                            foreach ($lims_product_purchase_data as $product_purchase) {
                                $unit = DB::table('units')->find($product_purchase->purchase_unit_id);
                                if ($unit->operator == '*') {
                                    $purchased_qty += $product_purchase->qty * $unit->operation_value;
                                } elseif ($unit->operator == '/') {
                                    $purchased_qty += $product_purchase->qty / $unit->operation_value;
                                }
                            }
                        }
                        return $purchased_qty;
                    }

                })

                ->addColumn('sold_amount', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $sold_amount = ProductSale::where([
                                ['product_id', $row->id],
                                ['variant_id', $variant_id]
                            ])->sum('total');
                            return $sold_amount;
                        }
                    } else {

                        $sold_amount = ProductSale::where([
                            ['product_id', $row->id],
                        ])->sum('total');
                        return $sold_amount;
                    }
                })
                ->addColumn('sold_qty', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $lims_product_sale_data = ProductSale::select('sale_unit_id', 'qty')->where([
                                ['product_id', $row->id],
                                ['variant_id', $variant_id]
                            ])->get();

                            $sold_qty = 0;
                            if (count($lims_product_sale_data)) {
                                foreach ($lims_product_sale_data as $product_sale) {
                                    $unit = DB::table('units')->find($product_sale->sale_unit_id);
                                    if ($unit->operator == '*') {
                                        $sold_qty += $product_sale->qty * $unit->operation_value;
                                    } elseif ($unit->operator == '/') {
                                        $sold_qty += $product_sale->qty / $unit->operation_value;
                                    }
                                }
                            }
                            return $sold_qty;
                        }
                    } else {
                        $lims_product_sale_data = ProductSale::select('sale_unit_id', 'qty')->where([
                            ['product_id', $row->id]
                        ])->get();

                        $sold_qty = 0;
                        if (count($lims_product_sale_data)) {
                            foreach ($lims_product_sale_data as $product_sale) {
                                $unit = DB::table('units')->find($product_sale->sale_unit_id);
                                if ($unit->operator == '*') {
                                    $sold_qty += $product_sale->qty * $unit->operation_value;
                                } elseif ($unit->operator == '/') {
                                    $sold_qty += $product_sale->qty / $unit->operation_value;
                                }
                            }
                        }
                        return $sold_qty;
                    }
                })
                ->addColumn('returned_amount', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $returned_amount = ProductReturn::where([
                                ['product_id', $row->id],
                                ['variant_id', $variant_id]
                            ])->sum('total');
                            return $returned_amount;
                        }
                    } else {
                        $returned_amount = ProductReturn::where([
                            ['product_id', $row->id]
                        ])->sum('total');
                        return $returned_amount;

                    }
                })
                ->addColumn('returned_qty', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $lims_product_return_data = ProductReturn::select('sale_unit_id', 'qty')->where([
                                ['product_id', $row->id],
                                ['product_id', $variant_id]
                            ])->get();

                            $returned_qty = 0;
                            if (count($lims_product_return_data)) {
                                foreach ($lims_product_return_data as $product_return) {
                                    $unit = DB::table('units')->find($product_return->sale_unit_id);
                                    if ($unit->operator == '*') {
                                        $returned_qty += $product_return->qty * $unit->operation_value;
                                    } elseif ($unit->operator == '/') {
                                        $returned_qty += $product_return->qty / $unit->operation_value;
                                    }
                                }
                            }
                            return $returned_qty;
                        }
                    } else {
                        $lims_product_return_data = ProductReturn::select('sale_unit_id', 'qty')->where([
                            ['product_id', $row->id]
                        ])->get();

                        $returned_qty = 0;
                        if (count($lims_product_return_data)) {
                            foreach ($lims_product_return_data as $product_return) {
                                $unit = DB::table('units')->find($product_return->sale_unit_id);
                                if ($unit->operator == '*') {
                                    $returned_qty += $product_return->qty * $unit->operation_value;
                                } elseif ($unit->operator == '/') {
                                    $returned_qty += $product_return->qty / $unit->operation_value;
                                }
                            }
                        }
                        return $returned_qty;
                    }
                })
                ->addColumn('purchase_returned_amount', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $purchase_returned_amount = PurchaseProductReturn::where([
                                ['product_id', $row->id],
                                ['variant_id', $variant_id]
                            ])->sum('total');
                            return $purchase_returned_amount;
                        }
                    } else {
                        $purchase_returned_amount = PurchaseProductReturn::where([
                            ['product_id', $row->id]
                        ])->sum('total');
                        return $purchase_returned_amount;
                    }
                })
                ->addColumn('purchase_returned_qty', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $lims_product_return_data = ProductReturn::select('sale_unit_id', 'qty')->where([
                                ['product_id', $row->id],
                                ['product_id', $variant_id]
                            ])->get();

                            $returned_qty = 0;
                            if (count($lims_product_return_data)) {
                                foreach ($lims_product_return_data as $product_return) {
                                    $unit = DB::table('units')->find($product_return->sale_unit_id);
                                    if ($unit->operator == '*') {
                                        $returned_qty += $product_return->qty * $unit->operation_value;
                                    } elseif ($unit->operator == '/') {
                                        $returned_qty += $product_return->qty / $unit->operation_value;
                                    }
                                }
                            }
                            return $returned_qty;
                        }
                    } else {
                        $lims_product_purchase_return_data = PurchaseProductReturn::select('purchase_unit_id', 'qty')->where([
                            ['product_id', $row->id]
                        ])->get();

                        $purchase_returned_qty = 0;
                        if (count($lims_product_purchase_return_data)) {
                            foreach ($lims_product_purchase_return_data as $product_purchase_return) {
                                $unit = DB::table('units')->find($product_purchase_return->purchase_unit_id);
                                if ($unit->operator == '*') {
                                    $purchase_returned_qty += $product_purchase_return->qty * $unit->operation_value;
                                } elseif ($unit->operator == '/') {
                                    $purchase_returned_qty += $product_purchase_return->qty / $unit->operation_value;
                                }
                            }
                        }
                        return $purchase_returned_qty;
                    }
                })
                ->addColumn('profit', function ($row) {
                    $sold_amount = ProductSale::where([
                        ['product_id', $row->id],
                    ])->sum('total');

                    $purchased_amount = ProductPurchase::where('product_id', $row->id)
                        ->sum('total');

                    $lims_product_purchase_data = ProductPurchase::select('purchase_unit_id', 'qty')->where([
                        ['product_id', $row->id]
                    ])->get();
                    $purchased_qty = 0;
                    if (count($lims_product_purchase_data)) {
                        foreach ($lims_product_purchase_data as $product_purchase) {
                            $unit = DB::table('units')->find($product_purchase->purchase_unit_id);
                            if ($unit->operator == '*') {
                                $purchased_qty += $product_purchase->qty * $unit->operation_value;
                            } elseif ($unit->operator == '/') {
                                $purchased_qty += $product_purchase->qty / $unit->operation_value;
                            }
                        }
                    }

                    $lims_product_sale_data = ProductSale::select('sale_unit_id', 'qty')->where([
                        ['product_id', $row->id]
                    ])->get();
                    $sold_qty = 0;
                    if (count($lims_product_sale_data)) {
                        foreach ($lims_product_sale_data as $product_sale) {
                            $unit = DB::table('units')->find($product_sale->sale_unit_id);
                            if ($unit->operator == '*') {
                                $sold_qty += $product_sale->qty * $unit->operation_value;
                            } elseif ($unit->operator == '/') {
                                $sold_qty += $product_sale->qty / $unit->operation_value;
                            }
                        }
                    }
                    // return $sold_amount .','. $purchased_amount.','.$purchased_qty.','.$sold_qty;
                    if ($purchased_qty > 0) {
                        $profit = $sold_amount - (($purchased_amount / $purchased_qty) * $sold_qty);
                        return $profit;

                    } else {
                        return $sold_amount;
                    }
                })
                ->addColumn('qty', function ($row) {
                    return $row->qty;
                })

                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }

        return view('superadmin.report.product_report.blade', compact('lims_customer_list', 'lims_user_list', 'lims_gift_card_all'));


    }

    public function purchaseReport(Request $request)
    {
        $data = $request->all();
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $warehouse_id = $data['warehouse_id'];
        $product_id = [];
        $variant_id = [];
        $product_name = [];
        $product_qty = [];
        $lims_product_all = Product::select('id', 'product_name', 'qty', 'is_variant')->where('is_active', true)->get();
        foreach ($lims_product_all as $product) {
            $lims_product_purchase_data = null;
            $variant_id_all = [];
            if ($warehouse_id == 0) {
                if ($product->is_variant)
                    $variant_id_all = ProductPurchase::distinct('variant_id')->where('product_id', $product->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->pluck('variant_id');
                else
                    $lims_product_purchase_data = ProductPurchase::where('product_id', $product->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->first();
            } else {
                if ($product->is_variant)
                    $variant_id_all = DB::table('purchases')
                        ->join('product_purchases', 'purchases.id', '=', 'product_purchases.purchase_id')
                        ->distinct('variant_id')
                        ->where([
                            ['product_purchases.product_id', $product->id],
                            ['purchases.warehouse_id', $warehouse_id]
                        ])->whereDate('purchases.created_at', '>=', $start_date)
                        ->whereDate('purchases.created_at', '<=', $end_date)
                        ->pluck('variant_id');
                else
                    $lims_product_purchase_data = DB::table('purchases')
                        ->join('product_purchases', 'purchases.id', '=', 'product_purchases.purchase_id')->where([
                                ['product_purchases.product_id', $product->id],
                                ['purchases.warehouse_id', $warehouse_id]
                            ])->whereDate('purchases.created_at', '>=', $start_date)
                        ->whereDate('purchases.created_at', '<=', $end_date)
                        ->first();
            }

            if ($lims_product_purchase_data) {
                $product_name[] = $product->name;
                $product_id[] = $product->id;
                $variant_id[] = null;
                if ($warehouse_id == 0)
                    $product_qty[] = $product->qty;
                else
                    $product_qty[] = ProductWarehouse::where([
                        ['product_id', $product->id],
                        ['warehouse_id', $warehouse_id]
                    ])->sum('qty');
            } elseif (count($variant_id_all)) {
                foreach ($variant_id_all as $key => $variantId) {
                    $variant_data = Variant::find($variantId);
                    $product_name[] = $product->product_name . ' [' . $variant_data->variant_name . ']';
                    $product_id[] = $product->id;
                    $variant_id[] = $variant_data->id;
                    if ($warehouse_id == 0)
                        $product_qty[] = ProductVariant::FindExactProduct($product->id, $variant_data->id)->first()->qty;
                    else
                        $product_qty[] = ProductWarehouse::where([
                            ['product_id', $product->id],
                            ['variant_id', $variant_data->id],
                            ['warehouse_id', $warehouse_id]
                        ])->first()->qty;

                }
            }
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.report.purchase_report', compact('product_id', 'variant_id', 'product_name', 'product_qty', 'start_date', 'end_date', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function saleReport(Request $request)
    {
        $data = $request->all();
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $warehouse_id = $data['warehouse_id'];
        $product_id = [];
        $variant_id = [];
        $product_name = [];
        $product_qty = [];
        $lims_product_all = Product::select('id', 'product_name', 'qty', 'is_variant')->where('is_active', true)->get();

        foreach ($lims_product_all as $product) {
            $lims_product_sale_data = null;
            $variant_id_all = [];
            if ($warehouse_id == 0) {
                if ($product->is_variant)
                    $variant_id_all = ProductSale::distinct('variant_id')->where('product_id', $product->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->pluck('variant_id');
                else
                    $lims_product_sale_data = ProductSale::where('product_id', $product->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->first();
            } else {
                if ($product->is_variant)
                    $variant_id_all = DB::table('sales')
                        ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
                        ->distinct('variant_id')
                        ->where([
                            ['product_sales.product_id', $product->id],
                            ['sales.warehouse_id', $warehouse_id]
                        ])->whereDate('sales.created_at', '>=', $start_date)
                        ->whereDate('sales.created_at', '<=', $end_date)
                        ->pluck('variant_id');
                else
                    $lims_product_sale_data = DB::table('sales')
                        ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')->where([
                                ['product_sales.product_id', $product->id],
                                ['sales.warehouse_id', $warehouse_id]
                            ])->whereDate('sales.created_at', '>=', $start_date)
                        ->whereDate('sales.created_at', '<=', $end_date)
                        ->first();
            }
            if ($lims_product_sale_data) {
                $product_name[] = $product->product_name;
                $product_id[] = $product->id;
                $variant_id[] = null;
                if ($warehouse_id == 0)
                    $product_qty[] = $product->qty;
                else {
                    $product_qty[] = ProductWarehouse::where([
                        ['product_id', $product->id],
                        ['warehouse_id', $warehouse_id]
                    ])->sum('qty');
                }
            } elseif (count($variant_id_all)) {
                foreach ($variant_id_all as $key => $variantId) {
                    $variant_data = Variant::find($variantId);
                    $product_name[] = $product->product_name . ' [' . $variant_data->variant_name . ']';
                    $product_id[] = $product->id;
                    $variant_id[] = $variant_data->id;
                    if ($warehouse_id == 0)
                        $product_qty[] = ProductVariant::FindExactProduct($product->id, $variant_data->id)->first()->qty;
                    else
                        $product_qty[] = ProductWarehouse::where([
                            ['product_id', $product->id],
                            ['variant_id', $variant_data->id],
                            ['warehouse_id', $warehouse_id]
                        ])->first()->qty;

                }
            }
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.report.sale_report', compact('product_id', 'variant_id', 'product_name', 'product_qty', 'start_date', 'end_date', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function saleReportChart(Request $request)
    {
        $start_date = $request->start_date;
        $end_date = strtotime($request->end_date);
        $warehouse_id = $request->warehouse_id;
        $time_period = $request->time_period;
        if ($time_period == 'monthly') {
            for ($i = strtotime($start_date); $i <= $end_date; $i = strtotime('+1 month', $i)) {
                $date_points[] = date('Y-m-d', $i);
            }
        } else {
            for ($i = strtotime('Saturday', strtotime($start_date)); $i <= $end_date; $i = strtotime('+1 week', $i)) {
                $date_points[] = date('Y-m-d', $i);
            }
        }
        $date_points[] = $request->end_date;
        //return $date_points;
        foreach ($date_points as $key => $date_point) {
            $q = DB::table('sales')
                ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
                ->whereDate('sales.created_at', '>=', $start_date)
                ->whereDate('sales.created_at', '<', $date_point);
            if ($warehouse_id)
                $qty = $q->where('sales.warehouse_id', $warehouse_id);
            if (isset($request->product_list)) {
                $product_ids = Product::whereIn('code', explode(",", trim($request->product_list)))->pluck('id')->toArray();
                $q->whereIn('product_sales.product_id', $product_ids);
            }
            $qty = $q->sum('product_sales.qty');
            $sold_qty[$key] = $qty;
            $start_date = $date_point;
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->select('id', 'name')->get();
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        return view('superadmin.report.sale_report_chart', compact('start_date', 'end_date', 'warehouse_id', 'time_period', 'sold_qty', 'date_points', 'lims_warehouse_list'));
    }

    public function paymentReportByDate(Request $request)
    {
        $data = $request->all();
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];

        $lims_payment_data = Payment::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->get();
        return view('superadmin.report.payment_report', compact('lims_payment_data', 'start_date', 'end_date'));
    }

    public function warehouseReport(Request $request)
    {
        $data = $request->all();
        $warehouse_id = $data['warehouse_id'];
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];

        $lims_purchase_data = Purchase::where('warehouse_id', $warehouse_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_sale_data = Sale::with('customer')->where('warehouse_id', $warehouse_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_quotation_data = Quotation::with('customer')->where('warehouse_id', $warehouse_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_return_data = Returns::with('customer', 'biller')->where('warehouse_id', $warehouse_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_expense_data = Expense::with('expenseCategory')->where('warehouse_id', $warehouse_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();

        $lims_product_purchase_data = [];
        $lims_product_sale_data = [];
        $lims_product_quotation_data = [];
        $lims_product_return_data = [];

        foreach ($lims_purchase_data as $key => $purchase) {
            $lims_product_purchase_data[$key] = ProductPurchase::where('purchase_id', $purchase->id)->get();
        }
        foreach ($lims_sale_data as $key => $sale) {
            $lims_product_sale_data[$key] = ProductSale::where('sale_id', $sale->id)->get();
        }
        foreach ($lims_quotation_data as $key => $quotation) {
            $lims_product_quotation_data[$key] = ProductQuotation::where('quotation_id', $quotation->id)->get();
        }
        foreach ($lims_return_data as $key => $return) {
            $lims_product_return_data[$key] = ProductReturn::where('return_id', $return->id)->get();
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.report.warehouse_report', compact('warehouse_id', 'start_date', 'end_date', 'lims_purchase_data', 'lims_product_purchase_data', 'lims_sale_data', 'lims_product_sale_data', 'lims_warehouse_list', 'lims_quotation_data', 'lims_product_quotation_data', 'lims_return_data', 'lims_product_return_data', 'lims_expense_data'));
    }

    public function userReport(Request $request)
    {
        $data = $request->all();
        $user_id = $data['user_id'];
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $lims_product_sale_data = [];
        $lims_product_purchase_data = [];
        $lims_product_quotation_data = [];
        $lims_product_transfer_data = [];

        $lims_sale_data = Sale::with('customer', 'warehouse')->where('user_id', $user_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_purchase_data = Purchase::with('warehouse')->where('user_id', $user_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_quotation_data = Quotation::with('customer', 'warehouse')->where('user_id', $user_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_transfer_data = Transfer::with('fromWarehouse', 'toWarehouse')->where('user_id', $user_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_payment_data = DB::table('payments')
            ->where('user_id', $user_id)
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)
            ->orderBy('created_at', 'desc')
            ->get();
        $lims_expense_data = Expense::with('warehouse', 'expenseCategory')->where('user_id', $user_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_payroll_data = Payroll::with('employee')->where('user_id', $user_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();

        foreach ($lims_sale_data as $key => $sale) {
            $lims_product_sale_data[$key] = ProductSale::where('sale_id', $sale->id)->get();
        }
        foreach ($lims_purchase_data as $key => $purchase) {
            $lims_product_purchase_data[$key] = ProductPurchase::where('purchase_id', $purchase->id)->get();
        }
        foreach ($lims_quotation_data as $key => $quotation) {
            $lims_product_quotation_data[$key] = ProductQuotation::where('quotation_id', $quotation->id)->get();
        }
        foreach ($lims_transfer_data as $key => $transfer) {
            $lims_product_transfer_data[$key] = ProductTransfer::where('transfer_id', $transfer->id)->get();
        }

        $lims_user_list = User::where('is_active', true)->get();
        return view('superadmin.report.user_report', compact('lims_sale_data', 'user_id', 'start_date', 'end_date', 'lims_product_sale_data', 'lims_payment_data', 'lims_user_list', 'lims_purchase_data', 'lims_product_purchase_data', 'lims_quotation_data', 'lims_product_quotation_data', 'lims_transfer_data', 'lims_product_transfer_data', 'lims_expense_data', 'lims_payroll_data'));
    }

    public function customerReport(Request $request)
    {
        $data = $request->all();
        $customer_id = $data['customer_id'];
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $lims_sale_data = Sale::with('warehouse')->where('customer_id', $customer_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_quotation_data = Quotation::with('warehouse')->where('customer_id', $customer_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_return_data = Returns::with('warehouse', 'biller')->where('customer_id', $customer_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_payment_data = DB::table('payments')
            ->join('sales', 'payments.sale_id', '=', 'sales.id')
            ->where('customer_id', $customer_id)
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)
            ->select('payments.*', 'sales.reference_no as sale_reference')
            ->orderBy('payments.created_at', 'desc')
            ->get();

        $lims_product_sale_data = [];
        $lims_product_quotation_data = [];
        $lims_product_return_data = [];

        foreach ($lims_sale_data as $key => $sale) {
            $lims_product_sale_data[$key] = ProductSale::where('sale_id', $sale->id)->get();
        }
        foreach ($lims_quotation_data as $key => $quotation) {
            $lims_product_quotation_data[$key] = ProductQuotation::where('quotation_id', $quotation->id)->get();
        }
        foreach ($lims_return_data as $key => $return) {
            $lims_product_return_data[$key] = ProductReturn::where('return_id', $return->id)->get();
        }
        $lims_customer_list = Customer::where('is_active', true)->get();
        return view('superadmin.report.customer_report', compact('lims_sale_data', 'customer_id', 'start_date', 'end_date', 'lims_product_sale_data', 'lims_payment_data', 'lims_customer_list', 'lims_quotation_data', 'lims_product_quotation_data', 'lims_return_data', 'lims_product_return_data'));
    }

    public function supplierReport(Request $request)
    {
        $data = $request->all();
        $supplier_id = $data['supplier_id'];
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $lims_purchase_data = Purchase::with('warehouse')->where('supplier_id', $supplier_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_quotation_data = Quotation::with('warehouse', 'customer')->where('supplier_id', $supplier_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_return_data = ReturnPurchase::with('warehouse')->where('supplier_id', $supplier_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_payment_data = DB::table('payments')
            ->join('purchases', 'payments.purchase_id', '=', 'purchases.id')
            ->where('supplier_id', $supplier_id)
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)
            ->select('payments.*', 'purchases.reference_no as purchase_reference')
            ->orderBy('payments.created_at', 'desc')
            ->get();

        $lims_product_purchase_data = [];
        $lims_product_quotation_data = [];
        $lims_product_return_data = [];

        foreach ($lims_purchase_data as $key => $purchase) {
            $lims_product_purchase_data[$key] = ProductPurchase::where('purchase_id', $purchase->id)->get();
        }
        foreach ($lims_return_data as $key => $return) {
            $lims_product_return_data[$key] = PurchaseProductReturn::where('return_id', $return->id)->get();
        }
        foreach ($lims_quotation_data as $key => $quotation) {
            $lims_product_quotation_data[$key] = ProductQuotation::where('quotation_id', $quotation->id)->get();
        }
        $lims_supplier_list = Supplier::where('is_active', true)->get();
        return view('superadmin.report.supplier_report', compact('lims_purchase_data', 'lims_product_purchase_data', 'lims_payment_data', 'supplier_id', 'start_date', 'end_date', 'lims_supplier_list', 'lims_quotation_data', 'lims_product_quotation_data', 'lims_return_data', 'lims_product_return_data'));
    }

    public function customerDueReportByDate(Request $request)
    {
        $data = $request->all();
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $q = Sale::where('payment_status', '!=', 4)
            ->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date);
        if ($request->customer_id)
            $q = $q->where('customer_id', $request->customer_id);
        $lims_sale_data = $q->get();
        return view('superadmin.report.due_report', compact('lims_sale_data', 'start_date', 'end_date'));
    }

    public function supplierDueReportByDate(Request $request)
    {
        $data = $request->all();
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $q = Purchase::where('payment_status', 1)
            ->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date);
        if ($request->supplier_id)
            $q = $q->where('supplier_id', $request->supplier_id);
        $lims_purchase_data = $q->get();
        return view('superadmin.report.supplier_due_report', compact('lims_purchase_data', 'start_date', 'end_date'));
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
        return view('superAdmin.media.index', compact('data'));
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
}