<?php
namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Notifications\AdminResetPasswordNotification;
use App\Models440\Country;

class Admin extends Authenticatable
{
  use Notifiable;

  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $guard = 'admin';

  protected $fillable = [
    'name', 'email', 'password', 'country_id', 'contactable', 'job_title',
  ];

  /**
  * The attributes that should be hidden for arrays.
  *
  * @var array
  */
  protected $hidden = [
    'password', 'remember_token',
  ];

  /**
  * The attributes that should be cast to native types.
  *
  * @var array
  */
  protected $casts = [
    'email_verified_at' => 'datetime',
  ];

  public function country()
  {
    return $this->belongsTo(Country::class);
  }

  public function sendPasswordResetNotification($token)
  {
    $this->notify(new AdminResetPasswordNotification($token));
  }


  public function possibleJobTitles()
  {
    return [
      ['abbr'=>'ing','name'=>'Ingenieria', 'id'=>'1'],
      ['abbr'=>'com','name'=>'Comercial', 'id'=>'2'],
    ];
  }


}
