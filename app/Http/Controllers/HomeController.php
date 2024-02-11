<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \Illuminate\Support\Facades\DB;
use \Illuminate\Support\Facades\Auth;
use Cache;
use PDF;
use Printing;
use Rawilk\Printing\Contracts\Printer;
use Spatie\Permission\Models\Role;
use Stripe\Stripe;
use App\Models\{
    Unit,
    Account,
    Product,
    Purchase,
    ProductPurchase,
    ReturnPurchase,
    Sale,
    Customer,
    ProductSale,
    RewardPointSetting,
    Returns,
    Payment,
    Quotation,
    Payroll,
    Expense,
    ExpenseCategory,

    ProductWarehouse,
};

use \App\Traits\AutoUpdateTrait;


class HomeController extends Controller
{
    use AutoUpdateTrait;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        //making strict mode false for this query
        config()->set('database.connections.mysql.strict', false);
        DB::reconnect();
        if(Auth::user()->role_id == 5) {
            $customer = Customer::select('id', 'points')->where('user_id', Auth::id())->first();
            $lims_sale_data = Sale::with('warehouse')->where('customer_id', $customer->id)->orderBy('created_at', 'desc')->get();
            $lims_payment_data = DB::table('payments')
                        ->join('sales', 'payments.sale_id', '=', 'sales.id')
                        ->where('customer_id', $customer->id)
                        ->select('payments.*', 'sales.reference_no as sale_reference')
                        ->orderBy('payments.created_at', 'desc')
                        ->get();
            $lims_quotation_data = Quotation::with('biller', 'customer', 'supplier', 'user')->orderBy('id', 'desc')->where('customer_id', $customer->id)->orderBy('created_at', 'desc')->get();

            $lims_return_data = Returns::with('warehouse', 'customer', 'biller')->where('customer_id', $customer->id)->orderBy('created_at', 'desc')->get();
            $lims_reward_point_setting_data = RewardPointSetting::select('per_point_amount')->latest()->first();
            return view('customer_index', compact('customer', 'lims_sale_data', 'lims_payment_data', 'lims_quotation_data', 'lims_return_data', 'lims_reward_point_setting_data'));
        }
        $start_date = date("Y").'-'.date("m").'-'.'01';
        $end_date = date("Y").'-'.date("m").'-'.date('t', mktime(0, 0, 0, date("m"), 1, date("Y")));
        $yearly_sale_amount = [];

        $general_setting = DB::table('general_settings')->latest()->first();
        if(Auth::user()->role_id > 2 && $general_setting->staff_access == 'own') {
            $product_sale_data = Sale::join('product_sales', 'sales.id','=', 'product_sales.sale_id')
                ->select(DB::raw('product_sales.product_id, product_sales.product_batch_id, product_sales.sale_unit_id, sum(product_sales.qty) as sold_qty, sum(product_sales.total) as sold_amount'))
                ->where('sales.user_id', Auth::id())
                ->whereDate('product_sales.created_at', '>=' , $start_date)
                ->whereDate('product_sales.created_at', '<=' , $end_date)
                ->groupBy('product_sales.product_id', 'product_sales.product_batch_id')
                ->get();
            $product_cost = $this->calculateAverageCOGS($product_sale_data);
            $revenue = Sale::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $return = Returns::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $purchase_return = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $revenue = $revenue - $return;
            $purchase = Purchase::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $profit = $revenue + $purchase_return - $product_cost;
            $expense = Expense::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('amount');
            $recent_sale = Sale::with('customer')->orderBy('id', 'desc')->where('user_id', Auth::id())->take(5)->get();
            $recent_purchase = Purchase::with('supplier')->orderBy('id', 'desc')->where('user_id', Auth::id())->take(5)->get();
            $recent_quotation = Quotation::with('customer')->orderBy('id', 'desc')->where('user_id', Auth::id())->take(5)->get();
            $recent_payment = Payment::orderBy('id', 'desc')->where('user_id', Auth::id())->take(5)->get();
        }else {
            $product_sale_data = ProductSale::select(DB::raw('product_id, product_batch_id, sale_unit_id, sum(qty) as sold_qty, sum(total) as sold_amount'))->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->groupBy('product_id', 'product_batch_id')->get();
            $product_cost = $this->calculateAverageCOGS($product_sale_data);
            $revenue = Sale::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $return = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $purchase_return = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $revenue = $revenue - $return;
            $purchase = Purchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $profit = $revenue + $purchase_return - $product_cost;
            $expense = Expense::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
            $recent_sale = Sale::with('customer')->orderBy('id', 'desc')->take(5)->get();
            $recent_purchase = Purchase::with('supplier')->orderBy('id', 'desc')->take(5)->get();
            $recent_quotation = Quotation::with('customer')->orderBy('id', 'desc')->take(5)->get();
            $recent_payment = Payment::orderBy('id', 'desc')->take(5)->get();
        }

