<?php

namespace App\Models440;

use Illuminate\Database\Eloquent\Model;

use App\Models440\Product_Attribute;
use App\Models440\Attribute;
use App\Models440\Country;
use App\Models440\Category;
use App\Models440\Product_In_Country;
use App\Models440\File;



class Product extends Model
{

  protected $table='products';

  protected $fillable = [
    'category_id', 'title_es', 'title_en','title_pt','desc_es','desc_en','desc_pt','product_code', 'page','image_path',
    'has_image', 'has_pdf', 'has_cad_2d', 'has_cad_3d', 'has_zip'
  ];

  // public $files=[];

  public function category()
  {
    return $this->hasOne(Category::class, 'id', 'category_id');
  }

  public function attributes()
  {
    return $this->hasMany(Product_Attribute::class, 'product_id', 'id')->orderBy('attribute_id');
  }


  public function attributeValue($id)
  {
    return $this->attributes()->where('attribute_id', $id)->first();
  }


  public function possibleCountries()
  {
    return Country::all();
  }


  public function isInCountries()
  {
    return $this->hasMany(Product_In_Country::class,'product_id');
  }

  public function isInCountry($id)
  {
    return $this->isInCountries->where('country_id', $id)->count()>0;
  }



  public function files()
  {
    return $this->morphMany(File::class, 'fileable');
  }





}
