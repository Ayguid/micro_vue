<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Model;
use Faker\Generator as Faker;
use App\Models440\Product_Attribute;

$factory->define(Product_Attribute::class, function (Faker $faker) {

    return [
      'product_id' => App\Models440\Product::class,
      'attribute_id' => $faker->numberBetween($min = 3, $max = 102),
      'value' => $faker->text($maxNbChars = 50),
    ];

});
