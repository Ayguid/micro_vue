<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models440\Category;
use App\Models440\Product_Attribute;
use App\Models440\Product;


class FilterController extends Controller
{
  private $country_id;
  private $category_id;





  public function findProducts($ctyId, $catId, $filterAtts=false)
  {
    $this->country_id=$ctyId;
    $this->category_id=$catId;

    $cat=Category::find($this->category_id);
    $prods = $cat->productsInCountry($this->country_id);

    if ($filterAtts) {
      foreach (json_decode($filterAtts, TRUE) as $key => $value) {
        if ($value != 'null') {
          $prods = $prods->whereHas('attributes', function($q) use($key, $value){
            $q->where('attribute_id', '=', $key)->where('value', '=', $value);
          });
        }
      }
    }

    $productAtts=$prods
    ->with('attributes')
    ->get()
    ->pluck('attributes')
    ->flatten()
    ->groupBy('attribute_id')
    ->map(function ($array) {
      return collect($array)->unique('value')->all();
    });

    $menuObj = new \stdClass;
    //
    foreach ($productAtts as $key => $values) {
      $prAtt= Product_Attribute::where('attribute_id', $key)->first()->attribute;
      if ($prAtt->filterable=='1') {
        $menuObj->attributes[$key] =$prAtt;
        $col=collect();
        foreach ($values as $v) {
          $col->add($v);
        }
        $menuObj->attributes[$key]->uniqueValues=$col;
      }
    }


    return response()->json([
      'products'=>$prods->with('files', 'attributes.attribute')->paginate(16),
      'menuData'=>$menuObj
    ]);
  }










}