        $best_selling_qty = ProductSale::join('products', 'products.id', '=', 'product_sales.product_id')
                            ->select(DB::raw('products.product_name as product_name, products.product_code as product_code, products.product_image as product_images, sum(product_sales.qty) as sold_qty'))
                            ->whereDate('product_sales.created_at', '>=' , $start_date)
                            ->whereDate('product_sales.created_at', '<=' , $end_date)
                            ->groupBy('products.product_code')
                            ->orderBy('sold_qty', 'desc')
                            ->take(5)
                            ->get();

        $yearly_best_selling_qty = ProductSale::join('products', 'products.id', '=', 'product_sales.product_id')
                                    ->select(DB::raw('products.product_name as product_name, products.product_code as product_code, products.product_image as product_images, sum(product_sales.qty) as sold_qty'))
                                    ->whereDate('product_sales.created_at', '>=' , date("Y").'-01-01')
                                    ->whereDate('product_sales.created_at', '<=' , date("Y").'-12-31')
                                    ->groupBy('products.product_code')
                                    ->orderBy('sold_qty', 'desc')
                                    ->take(5)
                                    ->get();

        $yearly_best_selling_price = ProductSale::join('products', 'products.id', '=', 'product_sales.product_id')
                                    ->select(DB::raw('products.product_name as product_name, products.product_code as product_code, products.product_image as product_images, sum(total) as total_price'))
                                    ->whereDate('product_sales.created_at', '>=' , date("Y").'-01-01')
                                    ->whereDate('product_sales.created_at', '<=' , date("Y").'-12-31')
                                    ->groupBy('products.product_code')
                                    ->orderBy('total_price', 'desc')
                                    ->take(5)
                                    ->get();
        //cash flow of last 6 months
        $start = strtotime(date('Y-m-01', strtotime('-6 month', strtotime(date('Y-m-d') ))));
        $end = strtotime(date('Y-m-'.date('t', mktime(0, 0, 0, date("m"), 1, date("Y")))));

