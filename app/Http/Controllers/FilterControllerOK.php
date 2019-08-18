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

  public function uniquePossibleValues($id)
  {
    return Product_Attribute::where('attribute_id', $id)
    ->join('products', 'products.id', '=', 'products_attributes.product_id')
    ->where('products.category_id', '=', $this->category_id)
    ->join('products_in_countries', 'products.id', '=', 'products_in_countries.product_id')
    ->where('products_in_countries.country_id', '=',  $this->country_id)->select('products_attributes.*')->orderBy('value')
    ->get()->unique('value');
  }


  public function buildMenu($list, $filterAtts)
  {
    $menuObj = new \stdClass;
    if ($filterAtts) {
    }
    foreach ($list as $key => $prodAtt) {
      $menuObj->attributes[$key] = $prodAtt->attribute;
      $menuObj->attributes[$key]->uniqueValues=$this->uniquePossibleValues($prodAtt->attribute_id);
    }
    return $menuObj;
  }


  public function findProducts($ctyId, $catId, $filterAtts=false)
  {
    $this->country_id=$ctyId;$this->category_id=$catId;
    $cat=Category::find($this->category_id);
    $prods = $cat->productsInCountry($this->country_id);
    //menu inicial
    if (!$filterAtts) {
      $productAttributes= Product_Attribute::join('products', 'products.id', '=', 'products_attributes.product_id')
      ->where('products.category_id', '=', $this->category_id)
      ->join('products_in_countries', 'products.id', '=', 'products_in_countries.product_id')
      ->where('products_in_countries.country_id', '=', $this->country_id)
      ->join('attributes', 'products_attributes.attribute_id', '=', 'attributes.id')
      ->where('attributes.filterable' , "=", '1')
      ->select('products_attributes.*')->orderBy('attribute_id')->get()
      ->unique('attribute_id');
    }
    //menu una vez activado el filtro
    else{
      $productAttributes=collect();
      foreach (json_decode($filterAtts, TRUE) as $key => $value) {
        $prodAtt=Product_Attribute::where('attribute_id', $key)->first();
        $productAttributes->add($prodAtt);
        if ($value != 'null') {
          $prods = $prods->whereHas('attributes', function($q) use($key, $value){
            $q->where('attribute_id', '=', $key)->where('value', '=', $value);
          });
        }
      }
    }
    //armamos el menu con la lista de atributos que le pasamos
    $menuObj = $this->buildMenu($productAttributes, $filterAtts);

    return response()->json([
      'products'=>$prods->with('files', 'attributes.attribute')->paginate(16),
      'menuData'=>$menuObj
    ]);
  }






}
