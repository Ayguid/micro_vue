<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Model;
use Faker\Generator as Faker;
use App\Models440\Product_In_Country;


$factory->define(Product_In_Country::class, function (Faker $faker) {

      return [
          'product_id' => App\Models440\Product::class,
          'country_id' => '',
          // 'country_id' => $faker->numberBetween($min = 1, $max = 3),
      ];

});
