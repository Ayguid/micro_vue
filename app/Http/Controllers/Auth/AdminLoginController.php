<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;


class AdminLoginController extends Controller
{



  public function __construct()
  {
    $this->middleware('guest:admin', ['except' => ['logout']]);
  }
  public function showLoginForm()
  {
    return view('auth.admin-login');
  }
  public function validateRequest($request)
  {
    return  $validatedData = Validator::make($request->all(), [
      'email' => 'required|exists:admins,email|email',
      'password' => 'required|min:8'
    ]);
  }
  public function login(Request $request)
  {
    //Validate the form data
    // $this->validate($request, [
    //   'email' => 'required|email',
    //   'password' => 'required|min:8'
    // ]);
    //Attempt to log the user in
    $admin=Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password], $request->remember);
    if ($admin) {
      //polemico pensar una mejor manera
      if (Auth::guard('admin')->user()->country_id !='1' && Auth::guard('admin')->user()->job_title != 'Ingenieria') {
        Auth::guard('admin')->logout();
      }
      //if succesfull, then redirect to their intended location
      return redirect()->intended(route('admin.dashboard'));
    }
    //if unsuccesfull, then redirect to the login form data
    else {
      return redirect()->back()->withInput($request->only('email', 'remember'))->withErrors($this->validateRequest( $request));
    }
  }
  public function logout()
  {
    Auth::guard('admin')->logout();
    return redirect('/');
  }

}
