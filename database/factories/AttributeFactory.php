<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Model;
use Faker\Generator as Faker;
use App\Models440\Attribute;


$factory->define(Attribute::class, function (Faker $faker) {
    return [
      'category_id' => $faker->numberBetween($min = 1, $max = 10),
      'name' => $faker->firstNameFemale,
      'type' => 'string',
    ];
});
