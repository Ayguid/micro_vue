<?php

use Illuminate\Database\Seeder;

use App\Models440\Product_Attribute_Value;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
      // $this->call(UsersTableSeeder::class);


      $products = factory(App\Models440\Product::class, 2500)
      ->create()->each(function ($product) {



      for ($i=1; $i < 4; $i++) {
        $product_in_country = factory(App\Models440\Product_In_Country::class)->make();
        $product_in_country->country_id = $i;
        $product_in_country->product_id = $product->id;
        $product_in_country->save();
      }


      for ($i=0; $i <5 ; $i++) {
        $prodAttr = factory(App\Models440\Product_Attribute::class)->make();
        $prodAttr->product_id=$product->id;
        $prodAttr->save();
      }

    });


      //
      // $attr = factory(App\Models440\Attribute::class, 100)
      // ->create();



}

}
