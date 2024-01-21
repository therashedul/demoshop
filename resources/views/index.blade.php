@extends('layouts.home')
@section('content')

@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(!empty($general_setting->theme))
      @php
      
        if($general_setting->theme == 'default.css'){
          $color = '#733686';
          $color_rgba = 'rgba(115, 54, 134, 0.8)';
        }
        elseif($general_setting->theme == 'green.css'){
            $color = '#2ecc71';
            $color_rgba = 'rgba(46, 204, 113, 0.8)';
        }
        elseif($general_setting->theme == 'blue.css'){
            $color = '#3498db';
            $color_rgba = 'rgba(52, 152, 219, 0.8)';
        }
        elseif($general_setting->theme == 'dark.css'){
            $color = '#34495e';
            $color_rgba = 'rgba(52, 73, 94, 0.8)';
        }
      
      @endphp
   
      <div class="row">
        <div class="container-fluid">
          <div class="col-md-12">
            <div class="brand-text float-left mt-4">
                <h3>{{trans('welcome')}} <span>{{Auth::user()->name}}</span> </h3>
            </div>
            <div class="filter-toggle btn-group">
              <button class="btn btn-secondary date-btn" data-start_date="{{date('Y-m-d')}}" data-end_date="{{date('Y-m-d')}}">{{trans('Today')}}</button>
              <button class="btn btn-secondary date-btn" data-start_date="{{date('Y-m-d', strtotime(' -7 day'))}}" data-end_date="{{date('Y-m-d')}}">{{trans('Last 7 Days')}}</button>
              <button class="btn btn-secondary date-btn active" data-start_date="{{date('Y').'-'.date('m').'-'.'01'}}" data-end_date="{{date('Y-m-d')}}">{{trans('This Month')}}</button>
              <button class="btn btn-secondary date-btn" data-start_date="{{date('Y').'-01'.'-01'}}" data-end_date="{{date('Y').'-12'.'-31'}}">{{trans('This Year')}}</button>
            </div>
          </div>
        </div>
      </div>
      <!-- Counts Section -->
      <section class="dashboard-counts">
        <div class="container-fluid">
          <div class="row">

            <div class="col-md-12 form-group">
              <div class="row">
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title">
                    <div class="icon"><i class="dripicons-graph-bar" style="color: #733686"></i></div>
                    <div>
                        <div class="count-number revenue-data">{{number_format((float)$revenue, 2, '.', '')}}</div>
                        <div class="name"><strong style="color: #733686">{{ trans('revenue') }}</strong></div>
                    </div>
                  </div>
                </div>
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title">
                    <div class="icon"><i class="dripicons-return" style="color: #ff8952"></i></div>
                    <div>
                        <div class="count-number return-data">{{number_format((float)$return, 2, '.', '')}}</div>
                        <div class="name"><strong style="color: #ff8952">{{trans('Sale Return')}}</strong></div>
                    </div>
                  </div>
                </div>
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title">
                    <div class="icon"><i class="dripicons-media-loop" style="color: #00c689"></i></div>
                    <div>
                        <div class="count-number purchase_return-data">{{number_format((float)$purchase_return, 2, '.', '')}}</div>
                        <div class="name"><strong style="color: #00c689">{{trans('Purchase Return')}}</strong></div>
                    </div>
                  </div>
                </div>
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title">
                    <div class="icon"><i class="dripicons-trophy" style="color: #297ff9"></i></div>
                    <div>
                        <div class="count-number profit-data">{{number_format((float)$profit, 2, '.', '')}}</div>
                        <div class="name"><strong style="color: #297ff9">{{trans('profit')}}</strong></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            @php
                // print_r($color);
                // print_r(json_encode($payment_recieved));
                // die();
            @endphp

            <div class="col-md-7 mt-4">
              <div class="card line-chart-example">
                <div class="card-header d-flex align-items-center">
                  <h4>{{trans('Cash Flow')}}</h4>
                </div>
                <div class="card-body">
                  <canvas id="cashFlow" data-color = "{{$color}}" data-color_rgba = "{{$color_rgba}}" data-recieved = "{{json_encode($payment_recieved)}}" data-sent = "{{json_encode($payment_sent)}}" data-month = "{{json_encode($month)}}" data-label1="{{trans('Payment Recieved')}}" data-label2="{{trans('Payment Sent')}}"></canvas>
                </div>
              </div>
            </div>

            <div class="col-md-5 mt-4">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4>{{date('F')}} {{date('Y')}}</h4>
                </div>
                <div class="pie-chart mb-2">
                    <canvas id="transactionChart" data-color = "{{$color}}" data-color_rgba = "{{$color_rgba}}" data-revenue={{$revenue}} data-purchase={{$purchase}} data-expense={{$expense}} data-label1="{{trans('Purchase')}}" data-label2="{{trans('revenue')}}" data-label3="{{trans('Expense')}}" width="100" height="95"> </canvas>
                </div>
              </div>
            </div>        
          </div>
        </div>

        <div class="container-fluid">
          <div class="row">      
            <div class="col-md-12">
              <div class="card">
                <div class="card-header d-flex align-items-center">
                  <h4>{{trans('yearly report')}}</h4>
                </div>
                <div class="card-body">
                  <canvas id="saleChart" data-sale_chart_value = "{{json_encode($yearly_sale_amount)}}" data-purchase_chart_value = "{{json_encode($yearly_purchase_amount)}}" data-label1="{{trans('Purchased Amount')}}" data-label2="{{trans('Sold Amount')}}"></canvas>
                </div>
              </div>
            </div>

            <div class="col-md-7">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4>{{trans('Recent Transaction')}}</h4>
                  <div class="right-column">
                    <div class="badge badge-primary">{{trans('latest')}} 5</div>
                  </div>
                </div>
                <ul class="nav nav-tabs" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" href="#sale-latest" role="tab" data-toggle="tab">{{trans('Sale')}}</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#purchase-latest" role="tab" data-toggle="tab">{{trans('Purchase')}}</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#quotation-latest" role="tab" data-toggle="tab">{{trans('Quotation')}}</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#payment-latest" role="tab" data-toggle="tab">{{trans('Payment')}}</a>
                  </li>
                </ul>

                <div class="tab-content">
                  <div role="tabpanel" class="tab-pane fade show active" id="sale-latest">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th>{{trans('date')}}</th>
                              <th>{{trans('reference')}}</th>
                              <th>{{trans('customer')}}</th>
                              <th>{{trans('status')}}</th>
                              <th>{{trans('grand total')}}</th>
                            </tr>
                          </thead>
                          <tbody>
                            @foreach($recent_sale as $sale)
                            <tr>
                              <td>{{ date($general_setting->date_format, strtotime($sale->created_at->toDateString())) }}</td>
                              <td>{{$sale->reference_no}}</td>
                              <td>{{$sale->customer->name}}</td>
                              @if($sale->sale_status == 1)
                              <td><div class="badge badge-success">{{trans('Completed')}}</div></td>
                              @elseif($sale->sale_status == 2)
                              <td><div class="badge badge-danger">{{trans('Pending')}}</div></td>
                              @else
                              <td><div class="badge badge-warning">{{trans('Draft')}}</div></td>
                              @endif
                              <td>{{$sale->grand_total}}</td>
                            </tr>
                            @endforeach
                          </tbody>
                        </table>
                      </div>
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="purchase-latest">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th>{{trans('date')}}</th>
                              <th>{{trans('reference')}}</th>
                              <th>{{trans('Supplier')}}</th>
                              <th>{{trans('status')}}</th>
                              <th>{{trans('grand total')}}</th>
                            </tr>
                          </thead>
                          <tbody>
                            @foreach($recent_purchase as $purchase)
                            <tr>
                              <td>{{date($general_setting->date_format, strtotime($purchase->created_at->toDateString())) }}</td>
                              <td>{{$purchase->reference_no}}</td>
                              @if($purchase->supplier)
                                <td>{{$purchase->supplier->name}}</td>
                              @else
                                <td>N/A</td>
                              @endif
                              @if($purchase->status == 1)
                              <td><div class="badge badge-success">Recieved</div></td>
                              @elseif($purchase->status == 2)
                              <td><div class="badge badge-success">Partial</div></td>
                              @elseif($purchase->status == 3)
                              <td><div class="badge badge-danger">Pending</div></td>
                              @else
                              <td><div class="badge badge-danger">Ordered</div></td>
                              @endif
                              <td>{{$purchase->grand_total}}</td>
                            </tr>
                            @endforeach
                          </tbody>
                        </table>
                      </div>
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="quotation-latest">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th>{{trans('date')}}</th>
                              <th>{{trans('reference')}}</th>
                              <th>{{trans('customer')}}</th>
                              <th>{{trans('status')}}</th>
                              <th>{{trans('grand total')}}</th>
                            </tr>
                          </thead>
                          <tbody>
                            @foreach($recent_quotation as $quotation)
                            <tr>
                              <td>{{date($general_setting->date_format, strtotime($quotation->created_at->toDateString())) }}</td>
                              <td>{{$quotation->reference_no}}</td>
                              <td>{{$quotation->customer->name}}</td>
                              @if($quotation->quotation_status == 1)
                              <td><div class="badge badge-danger">Pending</div></td>
                              @else
                              <td><div class="badge badge-success">Sent</div></td>
                              @endif
                              <td>{{$quotation->grand_total}}</td>
                            </tr>
                            @endforeach
                          </tbody>
                        </table>
                      </div>
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="payment-latest">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th>{{trans('date')}}</th>
                              <th>{{trans('reference')}}</th>
                              <th>{{trans('Amount')}}</th>
                              <th>{{trans('Paid By')}}</th>
                            </tr>
                          </thead>
                          <tbody>
                            @foreach($recent_payment as $payment)
                            <tr>
                              <td>{{date($general_setting->date_format, strtotime($payment->created_at->toDateString())) }}</td>
                              <td>{{$payment->payment_reference}}</td>
                              <td>{{$payment->amount}}</td>
                              <td>{{$payment->paying_method}}</td>
                            </tr>
                            @endforeach
                          </tbody>
                        </table>
                      </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-5">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4>{{trans('Best Seller').' '.date('F')}}</h4>
                  <div class="right-column">
                    <div class="badge badge-primary">{{trans('top')}} 5</div>
                  </div>
                </div>
                <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>{{trans('Product Details')}}</th>
                          <th>{{trans('qty')}}</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach($best_selling_qty as $key=>$sale)
                        <?php $images = explode(",", $sale->product_images)?>
                        <tr>
                          <td><img src="{{url('public/images/product', $images[0])}}" height="25" width="30"> {{$sale->product_name}} [{{$sale->product_code}}]</td>
                          <td>{{$sale->sold_qty}}</td>
                        </tr>
                        @endforeach
                      </tbody>
                    </table>
                  </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4>{{trans('Best Seller').' '.date('Y'). '('.trans('qty').')'}}</h4>
                  <div class="right-column">
                    <div class="badge badge-primary">{{trans('top')}} 5</div>
                  </div>
                </div>
                <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>{{trans('Product Details')}}</th>
                          <th>{{trans('qty')}}</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach($yearly_best_selling_qty as $key => $sale)
                        <?php $images = explode(",", $sale->product_images)?>
                        <tr>
                          <td><img src="{{url('public/images/product', $images[0])}}" height="25" width="30"> {{$sale->product_name}} [{{$sale->product_code}}]</td>
                          <td>{{$sale->sold_qty}}</td>
                        </tr>
                        @endforeach
                      </tbody>
                    </table>
                  </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4>{{trans('Best Seller').' '.date('Y') . '('.trans('price').')'}}</h4>
                  <div class="right-column">
                    <div class="badge badge-primary">{{trans('top')}} 5</div>
                  </div>
                </div>
                <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>{{trans('Product Details')}}</th>
                          <th>{{trans('grand total')}}</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach($yearly_best_selling_price as $key => $sale)
                        <?php $images = explode(",", $sale->product_images)?>
                        <tr>
                          <td><img src="{{url('public/images/product', $images[0])}}" height="25" width="30"> {{$sale->product_name}} [{{$sale->product_code}}]</td>
                          <td>{{number_format((float)$sale->total_price, 2, '.', '')}}</td>
                        </tr>
                        @endforeach
                      </tbody>
                    </table>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      @endif
