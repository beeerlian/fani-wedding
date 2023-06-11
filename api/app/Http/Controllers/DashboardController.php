<?php

namespace App\Http\Controllers;

use App\Models\customer;
use App\Models\product;
use App\Models\review;
use App\Models\order;
use App\Models\user;
use App\Models\message;
use App\Models\employee;
use App\Models\partner;

class DashboardController extends Controller
{
    public function index()
    {
        $data=[
            'productcount' => product::count(),
            'orderscount' => order::where('payment_status', NULL)->count(),
            'lunassum' => order::where('payment_status', 'Lunas')->sum('total_price'),
            'notlunassum' => order::where('payment_status', 'Belum lunas')->sum('total_price'),
            'lunascount' => order::count(),
            'notlunascount' => order::count(),
            'admincount' => user::count(),
            'customercount' => customer::count(),
            'employeecount' => employee::count(),
            'partnercount' => partner::count(),
            'messagecount' => message::count(),
            'reviewcount' => review::count(),
        ];


        return view('dashboard')
        ->with('productcount', $data['productcount'])
        ->with('orderscount', $data['orderscount'])
        ->with('lunassum', $data['lunassum'])
        ->with('notlunassum', $data['notlunassum'])
        ->with('lunascount', $data['lunascount'])
        ->with('notlunascount', $data['notlunascount'])
        ->with('admincount', $data['admincount'])
        ->with('customercount', $data['customercount'])
        ->with('employeecount', $data['employeecount'])
        ->with('partnercount', $data['partnercount'])
        ->with('messagecount', $data['messagecount'])
        ->with('reviewcount', $data['reviewcount']);


        //return response()->json(['data' => $data]);
    }
}
