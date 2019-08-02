<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models440\Category;
use App\Models440\Country;
use App\Models440\Product;
use App\Models440\Product_Attribute;
use App\Models440\Attribute;
use App;

class LandingController extends Controller
{
  //
  public $paginate = 4;
  public $data = [];


  public function __construct()
  {
    $this->data['categories'] = Category::where('parent_id', null)->get();
  }


  public function index($id=null, Request $request)
  {
    if ($country = session('country')) {
      if ($id) {
        $this->data['category']=Category::find($id);
        $this->data['category']->getTopCategories;
      }
      return view('country_landing')->with('data', $this->data);
    }else {
      return view('welcome');
    }
  }




  public function setCountry($id = null)
  {
    $country=[];
    if ($id) {
      $country = Country::where('id', $id)->first();
    }
    session([
      'country' => $country,
    ]);
    return redirect(route('landing'));
  }



  public function showProduct($id)
  {
    $this->data['product']= Product::find($id);
    $this->data['products']= '';
    $this->data['category']=Category::find($this->data['product']->category_id);
    return view('product-view')->with('data', $this->data);
  }



  public function find(Request $request ,$query=null)
  {
    $ctyId=session('country')->id;
    $this->data['products'] = Product::join('products_in_countries', 'products.id', '=', 'products_in_countries.product_id')
    ->where('product_code', 'LIKE', '%'.$query.'%')->where('products_in_countries.country_id', '=', $ctyId)
    ->orWhere('title_es', 'LIKE', '%'.$query.'%')->where('products_in_countries.country_id', '=', $ctyId)
    ->orWhere('desc_es', 'LIKE', '%'.$query.'%')->where('products_in_countries.country_id', '=', $ctyId)
    ->select('products.*')->with('files', 'category.getTopCategories', 'attributes.attribute')
    ->paginate($this->paginate);
    $this->data['request']=$request;
    if ($this->data['products']->total()==0) {
      return response('Not found', 200);
    }
    else {
      return view('search_results')->with('data', $this->data);
    }
  }






}