@endsection
@push('custom_scripts')
<script type="text/javascript">
    // Show and hide color-switcher
    $(".color-switcher .switcher-button").on('click', function() {
        $(".color-switcher").toggleClass("show-color-switcher", "hide-color-switcher", 300);
    });

    // Color Skins
    $('a.color').on('click', function() {
        /*var title = $(this).attr('title');
        $('#style-colors').attr('href', 'css/skin-' + title + '.css');
        return false;*/
        $.get('setting/general_setting/change-theme/' + $(this).data('color'), function(data) {
        });
        var style_link= $('#custom-style').attr('href').replace(/([^-]*)$/, $(this).data('color') );
        $('#custom-style').attr('href', style_link);
    });

    $(".date-btn").on("click", function() {
        $(".date-btn").removeClass("active");
        $(this).addClass("active");
        var start_date = $(this).data('start_date');
        var end_date = $(this).data('end_date');
        $.get('dashboard-filter/' + start_date + '/' + end_date, function(data) {
            //console.log(data);
            dashboardFilter(data);
        });
    });

    function dashboardFilter(data){
        $('.revenue-data').hide();
        $('.revenue-data').html(parseFloat(data[0]).toFixed(2));
        $('.revenue-data').show(500);

        $('.return-data').hide();
        $('.return-data').html(parseFloat(data[1]).toFixed(2));
        $('.return-data').show(500);

        $('.profit-data').hide();
        $('.profit-data').html(parseFloat(data[2]).toFixed(2));
        $('.profit-data').show(500);

        $('.purchase_return-data').hide();
        $('.purchase_return-data').html(parseFloat(data[3]).toFixed(2));
        $('.purchase_return-data').show(500);
    }
</script>
@endpush
