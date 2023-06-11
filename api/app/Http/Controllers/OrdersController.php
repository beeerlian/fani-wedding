<?php

namespace App\Http\Controllers;

use App\Models\order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class OrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $order = order::where('payment_status', null)->get();

        return view('placed_orders',compact('order'));
        //return response()->json(['data'=>$order]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, $id)
    {

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $order = Order::findOrFail($id);

        $order->order_status=$request->input('order_status');
        $order->payment_status=$request->input('payment_status');

        $order->save();


        if (($order->order_status=='Ditolak')&&($order->payment_status=='Belum lunas')) {
            return redirect()->route('orders.index')->with('succ1', 'Order ditolak!')->with('succ11', 'Order belum lunas!');
        }elseif(($order->order_status=='Ditolak')&&($order->payment_status=='Lunas')){
            return redirect()->route('orders.index')->with('succ2', 'Order ditolak')->with('succ22', 'Order lunas!');
        }elseif(($order->order_status=='Diterima')&&($order->payment_status=='Belum lunas')){
            return redirect()->route('orders.index')->with('succ3', 'Order diterima!')->with('succ33', 'Order belum lunas!');
        }elseif(($order->order_status=='Diterima')&&($order->payment_status=='Lunas')){
            return redirect()->route('orders.index')->with('succ4', 'Order diterima!')->with('succ44', 'Order lunas!');
        }elseif(($order->order_status=='Diterima')&&($order->payment_status==NULL)){
            return redirect()->route('orders.index')->with('succ5', 'Order diterima!');
        }elseif(($order->order_status=='Ditolak')&&($order->payment_status==NULL)){
            return redirect()->route('orders.index')->with('succ6', 'Order ditolak!');
        }elseif(($order->order_status==NULL)&&($order->payment_status=='Belum lunas')){
            return redirect()->route('orders.index')->with('succ7', 'Belum lunas!');
        }elseif(($order->order_status==NULL)&&($order->payment_status=='Lunas')){
            return redirect()->route('orders.index')->with('succ8', 'Lunas!');
        }
        else{
            return redirect()->route('orders.index')->with('lun', 'Terjadi Error!');
        }

        //return response()->json(['data'=>$order]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
{
    $order = Order::findOrFail($id);


    if ($order->proof_payment) {
        $oldFilePath = public_path('bukti/'.$order->proof_payment);
        if (file_exists($oldFilePath)) {
            unlink($oldFilePath);
        }
    }
    $order->delete();

    return redirect()->route('orders.index')->with('del', 'Data berhasil dihapus');
}

}
