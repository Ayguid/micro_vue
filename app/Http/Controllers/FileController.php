<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Models440\File;
use App\Models440\Product;


class FileController extends Controller
{
  //


  public function index()
  {
    return view('admin.media');
  }



  public function upload(Request $request)
  {
    $input = $request->file('file');
    $extension= $input->getClientOriginalExtension();
    $validator = Validator::make($request->all(), [
      'file' => 'required',
      // 'file' => 'mimes:jpeg,bmp,png,jpeg,pdf,dxf,zip',
    ]);

    if ($validator->fails())
    {
      $message = $validator->errors();
      return  response()->json(['errors' => $message, 422]);

    }else {
      switch ($extension) {
        case 'png':
        case 'jpg':
        case 'jpeg':
        $directory='storage/product_images/';
        break;
        case 'pdf':
        $directory='storage/pdfs/';
        break;
        case 'stl':
        $directory='storage/stls/';
        break;
        case 'dxf':
        $directory='storage/dxfs/';
        break;
        case 'zip':
        $directory='storage/zips/';
        break;
        default:
        // code...
        break;
      }
      $name = $input->getClientOriginalName();
      $save = $input->move($directory, $name);
      if ($request->product_id) {
        $file = new File();
        $pd=Product::find($request->product_id);
        if ($extension=='png' || $extension =='jpg' || $extension =='jpeg') {
          $pd->has_image=true;
        }
        if ($extension =='pdf') {
          $pd->has_pdf=true;
        }
        if ($extension =='stl') {
          $pd->has_cad_3d=true;
        }
        if ($extension =='dxf') {
          $pd->has_cad_2d=true;
        }
        if ($extension =='zip') {
          $pd->has_zip=true;
        }
        $pd->update();
        $file->file_path=$name;
        $file->fileable_id=$request->product_id;
        $file->fileable_type='App\Models440\Product';
        $file->save();
      }
      if ($save) {
        return response('Todo bien'.$save, 200);
      }else {
        return response('No se que pacho', 404);
      }
    }
  }




  public function destroy(Request $request, $string)
  {
    if ($request->product_id) {
      $pd=Product::find($request->product_id);
      $tableFile = File::where('fileable_id', $request->product_id)->where('file_path',$string)->first();
      $destroy = $tableFile->delete();
      $files= $pd->getFiles();

      if(empty($files['images'])) {
        $pd->has_image=null;
      }
      if(empty($files['pdfs'])) {
        $pd->has_pdf=null;
      }
      if(empty($files['stls'])) {
        $pd->has_cad_3d=null;
      }
      if(empty($files['dxfs'])) {
        $pd->has_cad_2d=null;
      }
      if(empty($files['zips']) ) {
        $pd->has_zip=null;
      }
      $pd->update();




      $msg = 'Deleted from table';
    }else {
      $msg = 'Deleted from disk';
      $destroy =Storage::delete('public/product_images/'.$string);
    }
    if ($destroy) {
      return response($msg, 200);
    }
  }












}