        while($start < $end)
        {
            $start_date = date("Y-m", $start).'-'.'01';
            $end_date = date("Y-m", $start).'-'.date('t', mktime(0, 0, 0, date("m", $start), 1, date("Y", $start)));

            if(Auth::user()->role_id > 2 && $general_setting->staff_access == 'own') {
                $recieved_amount = DB::table('payments')->whereNotNull('sale_id')->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('amount');
                $sent_amount = DB::table('payments')->whereNotNull('purchase_id')->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('amount');
                $return_amount = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
                $purchase_return_amount = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
                $expense_amount = Expense::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('amount');
                $payroll_amount = Payroll::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('amount');
            }
            else {
                $recieved_amount = DB::table('payments')->whereNotNull('sale_id')->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
                $sent_amount = DB::table('payments')->whereNotNull('purchase_id')->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
                $return_amount = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
                $purchase_return_amount = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
                $expense_amount = Expense::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
                $payroll_amount = Payroll::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
            }
            $sent_amount = $sent_amount + $return_amount + $expense_amount + $payroll_amount;

            $payment_recieved[] = number_format((float)($recieved_amount + $purchase_return_amount), 2, '.', '');
            $payment_sent[] = number_format((float)$sent_amount, 2, '.', '');
            $month[] = date("F", strtotime($start_date));
            $start = strtotime("+1 month", $start);
        }
        // yearly report
        $start = strtotime(date("Y") .'-01-01');
        $end = strtotime(date("Y") .'-12-31');
        while($start < $end)
        {
            $start_date = date("Y").'-'.date('m', $start).'-'.'01';
            $end_date = date("Y").'-'.date('m', $start).'-'.date('t', mktime(0, 0, 0, date("m", $start), 1, date("Y", $start)));
            if(Auth::user()->role_id > 2 && $general_setting->staff_access == 'own') {
                $sale_amount = Sale::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
                $purchase_amount = Purchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
            }
            else{
                $sale_amount = Sale::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
                $purchase_amount = Purchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            }
            $yearly_sale_amount[] = number_format((float)$sale_amount, 2, '.', '');
            $yearly_purchase_amount[] = number_format((float)$purchase_amount, 2, '.', '');
            $start = strtotime("+1 month", $start);
        }
        //making strict mode true for this query
        config()->set('database.connections.mysql.strict', true);
        DB::reconnect();
        return view('index', compact('revenue', 'purchase', 'expense', 'return', 'purchase_return', 'profit', 'payment_recieved', 'payment_sent', 'month', 'yearly_sale_amount', 'yearly_purchase_amount', 'recent_sale', 'recent_purchase', 'recent_quotation', 'recent_payment', 'best_selling_qty', 'yearly_best_selling_qty', 'yearly_best_selling_price'));
    }

    public function documentation()
    {
        $general_setting =  Cache::remember('general_setting', 60*60*24*365, function () {
            return DB::table('general_settings')->latest()->first();
        });
        return view('backend.documentation', compact('general_setting'));
    }

    public function addonList()
    {
        return view('backend.addonlist');
    }

    public function dashboard()
    {
        /*$headers = array(
            "Authorization: Bearer kRHXREZr1SmBu32lSZ26GB6VlyKhjWLpDOB",
            "Content-Type: application/json",
            "cache-control: no-cache"
        );
        $params = [
            "sender" => "SEWI PAY",
            "content" => "Hello akdjohnson",
            "dlrUrl" => "",
            "recipients" => ["2250709134185"]
        ];
        $params = json_encode($params);
        $url = "https://api.smscloud.ci/v1/campaigns";
        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, TRUE);
        curl_setopt($curl, CURLOPT_POST, TRUE);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $params);
        $resp = curl_exec($curl);
        curl_close($curl);
        return dd($resp);*/
        //return \Auth::user()->unreadNotifications->where('data.reminder_date', date('Y-m-d'));
        //making strict mode false for this query
        config()->set('database.connections.mysql.strict', false);
        DB::reconnect();
        if(Auth::user()->role_id == 5) {
            $customer = Customer::select('id', 'points')->where('user_id', Auth::id())->first();
            $lims_sale_data = Sale::with('warehouse')->where('customer_id', $customer->id)->orderBy('created_at', 'desc')->get();
            $lims_payment_data = DB::table('payments')
                           ->join('sales', 'payments.sale_id', '=', 'sales.id')
                           ->where('customer_id', $customer->id)
                           ->select('payments.*', 'sales.reference_no as sale_reference')
                           ->orderBy('payments.created_at', 'desc')
                           ->get();
            $lims_quotation_data = Quotation::with('biller', 'customer', 'supplier', 'user')->orderBy('id', 'desc')->where('customer_id', $customer->id)->orderBy('created_at', 'desc')->get();

            $lims_return_data = Returns::with('warehouse', 'customer', 'biller')->where('customer_id', $customer->id)->orderBy('created_at', 'desc')->get();
            $lims_reward_point_setting_data = RewardPointSetting::select('per_point_amount')->latest()->first();
            return view('superadmin.customer_index', compact('customer', 'lims_sale_data', 'lims_payment_data', 'lims_quotation_data', 'lims_return_data', 'lims_reward_point_setting_data'));
        }

        $start_date = date("Y").'-'.date("m").'-'.'01';
        $end_date = date("Y").'-'.date("m").'-'.date('t', mktime(0, 0, 0, date("m"), 1, date("Y")));
        $yearly_sale_amount = [];

        if(Auth::user()->role_id > 2 && cache()->get('general_setting')->staff_access == 'own')
        {
            $product_sale_data = Sale::join('product_sales', 'sales.id','=', 'product_sales.sale_id')
                ->select(DB::raw('product_sales.product_id, product_sales.product_batch_id, product_sales.sale_unit_id, sum(product_sales.qty) as sold_qty, sum(product_sales.return_qty) as return_qty, sum(product_sales.total) as sold_amount'))
                ->where('sales.user_id', Auth::id())
                ->whereDate('sales.created_at', '>=' , $start_date)
                ->whereDate('sales.created_at', '<=' , $end_date)
                ->groupBy('product_sales.product_id', 'product_sales.product_batch_id')
                ->get();
            $product_cost = $this->calculateAverageCOGS($product_sale_data);
            $revenue = Sale::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum(DB::raw('grand_total - shipping_cost'));
            $return = Returns::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $purchase_return = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $revenue = $revenue - $return;
            $purchase = Purchase::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $profit = $revenue + $purchase_return - $product_cost;
            $expense = Expense::whereDate('created_at', '>=' , $start_date)->where('user_id', Auth::id())->whereDate('created_at', '<=' , $end_date)->sum('amount');
        }
        else
        {
            $product_sale_data = ProductSale::join('sales', 'product_sales.sale_id', '=', 'sales.id')
                                ->select(DB::raw('product_sales.product_id, product_sales.product_batch_id, product_sales.sale_unit_id, sum(product_sales.qty) as sold_qty, sum(product_sales.return_qty) as return_qty, sum(product_sales.total) as sold_amount'))
                                ->whereDate('sales.created_at', '>=' , $start_date)
                                ->whereDate('sales.created_at', '<=' , $end_date)
                                ->groupBy('product_sales.product_id', 'product_sales.product_batch_id')
                                ->get();
            $product_cost = $this->calculateAverageCOGS($product_sale_data);
            $revenue = Sale::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum(DB::raw('grand_total - shipping_cost'));
            $return = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $purchase_return = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $revenue = $revenue - $return;
            $purchase = Purchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $profit = $revenue + $purchase_return - $product_cost;
            $expense = Expense::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
        }

        //cash flow of last 6 months
        $start = strtotime(date('Y-m-01', strtotime('-6 month', strtotime(date('Y-m-d') ))));
        $end = strtotime(date('Y-m-'.date('t', mktime(0, 0, 0, date("m"), 1, date("Y")))));

        while($start < $end)
        {
            $start_date = date("Y-m", $start).'-'.'01';
            $end_date = date("Y-m", $start).'-'.date('t', mktime(0, 0, 0, date("m", $start), 1, date("Y", $start)));

            if(Auth::user()->role_id > 2 && cache()->get('general_setting')->staff_access == 'own') {
                $recieved_amount = DB::table('payments')->whereNotNull('sale_id')->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('amount');
                $sent_amount = DB::table('payments')->whereNotNull('purchase_id')->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('amount');
                $return_amount = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
                $purchase_return_amount = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
                $expense_amount = Expense::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('amount');
                $payroll_amount = Payroll::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('amount');
            }
            else {
                $recieved_amount = DB::table('payments')->whereNotNull('sale_id')->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
                $sent_amount = DB::table('payments')->whereNotNull('purchase_id')->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
                $return_amount = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
                $purchase_return_amount = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
                $expense_amount = Expense::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
                $payroll_amount = Payroll::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('amount');
            }
            $sent_amount = $sent_amount + $return_amount + $expense_amount + $payroll_amount;

            $payment_recieved[] = number_format((float)($recieved_amount + $purchase_return_amount), config('decimal'), '.', '');
            $payment_sent[] = number_format((float)$sent_amount, config('decimal'), '.', '');
            $month[] = date("F", strtotime($start_date));
            $start = strtotime("+1 month", $start);
        }
        // yearly report
        $start = strtotime(date("Y") .'-01-01');
        $end = strtotime(date("Y") .'-12-31');
        while($start < $end)
        {
            $start_date = date("Y").'-'.date('m', $start).'-'.'01';
            $end_date = date("Y").'-'.date('m', $start).'-'.date('t', mktime(0, 0, 0, date("m", $start), 1, date("Y", $start)));
            if(Auth::user()->role_id > 2 && cache()->get('general_setting')->staff_access == 'own') {
                $sale_amount = Sale::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
                $purchase_amount = Purchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
            }
            else{
                $sale_amount = Sale::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
                $purchase_amount = Purchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            }
            $yearly_sale_amount[] = number_format((float)$sale_amount, config('decimal'), '.', '');
            $yearly_purchase_amount[] = number_format((float)$purchase_amount, config('decimal'), '.', '');
            $start = strtotime("+1 month", $start);
        }
        //making strict mode true for this query
        config()->set('database.connections.mysql.strict', true);
        DB::reconnect();
        //fetching data for auto updates
        if(Auth::user()->role_id <= 2 && isset($_COOKIE['login_now']) && $_COOKIE['login_now']) {
            $autoUpdateData = $this->general();
            $alertBugEnable =  $autoUpdateData['alertBugEnable'];
            $alertVersionUpgradeEnable = $autoUpdateData['alertVersionUpgradeEnable'];
        }
        else {
            $autoUpdateData = $alertBugEnable = $alertVersionUpgradeEnable = '';
        }
        return view('superadmin.index', compact('revenue', 'purchase', 'expense', 'return', 'purchase_return', 'profit', 'payment_recieved', 'payment_sent', 'month', 'yearly_sale_amount', 'yearly_purchase_amount', 'alertBugEnable','alertVersionUpgradeEnable'));
    }

    public function yearlyBestSellingPrice()
    {
        //making strict mode false for this query
        config()->set('database.connections.mysql.strict', false);
        DB::reconnect();
        $yearly_best_selling_price = ProductSale::join('products', 'products.id', '=', 'product_sales.product_id')
        ->select(DB::raw('products.product_name as product_name, products.product_code as product_code, products.product_image as product_images, sum(total) as total_price'))
        ->whereDate('product_sales.created_at', '>=' , date("Y").'-01-01')
        ->whereDate('product_sales.created_at', '<=' , date("Y").'-12-31')
        ->groupBy('products.product_code')
        ->orderBy('total_price', 'desc')
        ->take(5)
        ->get();

        return response()->json($yearly_best_selling_price);
    }

    public function yearlyBestSellingQty()
    {
        // dd("kk");
        // making strict mode false for this query
        config()->set('database.connections.mysql.strict', false);
        DB::reconnect();
        $yearly_best_selling_qty = ProductSale::join('products', 'products.id', '=', 'product_sales.product_id')
        ->select(DB::raw('products.product_name as product_name, products.product_code as product_code, products.product_image as product_images, sum(product_sales.qty) as sold_qty'))
        ->whereDate('product_sales.created_at', '>=' , date("Y").'-01-01')
        ->whereDate('product_sales.created_at', '<=' , date("Y").'-12-31')
        ->groupBy('products.product_name')
        ->orderBy('sold_qty', 'desc')
        ->take(5)
        ->get();

        return response()->json($yearly_best_selling_qty);
    }

    public function monthlyBestSellingQty()
    {
        //making strict mode false for this query
        config()->set('database.connections.mysql.strict', false);
        DB::reconnect();
        $start_date = date("Y").'-'.date("m").'-'.'01';
        $end_date = date("Y").'-'.date("m").'-'.date('t', mktime(0, 0, 0, date("m"), 1, date("Y")));
        $best_selling_qty = ProductSale::join('products', 'products.id', '=', 'product_sales.product_id')
        ->select(DB::raw('products.product_name as product_name, products.product_code as product_code, products.product_image as product_images, sum(product_sales.qty) as sold_qty'))
        ->whereDate('product_sales.created_at', '>=' , $start_date)
        ->whereDate('product_sales.created_at', '<=' , $end_date)
        ->groupBy('products.product_code')
        ->orderBy('sold_qty', 'desc')
        ->take(5)
        ->get();

        return response()->json($best_selling_qty);
    }

    public function recentSale()
    {
        $recent_sale = Sale::join('customers', 'customers.id', '=', 'sales.customer_id')->select('sales.id','sales.reference_no','sales.sale_status','sales.created_at','sales.grand_total','sales.user_id','customers.name')->orderBy('id', 'desc')->where('sales.user_id', Auth::id())->take(5)->get();
        return response()->json($recent_sale);

        // if(cache()->get('general_setting')->staff_access == 'own')
        // {
        // }
        // else
        // {
        //     $recent_sale = Sale::join('customers', 'customers.id', '=', 'sales.customer_id')->select('sales.id','sales.reference_no','sales.sale_status','sales.created_at','sales.grand_total','customers.name')->orderBy('id', 'desc')->take(5)->get();
        //     return response()->json($recent_sale);
        // }
    }

    public function recentPurchase()
    {
        $recent_purchase = Purchase::join('suppliers', 'suppliers.id', '=', 'purchases.supplier_id')->select('purchases.id','purchases.reference_no','purchases.payment_status','purchases.created_at','purchases.grand_total','purchases.user_id','suppliers.name')->orderBy('id', 'desc')->where('purchases.user_id', Auth::id())->take(5)->get();
        return response()->json($recent_purchase);

        // if(cache()->get('general_setting')->staff_access == 'own')
        // {
        // }
        // else
        // {
        //     $recent_purchase = Purchase::join('suppliers', 'suppliers.id', '=', 'purchases.supplier_id')->select('purchases.id','purchases.reference_no','purchases.payment_status','purchases.created_at','purchases.grand_total','suppliers.name')->orderBy('id', 'desc')->take(5)->get();
        //     return response()->json($recent_purchase);
        // }
    }

    public function recentQuotation()
    {
        $recent_quotation = Quotation::join('customers', 'customers.id', '=', 'quotations.customer_id')->select('quotations.id','quotations.reference_no','quotations.quotation_status','quotations.created_at','quotations.grand_total','quotations.user_id','customers.name')->orderBy('id', 'desc')->where('quotations.user_id', Auth::id())->take(5)->get();
        return response()->json($recent_quotation);
        // if(cache()->get('general_setting')->staff_access == 'own')
        // {
        // }
        // else
        // {
        //     $recent_quotation = Quotation::join('customers', 'customers.id', '=', 'quotations.customer_id')->select('quotations.id','quotations.reference_no','quotations.quotation_status','quotations.created_at','quotations.grand_total','customers.name')->orderBy('id', 'desc')->take(5)->get();
        //     return response()->json($recent_quotation);
        // }
    }

    public function recentPayment()
    {
        $recent_payment = Payment::select('id','payment_reference','amount','paying_method','created_at','user_id')->orderBy('id', 'desc')->where('user_id', Auth::id())->take(5)->get();
        return response()->json($recent_payment);

        // if(cache()->get('general_setting')->staff_access == 'own')
        // {
        // }
        // else
        // {
        //     $recent_payment = Payment::select('id','payment_reference','amount','paying_method','created_at')->orderBy('id', 'desc')->take(5)->get();
        //     return response()->json($recent_payment);
        // }
    }
    public function dashboardFilter($start_date, $end_date)
    {
        $general_setting = DB::table('general_settings')->latest()->first();
        if($general_setting->staff_access == 'own') {
            config()->set('database.connections.mysql.strict', false);
            DB::reconnect();
            $product_sale_data = Sale::join('product_sales', 'sales.id','=', 'product_sales.sale_id')
                ->select(DB::raw('product_sales.product_id, product_sales.product_batch_id, sale_unit_id, sum(product_sales.qty) as sold_qty, sum(product_sales.total) as sold_amount'))
                ->where('sales.user_id', Auth::id())
                ->whereDate('product_sales.created_at', '>=' , $start_date)
                ->whereDate('product_sales.created_at', '<=' , $end_date)
                ->groupBy('product_sales.product_id', 'product_sales.product_batch_id')
                ->get();
            config()->set('database.connections.mysql.strict', true);
            DB::reconnect();
            $product_cost = $this->calculateAverageCOGS($product_sale_data);
            $revenue = Sale::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
            $return = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
            $purchase_return = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->where('user_id', Auth::id())->sum('grand_total');
            $revenue -= $return;
            $profit = $revenue + $purchase_return - $product_cost;

            $data[0] = $revenue;
            $data[1] = $return;
            $data[2] = $profit;
            $data[3] = $purchase_return;
        }
        else{
            config()->set('database.connections.mysql.strict', false);
            DB::reconnect();
            $product_sale_data = ProductSale::select(DB::raw('product_id, product_batch_id, sale_unit_id, sum(qty) as sold_qty, sum(total) as sold_amount'))->whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->groupBy('product_id', 'product_batch_id')->get();
            config()->set('database.connections.mysql.strict', true);
            DB::reconnect();
            $product_cost = $this->calculateAverageCOGS($product_sale_data);
            $revenue = Sale::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $return = Returns::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $purchase_return = ReturnPurchase::whereDate('created_at', '>=' , $start_date)->whereDate('created_at', '<=' , $end_date)->sum('grand_total');
            $revenue -= $return;
            $profit = $revenue + $purchase_return - $product_cost;

            $data[0] = $revenue;
            $data[1] = $return;
            $data[2] = $profit;
            $data[3] = $purchase_return;
        }
        return $data;
    }

    public function calculateAverageCOGS($product_sale_data)
    {
        $product_cost = 0;
        foreach ($product_sale_data as $key => $product_sale) {
            $product_data = Product::select('product_type', 'product_list', 'variant_list', 'qty_list')->find($product_sale->product_id);
            if($product_data->product_type == 'combo') {
                $product_list = explode(",", $product_data->product_list);
                if($product_data->variant_list)
                    $variant_list = explode(",", $product_data->variant_list);
                else
                    $variant_list = [];
                $qty_list = explode(",", $product_data->qty_list);

                foreach ($product_list as $index => $product_id) {
                    if(count($variant_list) && $variant_list[$index]) {
                        $product_purchase_data = ProductPurchase::where([
                            ['product_id', $product_id],
                            ['variant_id', $variant_list[$index] ]
                        ])
                        ->select('recieved', 'purchase_unit_id', 'total')
                        ->get();
                    }
                    else {
                        $product_purchase_data = ProductPurchase::where('product_id', $product_id)
                        ->select('recieved', 'purchase_unit_id', 'total')
                        ->get();
                    }
                    $total_received_qty = 0;
                    $total_purchased_amount = 0;
                    $sold_qty = $product_sale->sold_qty * $qty_list[$index];
                    foreach ($product_purchase_data as $key => $product_purchase) {
                        $purchase_unit_data = Unit::select('operator', 'operation_value')->find($product_purchase->purchase_unit_id);
                        if($purchase_unit_data->operator == '*')
                            $total_received_qty += $product_purchase->recieved * $purchase_unit_data->operation_value;
                        else
                            $total_received_qty += $product_purchase->recieved / $purchase_unit_data->operation_value;
                        $total_purchased_amount += $product_purchase->total;
                    }
                    if($total_received_qty)
                        $averageCost = $total_purchased_amount / $total_received_qty;
                    else
                        $averageCost = 0;
                    $product_cost += $sold_qty * $averageCost;
                }
            }
            else {
                if($product_sale->product_batch_id) {
                    $product_purchase_data = ProductPurchase::where([
                        ['product_id', $product_sale->product_id],
                        ['product_batch_id', $product_sale->product_batch_id]
                    ])
                    ->select('recieved', 'purchase_unit_id', 'total')
                    ->get();
                }
                elseif($product_sale->variant_id) {
                    $product_purchase_data = ProductPurchase::where([
                        ['product_id', $product_sale->product_id],
                        ['variant_id', $product_sale->variant_id]
                    ])
                    ->select('recieved', 'purchase_unit_id', 'total')
                    ->get();
                }
                else {
                    $product_purchase_data = ProductPurchase::where('product_id', $product_sale->product_id)
                    ->select('recieved', 'purchase_unit_id', 'total')
                    ->get();
                }
                $total_received_qty = 0;
                $total_purchased_amount = 0;
                if($product_sale->sale_unit_id) {
                    $sale_unit_data = Unit::select('operator', 'operation_value')->find($product_sale->sale_unit_id);
                    if($sale_unit_data->operator == '*')
                        $sold_qty = $product_sale->sold_qty * $sale_unit_data->operation_value;
                    else
                        $sold_qty = $product_sale->sold_qty / $sale_unit_data->operation_value;
                }
                else {
                    $sold_qty = $product_sale->sold_qty;
                }
                foreach ($product_purchase_data as $key => $product_purchase) {
                    $purchase_unit_data = Unit::select('operator', 'operation_value')->find($product_purchase->purchase_unit_id);
                    if($purchase_unit_data->operator == '*')
                        $total_received_qty += $product_purchase->recieved * $purchase_unit_data->operation_value;
                    else
                        $total_received_qty += $product_purchase->recieved / $purchase_unit_data->operation_value;
                    $total_purchased_amount += $product_purchase->total;
                }
                if($total_received_qty)
                    $averageCost = $total_purchased_amount / $total_received_qty;
                else
                    $averageCost = 0;
                $product_cost += $sold_qty * $averageCost;
            }
        }
        return $product_cost;
    }

    public function myTransaction($year, $month)
    {
        $start = 1;
        $number_of_day = date('t', mktime(0, 0, 0, $month, 1, $year));
        while($start <= $number_of_day)
        {
            if($start < 10)
                $date = $year.'-'.$month.'-0'.$start;
            else
                $date = $year.'-'.$month.'-'.$start;
            $sale_generated[$start] = Sale::whereDate('created_at', $date)->where('user_id', Auth::id())->count();
            $sale_grand_total[$start] = Sale::whereDate('created_at', $date)->where('user_id', Auth::id())->sum('grand_total');
            $purchase_generated[$start] = Purchase::whereDate('created_at', $date)->where('user_id', Auth::id())->count();
            $purchase_grand_total[$start] = Purchase::whereDate('created_at', $date)->where('user_id', Auth::id())->sum('grand_total');
            $quotation_generated[$start] = Quotation::whereDate('created_at', $date)->where('user_id', Auth::id())->count();
            $quotation_grand_total[$start] = Quotation::whereDate('created_at', $date)->where('user_id', Auth::id())->sum('grand_total');
            $start++;
        }
        $start_day = date('w', strtotime($year.'-'.$month.'-01')) + 1;
        $prev_year = date('Y', strtotime('-1 month', strtotime($year.'-'.$month.'-01')));
        $prev_month = date('m', strtotime('-1 month', strtotime($year.'-'.$month.'-01')));
        $next_year = date('Y', strtotime('+1 month', strtotime($year.'-'.$month.'-01')));
        $next_month = date('m', strtotime('+1 month', strtotime($year.'-'.$month.'-01')));
        return view('suepradmin.user.my_transaction', compact('start_day', 'year', 'month', 'number_of_day', 'prev_year', 'prev_month', 'next_year', 'next_month', 'sale_generated', 'sale_grand_total','purchase_generated', 'purchase_grand_total','quotation_generated', 'quotation_grand_total'));
    }

    public function switchTheme($theme)
    {
        setcookie('theme', $theme, time() + (86400 * 365), "/");
    }
    // public function index()
    // {

    //     // return view('home');
    // }
}
