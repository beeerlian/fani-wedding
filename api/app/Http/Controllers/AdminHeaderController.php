<?php

namespace App\Http\Controllers;
use App\Models\user;
use Illuminate\Contracts\Session\Session;
use Illuminate\Http\Request;

class AdminHeaderController extends Controller
{
    public function index()
    {
        $header = user::all();

        //return view('components.admin_header', ['header' => $header]);
        return response()->json(['data'=>$header]);
    }
}
