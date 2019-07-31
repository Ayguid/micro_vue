<?php

namespace App\Http\Controllers\mailer;
use App\Mail\MailConsulta;
use Illuminate\Support\Facades\Mail;
use Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;


class MailerController extends Controller
{
  // protected $redirectTo = '/home';
  //
  // public function __construct()
  // {
  //     $this->middleware('auth');
  // }

  public function sendMail(Request $request)
  {
    $validator = Validator::make($request->all(), [
      'from' => 'required',
    ]);

    if (!$validator->fails()) {
        Mail::to($request->to)
        ->send(new MailConsulta($request->to, $request->from, $request->product, $request->textArea, 'micro'));//para micro

        Mail::to($request->from)
        ->send(new MailConsulta($request->from, $request->to, $request->product, $request->textArea, 'user'));//para usuario

        app()->setLocale($request->locale);
        return response()->json([
          'status' => 'ok',
          'message'=>\Lang::get('messages.email_sent')
        ]);
    }
    else {
      return response()->json([
        'status' => 'error',
        'errors' => $validator->messages()
      ]);
    }

  }



}
