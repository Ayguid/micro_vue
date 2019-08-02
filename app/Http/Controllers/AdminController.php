<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Admin;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('admin');
    }




    public function adminProfiles()
    {
      $data['admins']=Admin::all();
      return view('admin.profiles-view')->with('data', $data);
    }

    public function addAdmin(Request $request)
    {
      $validator = Validator::make($request->all(), [
        'email' => 'unique:admins',
        'password' => ['required', 'string', 'min:8', 'confirmed'],
      ]);
        if(!$validator->fails()){

      Admin::create([
                'name' => $request['name'],
                'email' => $request['email'],
                'job_title' => $request['job_title'],
                'country_id' => $request['country_id'],
                'contactable' => $request['contactable'],
                'password' => Hash::make($request['password']),
      ]);
      return redirect()->route('adminProfiles');
    }else {
      $request->session()->flash('alert-danger', 'Oops there was a problem!');
      return redirect()->back()->withInput($request->all())->withErrors($validator);
    }
    }


    public function editAdmin($id)
    {
      $adminProfile = Admin::find($id);
      $data['adminProfile']=$adminProfile;
      return view('admin.profile-edit')->with('data', $data);
    }



    public function updateAdmin(Request $request)
    {
      $adminProfile = Admin::find($request->admin_id);
      $rules=[
        'email'=>'required'
      ];
      if ($request->email!==$adminProfile->email) {
        $rules=[
          'email'=>'unique:admins'
        ];
      }

      $validator = Validator::make($request->all(), [
        'email' => $rules,
      ]);


      if (!$validator->fails()) {
        // code...
      ($request['contactable'])?$request['contactable']:$request['contactable']=null;

      $adminProfile->update($request->all());
      $save = $data['adminProfile']=$adminProfile;

      if ($save)
      {
        $request->session()->flash('alert-success', 'Editaste con exito!');
        return redirect()->back();
      }
    }
    else {
      $request->session()->flash('alert-danger', 'Oops there was a problem!');
      return redirect()->back()->withInput($request->all())->withErrors($validator);
    }
      // return view('admin.profile-edit')->with('data', $data);
    }






}
