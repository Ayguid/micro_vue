<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models440\Category;
use App\Models440\Product_Attribute;
use App\Models440\Product;


class FilterController extends Controller
{



  public function findProducts($ctyId, $catId, $filterAtts=false)
  {

    //Info principal - Products en country y category
    $cat=Category::find($catId);
    $prods = $cat->productsInCountry($ctyId);


    //Arma data para menu builder ORIGINAL
    $productAtts=$prods
    ->with('attributes')
    ->get()
    ->pluck('attributes')
    ->flatten()
    ->groupBy('attribute_id')
    ->map(function ($array) {
      return collect($array)->unique('value')->all();
    });
    // foreach ($productAtts as $kyr => $valssr) {
    //   foreach ($valssr as $vyr) {
    //     $vyr->disabled=false;
    //   }
    // }

    // Hace el query para buscar productos que cumplan con attributes
    if ($filterAtts) {
      foreach (json_decode($filterAtts, TRUE) as $key => $value) {
        if ($value != 'null') {
          $prods = $prods->whereHas('attributes', function($q) use($key, $value){
            $q->where('attribute_id', '=', $key)->where('value', '=', $value);
          });
        }
      }

    //Arma data para menu builder SHOW
    $productAttsShow=$prods
    ->with('attributes')
    ->get()
    ->pluck('attributes')
    ->flatten()
    ->groupBy('attribute_id')
    ->map(function ($array) {
      return collect($array)->unique('value')->all();
    });
    foreach ($productAttsShow as $ky => $valss) {
      foreach ($valss as $vy) {
        $vy->disabled=true;
      }
    }
    // $productAtts2 = array_merge((array)$productAtts, (array)$productAttsShow);
    $productAtts2 = $productAtts->replaceRecursive($productAttsShow)->all();
    $productAtts = $productAtts2;
    // return response($productAtts2);
  }



    //Arma el menu con la data que le pasamos
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

    //response con todo lo necesario
    return response()->json([
      'products'=>$prods->with('files', 'attributes.attribute')->paginate(16),
      'menuData'=>$menuObj
    ]);
  }










}
