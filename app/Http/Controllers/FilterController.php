<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models440\Category;
use App\Models440\Product_Attribute;


class FilterController extends Controller
{

  public function findAttributes(Request $request)
  {
    $menuObj = new \stdClass;
    $uniqueAtts= Product_Attribute::join('products', 'products.id', '=', 'products_attributes.product_id')
    ->where('products.category_id', '=', $request->category_id)
    ->join('products_in_countries', 'products.id', '=', 'products_in_countries.product_id')
    ->where('products_in_countries.country_id', '=', $request->country_id)
    ->join('attributes', 'products_attributes.attribute_id', '=', 'attributes.id')
    ->where('attributes.filterable' , "=", '1')
    ->select('products_attributes.*')->get()
    ->unique('attribute_id');
    foreach ($uniqueAtts as $key=> $att) {
      $menuObj->attributes[$key] = $att->attribute;
      $menuObj->attributes[$key]->uniqueValues=$att->uniquePossibleValues($request->category_id, $request->country_id);
    }
    return response()->json($menuObj);
  }




  public function findProducts($ctyId, $catId, $atts=false)
  {
    $count=0;
    $cat=Category::find($catId);
    if (!$atts) {
      $prods = $cat->productsInCountry($ctyId)->with('files', 'attributes.attribute')->paginate(3);
      return response()->json($prods);
    }
    else{
      $prods = $cat->productsInCountry($ctyId);
      foreach (json_decode($atts, TRUE) as $key => $value) {
          if ($value != 'null') {
            $count++;
            $prodsOk = $prods->whereHas('attributes', function($q) use($key, $value){
              $q->where('attribute_id', '=', $key)->where('value', '=', $value);
            });
          }
        }
        if ($count==0) {
          $prodsOk=$prods;
        }
        return response()->json($prodsOk->with('files', 'attributes.attribute')->paginate(3));
    }

  }



  //
  // public function filterProducts(Request $request)
  // {
  //   return $request;
  //   $filterAttributes=$request->atts;
  //   $cat=Category::find($request->category_id);
  //   $prodsInCty=$cat->productsInCountry($request->country_id);
  //   foreach ($filterAttributes as $key => $value) {
  //     if ($value != 'null') {
  //       $filterProducts = $prodsInCty->whereHas('attributes', function($q) use($key, $value){
  //         $q->where('attribute_id', '=', $key)->where('value', '=', $value);
  //       });
  //     }
  //   }
  //   return response()->json($filterProducts->paginate(5));
  // }




}
