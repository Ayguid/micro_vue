<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models440\Category;
use App\Models440\Product_Attribute;


class FilterController extends Controller
{

  public function uniquePossibleValues($catId, $ctyId, $id, $value = false)
  {
    return Product_Attribute::where('attribute_id', $id)
    ->join('products', 'products.id', '=', 'products_attributes.product_id')
    // ->when($value, function($query) use ($value){
    //   return $query->where('value', $value);
    //   })
    ->where('products.category_id', '=', $catId)
    ->join('products_in_countries', 'products.id', '=', 'products_in_countries.product_id')
    ->where('products_in_countries.country_id', '=',  $ctyId)->select('products_attributes.*')->orderBy('value')
    ->get()->unique('value');
  }


  public function findProducts(Request $request, $ctyId, $catId, $filterAtts=false)
  {
    $cat=Category::find($catId);
    $menuObj = new \stdClass;
    $prods = $cat->productsInCountry($ctyId);
    if (!$filterAtts) {
      $uniqueAtts= Product_Attribute::join('products', 'products.id', '=', 'products_attributes.product_id')
      ->where('products.category_id', '=', $catId)
      ->join('products_in_countries', 'products.id', '=', 'products_in_countries.product_id')
      ->where('products_in_countries.country_id', '=', $ctyId)
      ->join('attributes', 'products_attributes.attribute_id', '=', 'attributes.id')
      ->where('attributes.filterable' , "=", '1')
      ->select('products_attributes.*')->orderBy('attribute_id')->get()
      ->unique('attribute_id');
      foreach ($uniqueAtts as $key=> $prodAtt) {
        $menuObj->attributes[$key] = $prodAtt->attribute;
        $menuObj->attributes[$key]->uniqueValues=$this->uniquePossibleValues($catId, $ctyId, $prodAtt->attribute_id);
      }
    }
    else{
      foreach (json_decode($filterAtts, TRUE) as $key => $value) {
        $prodAtt=Product_Attribute::where('attribute_id', $key)->first();
        if ($value != 'null') {
          $prods = $prods->whereHas('attributes', function($q) use($key, $value){
            $q->where('attribute_id', '=', $key)->where('value', '=', $value);
          });
        }else {
          $value=false;
        }
          //new
          $menuObj->attributes[$key] = $prodAtt->attribute;
          $menuObj->attributes[$key]->uniqueValues=$this->uniquePossibleValues($catId, $ctyId, $prodAtt->attribute_id);
          //
      }
      // return response()->json($menuObj);

      // foreach ($uniqueAtts as $key=> $att) {
      //   $menuObj->attributes[$key] = $att->attribute;
      //   $menuObj->attributes[$key]->uniqueValues=$att->uniquePossibleValues($catId, $ctyId);
      // }
      // $prods->get();
      //
      // foreach ($uniqueAtts as $at) {    //Attributo por unique attributos
      //   foreach ($prods->get() as $prod) {   // Por cada producto
      //     $prodVal = $prod->attributeValue($at->attribute_id);    //Valor que tiene el product.attribute para el attributo de primer paso
      //     foreach ($menuObj->attributes as $menAtt) {   //Recorre el menu original por casa attributo
      //       if ($menAtt->id==$at->attribute_id) {    //  Attributo del menu->id == el product.attribute-> de $prodVal dos pasos arriba
      //         foreach ($menAtt->uniqueValues as $menuVal) {   //Recorre cada attibuto del menu original y trae todos los posibles valores
      //           if ($prodVal) {
      //             if ($menuVal->value==$prodVal->value) { //SHOW
      //               $menuVal->show=true;  //Se lo Saco para SHOW
      //               $menuVal->disabled=false;  //Se lo Saco para SHOW
      //             }
      //           }
      //           if (!$menuVal->show) {
      //             $menuVal->disabled=true;    //No tenes disable? Te lo pongo
      //           }
      //         }
      //       }
      //     }
      //   }
      // }
    }
    return response()->json([
      'products'=>$prods->with('files', 'attributes.attribute')->paginate(4),
      'menuData'=>$menuObj
    ]);
  }





}
