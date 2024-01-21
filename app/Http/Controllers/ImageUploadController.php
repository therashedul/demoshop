<?php

namespace App\Http\Controllers;
use DB;
use App\Models\ImageUpload;
use Illuminate\Http\Request;

class ImageUploadController extends Controller
{
  //============================ Media ===============
     public function media(){
         if (!is_dir($this->images) || !is_dir($this->thumbnail)||!is_dir($this->singleimg) || !is_dir($this->upload)|| !is_dir($this->files)) {
             mkdir($this->images, 0777);
             mkdir($this->thumbnail, 0777);   
             mkdir($this->singleimg, 0777);
             mkdir($this->upload, 0777);
             mkdir($this->files, 0777);
         }
        $data = ImageUpload::orderBy('id', 'desc')->paginate(16);   
        return view('superadmin.media.index', compact('data'));
    }    
    public function mediaupload(Request $request){
        $userName = Auth::user()->name;
        if ($request->file('file')) {
          $file = $request->file('file');
            $fullImagename = $file->getClientOriginalName();
            $imagename = pathinfo($fullImagename, PATHINFO_FILENAME);
            $extension = pathinfo($fullImagename, PATHINFO_EXTENSION);
            $filePath = $imagename.'_'.time().'.'.$extension;
            $allowedfileExtension=['png','jpg','gif','bmp','jpeg'];
            $check=in_array($extension,$allowedfileExtension);
            if($check){
                $imgFile = Image::make($file->getRealPath());

                $imagepath = public_path('/images');
                $imgFile->resize(450, null, function ($constraint) {
                    $constraint->aspectRatio();
                })->save($imagepath.'/'.$filePath);

                $imagesPath = public_path('/thumbnail');
                $imgFile->resize(100, 80)->save($imagesPath.'/'.$filePath);    

                $singleImagesPath = public_path('/singleimg');
                $imgFile->resize(750, null, function ($constraint) {
                    $constraint->aspectRatio();
                })->save($singleImagesPath.'/'.$filePath);
          
                $destinationPath = public_path('/upload');
                $path = $file->move($destinationPath, $filePath); 
            }
            else{
                $path =  $file->move(public_path('/files'), $filePath);
            }
        }
        $imageUpload = new ImageUpload;
        $imageUpload->name = $filePath;
        $imageUpload->title = $imagename;
        $imageUpload->alt = $imagename;
        $imageUpload->path =  $filePath;
        $imageUpload->slug = $filePath;
        $imageUpload->status = '1';
        $imageUpload->user_id = $userName;
        $imageUpload->extention = '.'.$extension;

        $imageUpload->save();
     return response()->json(['success' => $imageUpload]);
    } 
    public function mediauploaddelete(Request $request) {
        $val = $request->name;
        $imageId = $request->id;  
            ImageUpload::where('name', $val)->delete();
                $lines = ['upload/','images/','single/','thumbnail/','files/'];
                for($i = 0; $i < count($lines); $i++) {
                    $value =  $lines[$i];
                    $path = public_path($value).$val;
                    if (file_exists($path)) {
                        unlink($path);
                        }
                    }    
                return response()->json(['data'=>$val],200);    


                // Below the code use never Delete any one becouse that image already use 

        // $projecntNames =  Project::where('project_logo', $val)->get();
        // if(!empty($projecntNames[0]->project_logo)){
        //     if(($val == $projecntNames[0]->project_logo)){
        //         $msg = '<div class="alert alert-success text-center">This image is already used.</div>';
        //         $action = "image";
        //         return response()->json(array('msg'=> $msg, 'action'=>$action), 200);
        //     }
        // } 
        // $documents =  Document::where('document_image_id', $imageId)->get();
        //     if(!empty($documents[0]->document_image_id)){
        //         if(($imageId == $documents[0]->document_image_id)){
        //             $msg = '<div class="alert alert-success text-center">This file is already used.</div>';
        //             $action = "file";
        //             return response()->json(array('msg'=> $msg, 'action'=>$action), 200);     
        //         }
        //      } 
        //      else{
        //         ImageUpload::where('name', $val)->delete();
        //         $lines = ['upload/','images/','single/','thumbnail/','files/'];
        //         for($i = 0; $i < count($lines); $i++) {
        //             $value =  $lines[$i];
        //             $path = public_path($value).$val;
        //             if (file_exists($path)) {
        //                 unlink($path);
        //                 }
        //             }    
        //         return response()->json(['data'=>$val],200);              
        //     } 
    }
    public function mediafetch(Request $request){
    //  $images =\File::allFiles(public_path('upload'));
     $images = DB::table('image_uploads')->orderBy('id', 'DESC')->get();
     $output = '<div class="file-manager-content">';        
        $output .= '<div id="image_file_upload_response">';
        foreach ($images as $image){
                $output .= '<div class="col-file-manager" id="img_col_id_'. $image->id .'">';
                    $output .= '<div class="file-box"  data-file-caption="'. $image->caption .'" data-file-description="'. $image->description .'" data-file-alt="'. $image->alt .'" data-file-title="'. $image->title .'" data-file-name="'. $image->name .'"  data-file-id="'. $image->id .'" data-file-path="'.asset('upload/' . $image->name).'" data-file-path-editor="'.asset('upload/' . $image->name).'">';
                       if($image->extention == '.pdf'){
                        $output .= '<div class="image-container">';  
                            $output .= '<img src="'.asset('img/' . 'pdf.png').'" id="'. $image->id .'" loading="lazy" class="img-responsive">';
                            $name = substr($image->name, 0, 15).'...';
                            $output .= '<span class="file-name">'.$name.'</span>';
                            $output .= '</div>';
                        }     
                        elseif($image->extention == '.docx'){
                            $output .= '<div class="image-container">';  
                                $output .= '<img src="'.asset('img/' . 'docx.png').'"  loading="lazy" class="img-responsive">';
                                $name = substr($image->name, 0, 15).'...';
                                $output .= '<span class="file-name">'.$name.'</span>';
                            $output .= '</div>';
                        }    
                        elseif($image->extention == '.xlsx'){
                            $output .= '<div class="image-container">';  
                                $output .= '<img src="'.asset('img/' . 'xlsx.png').'"  loading="lazy" class="img-responsive">';
                                $name = substr($image->name, 0, 15).'...';
                                $output .= '<span class="file-name">'.$name.'</span>';
                            $output .= '</div>';
                        } else{
                            $output .= '<div class="image-container">';  
                                $output .= '<img src="'.asset('images/' . $image->name).'" alt="'. $image->alt .'" title="'. $image->title .'" loading="lazy" class="img-responsive">';
                                    $name = substr($image->name, 0, 20).'...';
                                    // $name = mb_strimwidth($image->image, 0, 10, "...");  // another way
                                    // $output .= '<button type="button" class="btn btn-link remove_image" id="'.$image->id.'">Remove</button>';
                                    $output .= '<span class="file-name">'.$name.'</span>';
                            $output .= '</div>';
                        }
                    $output .= '</div>';
                $output .= '</div>';			        
            }
           $output .= '</div>';
        $output .= '</div>';
        echo $output;
    }
    public function mediasearch(Request $request){
            $images=DB::table('image_uploads')
                ->where('name','LIKE','%'.$request->search."%")
                ->get(); 
           if (!empty($images[0]->name)){
            foreach ($images as $image):
                echo '<div class="col-file-manager col-sm-6 col-md-2 col-lg-2 mb-5" id="img_col_id_' . $image->id . '">';
                    echo '<div class="file-box" data-file-name="'. $image->name .'"  data-file-id="'. $image->id .'" data-file-path="'.asset('upload/' . $image->name).'" data-file-path-editor="'.asset('upload/' . $image->name).'">';
                    if($image->extention == '.pdf'){
                      
                        echo '<div class="image-container-file">';
                            echo '<input type="hidden" id="selected_img_name_'. $image->name .'" value="'. $image->name .'">';
                            echo     '<a id="btn_delete_post_main_image" onclick="myFunction_'. $image->id .'()"
                                     class="btn btn-danger btn_img_delete btn-sm">
                                     <i class="fa fa-times"></i>
                                 </a>';
                               echo '<button type="button" class="btn-field" id="file_manager_'. $image->id .'"
                                     data-toggle="modal" data-target="#image_file_manager_'. $image->id .'">
                                         <figure>
                                         <img src="'.asset('img/' . 'pdf.png').'"  loading="lazy" class="img-responsive search-img file-image" style="max-height:200px">
                                        <figcaption class="text-center">
                                            '. mb_strimwidth($image->title, 0, 20, '...') .' </figcaption>
                                     </figure>
                                 </button>';

                    echo '</div>';
                    } elseif($image->extention == '.docx'){
                          echo '<div class="image-container-file">';
                            echo '<input type="hidden" id="selected_img_name_'. $image->name .'" value="'. $image->name .'">';
                            echo     '<a id="btn_delete_post_main_image" onclick="myFunction_'. $image->id .'()"
                                     class="btn btn-danger btn_img_delete btn-sm">
                                     <i class="fa fa-times"></i>
                                 </a>';
                               echo '<button type="button" class="btn-field" id="file_manager_'. $image->id .'"
                                     data-toggle="modal" data-target="#image_file_manager_'. $image->id .'">
                                         <figure>
                                         <img src="'.asset('img/' . 'docx.png').'"  loading="lazy" class="img-responsive search-img file-image" style="max-height:200px">
                                        <figcaption class="text-center">
                                            '. mb_strimwidth($image->title, 0, 20, '...') .' </figcaption>
                                     </figure>
                                 </button>';

                    echo '</div>';
                    } elseif($image->extention == '.xlsx'){
                        echo '<div class="image-container-file">';
                            echo '<input type="hidden" id="selected_img_name_'. $image->name .'" value="'. $image->name .'">';
                            echo     '<a id="btn_delete_post_main_image" onclick="myFunction_'. $image->id .'()"
                                     class="btn btn-danger btn_img_delete btn-sm">
                                     <i class="fa fa-times"></i>
                                 </a>';
                               echo '<button type="button" class="btn-field" id="file_manager_'. $image->id .'"
                                     data-toggle="modal" data-target="#image_file_manager_'. $image->id .'">
                                         <figure>
                                         <img src="'.asset('img/' . 'xlsx.png').'"  loading="lazy" class="img-responsive search-img file-image" style="max-height:200px">
                                        <figcaption class="text-center">
                                            '. mb_strimwidth($image->title, 0, 20, '...') .' </figcaption>
                                     </figure>
                                 </button>';

                    echo '</div>';
                    }else{
                    echo '<div class="image-container-file">';
                            echo '<input type="hidden" id="selected_img_name_'. $image->name .'" value="'. $image->name .'">';
                            echo     '<a id="btn_delete_post_main_image" onclick="myFunction_'. $image->id .'()"
                                     class="btn btn-danger btn_img_delete btn-sm">
                                     <i class="fa fa-times"></i>
                                 </a>';
                               echo '<button type="button" class="btn-field" id="file_manager_'. $image->id .'"
                                     data-toggle="modal" data-target="#image_file_manager_'. $image->id .'">
                                         <figure>
                                         <img src="'.asset('images/' . $image->name).'" alt="" name="file" class="img-responsive search-img">
                                         
                                        <figcaption class="text-center">
                                            '. mb_strimwidth($image->title, 0, 20, '...') .' </figcaption>
                                     </figure>
                                 </button>';
                    echo '</div>';
                    }

                echo '</div> </div>';
                
            endforeach;
             }else{
                        echo '<h2 class="text-center">No data found</h2>';
                    }
             echo '<div id="image_file_bottom">';
            echo '</div>';

    }
}
