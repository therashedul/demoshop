<?php

namespace App\Http\Servicecruds;

use \Illuminate\Support\Facades\DB;
use Hash;
use \Yajra\DataTables\Html\Editor\Fields\Image;
use Session;
use App\Models\Category;
use App\Models\ImageUpload;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class Categorycrud
{
    public function categoryindex($request)
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
        return view('superadmin.category.create', compact('categories'));
    }
    
    public function categorystore($request)
    {   
        $request->validate([
                'name_en'=>'required',
                'title_en'=>'required'
    
        ],[
                'name_en.required'=>'en name is requeired',
                'title_en.required'=>'en title is requeired'
        ]);

        Category::updateOrCreate(['id' => $request->id],
                [
                'status' => $request->status,
                'name_bn' => $request->name_bn,
                'name_en' => $request->name_en,
                'slug_en' => $request->slug_en,
                'slug_bn' => $request->slug_bn,
                'title_bn' => $request->name_bn,
                'title_en' => $request->name_en,
                'parent_id' => $request->parent_id,
                'category_img' => $request->image_name, 
            ]);

            // $category->save();
            // $category             = new Category();
            // $category->status    = $request->status;
            // $category->slug_bn    = $request->slug_bn;
            // $category->slug_en    = $request->slug_en;
            // $category->name_en    = $request->name_en;
            // $category->title_en   = $request->name_en;
            // $category->name_bn    = $request->name_bn;
            // $category->title_bn   = $request->name_bn;
            // $category->parent_id  = $request->parent_id;
            // $category->category_img = $request->image_name;

            return response()->json([
                'status' => "success",
                'error' => "error"
            ]);
            
        // Log::channel('categorylog')->critical('Category Log file', ['data' => $data]);
        // return redirect()->route('superAdmin.category')
        //     ->with('success', 'Category created successfully.');
    }
    public function categoryedit($id)
    {
        $cat = Category::findOrFail($id);
        $categories = Category::all();
        return response()->json([
            'cat'=>$cat,
            'categories'=>$categories,
        ], 200);
        // return view('superAdmin.category.edit', compact('cat', 'categories'));
    }
    
    public function categoryupdate($request, $id)
    {
    
        $ids    = $request->id;
        $request->validate([
                'name_en'=>'required',
                'title_en'=>'required'
    
        ],[
                'name_en.required'=>'update en name is requeired',
                'title_bn.required'=>'update bn title is requeired'
        ]);
            $category             =  Category::find($id);
            $category->name_en    = $request->name_en;
            $category->name_bn    = $request->name_bn;
            $category->title_en   = $request->name_en;
            $category->title_bn   = $request->name_bn;

            $category->slug_en    = $request->slug_en;
            $category->slug_bn    = $request->slug_bn;

            $category->parent_id  = $request->parent_id;
            $category->category_img = $request->image_name;
            $category->status    = $request->status;
            $category->save(); 
             
        // $input                 = $request->all();
        // // $input['id']           = $request->id;
        // $input['name_en']      = $request->name_en;
        // $input['title_en']     = $request->title_en;
        // $input['slug_en']      = $request->slug_en;

        // $input['name_bn']      = $request->name_bn;
        // $input['title_bn']     = $request->title_bn;
        // $input['slug_bn']      = $request->slug_bn;

        // $input['parent_id']    = $request->parent_id;
        // $input['category_img'] = $request->image_name;
        // $input['status']       = $request->status;
        // $cateogy = Category::find($id);
        // $cateogy->update($input);
        
        return response()->json(['status' => "success"]);


        // menu update
        // $menuitem = DB::table('menuitems')->where('slug_en', '=', $request->input('slug_en'))->Orwhere('slug_bn', '=', $request->input('slug_bn'))->first();
        // if (!empty($menuitem)) {
        //     $menuitemUpdate = Menuitem::findOrFail($menuitem->id);

        //     $menuitemUpdate->title_en = $request->input('name_en');
        //     $menuitemUpdate->name_en  = $request->input('name_en');
        //     $menuitemUpdate->slug_en  = $request->input('slug_en');

        //     $menuitemUpdate->title_bn = $request->input('name_bn');
        //     $menuitemUpdate->name_bn  = $request->input('name_bn');
        //     $menuitemUpdate->slug_bn  = $request->input('slug_bn');
        //     $menuitemUpdate->save();
        // }
        // // ==============================================
        // return redirect()->route('superAdmin.category')
        //     ->with('success', 'Category Updated successfully.');
    }

    public function categorypublish($id)
    {
        $publish         = Category::find($id);
        $publish->status = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function categoryunpublish($id)
    {

        $unpublish         = Category::find($id);
        $unpublish->status = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    }

    public function categorydestroy($id)
    {
        $category = Category::findOrFail($id);
        if (count($category->subcategory)) {
            $subcategories = $category->subcategory;
            foreach ($subcategories as $cat) {
                $cat = Category::findOrFail($cat->id);
                $cat->parent_id = '';
                $cat->save();
            }
        }
        $category->delete();
        return response()->json(['status' => "success"]);

        // return redirect()->route('superAdmin.category')
        //     ->with('success', 'Category Deleted successfully.');
    }
    public function categoryPagination( $request)
    {
        $categories = Category::where('parent_id', '==', '')->orderBy('id', 'desc')->paginate(5);
        if ($request->ajax()) {
            return view('superadmin.category.pagination-index', compact('categories'))->render();
            // return Response::json(View::make('superadmin.category.pagination-index', ['categories' =>$categories])->render()); 
        }
        return view('superadmin.category.pagination-index', compact('categories'));
    }
    public function categorySearch( $request)
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
        $categories = \Illuminate\Support\Facades\DB::table('categories')
            ->where('slug', $category)
            ->get();
        $cat = $categories[0];
        $postmetas = DB::table('postmetas')
            ->where('cat_id', $cat->id)
            ->get();
        $posts = DB::table('posts')
            ->get();
        return view('superAdmin.category.single-cat', compact(['postmetas', 'posts', 'categories']));
    }
    public function categoryupload($request)
    {
        $userName = Auth::user()->name;
        if ($request->file('file')) {
            $file = $request->file('file');
            $fullImagename = $file->getClientOriginalName();
            $imagename = pathinfo($fullImagename, PATHINFO_FILENAME);
            $extension = pathinfo($fullImagename, PATHINFO_EXTENSION);
            $filePath = $imagename . '_' . time() . '.' . $extension;
            $allowedfileExtension = ['png', 'jpg', 'gif', 'bmp', 'jpeg'];
            $check = in_array($extension, $allowedfileExtension);
            if ($check) {
                $imgFile = \Yajra\DataTables\Html\Editor\Fields\Image::make($file->getRealPath());

                $imagepath = public_path('/images');
                $imgFile->resize(450, null, function ($constraint) {
                    $constraint->aspectRatio();
                })->save($imagepath . '/' . $filePath);

                $imagesPath = public_path('/thumbnail');
                $imgFile->resize(100, 80)->save($imagesPath . '/' . $filePath);

                $singleImagesPath = public_path('/singleimg');
                $imgFile->resize(750, null, function ($constraint) {
                    $constraint->aspectRatio();
                })->save($singleImagesPath . '/' . $filePath);

                $destinationPath = public_path('/upload');
                $path = $file->move($destinationPath, $filePath);
            } else {
                $path = $file->move(public_path('/files'), $filePath);
            }
        }
        $imageUpload = new ImageUpload;
        $imageUpload->name = $filePath;
        $imageUpload->title = $imagename;
        $imageUpload->alt = $imagename;
        $imageUpload->path = $filePath;
        $imageUpload->slug = $filePath;
        $imageUpload->status = '1';
        $imageUpload->username = $userName;
        $imageUpload->extention = '.' . $extension;
        $imageUpload->save();
        return response()->json(['success' => $imageUpload]);
    }
    public function categoryuploaddelete($request)
    {
        $val = $request->name;
        $categoryNames = Category::where('profile_image', $val)->get();
        if (!empty($categoryNames[0]->profile_image)) {
            if (($val == $categoryNames[0]->profile_image)) {
                $msg = '<div class="alert alert-success text-center">This image is already used.</div>';
                $action = "image";
                return response()->json(array('msg' => $msg, 'action' => $action), 200);
            }
        } else {
            ImageUpload::where('name', $val)->delete();
            $lines = ['upload/', 'images/', 'single/', 'thumbnail/'];
            for ($i = 0; $i < count($lines); $i++) {
                $value = $lines[$i];
                $path = public_path($value) . $val;
                if (file_exists($path)) {
                    unlink($path);
                }
            }
            return response()->json(['data' => $val], 200);
        }
    }
    public function categoryimagesearch($request)
    {
        $images = DB::table('image_uploads')
            ->where('name', 'LIKE', '%' . $request->search . "%")
            ->get();
        foreach ($images as $image):
            echo '<div class="col-file-manager" id="img_col_id_' . $image->id . '">';
            echo '<div class="file-box" data-file-name="' . $image->name . '"  data-file-id="' . $image->id . '" data-file-path="' . asset('upload/' . $image->name) . '" data-file-path-editor="' . asset('upload/' . $image->name) . '">';
            echo '<div class="image-container">';
            echo '<img src="' . asset('images/' . $image->name) . '" alt="" name="file" class="img-responsive">';
            $name = substr($image->name, 0, 20) . '...';
            echo '<span class="file-name">' . $name . '</span>';
            echo '</div>';
            echo '</div> </div>';
        endforeach;
    }   
}