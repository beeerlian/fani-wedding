<?php

namespace App\Http\Controllers;

use App\Models\order;
use Illuminate\Http\Request;

class BelumLunasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $notlunas = Order::where('payment_status', 'Belum lunas')->get();

        //return view('belum_lunas', compact('notlunas'));
        return response()->json(['data'=>$notlunas]);
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
    public function edit($id)
    {
        //
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

        $order->payment_status=$request->input('payment_status');

        $order->save();

        /*
        if ($order->payment_status=='Belum lunas') {
            return redirect()->route('belumlunas.index')->with('lunasup2', 'Order belum lunas!');
        }elseif($order->payment_status=='Lunas'){
            return redirect()->route('belumlunas.index')->with('lunasup', 'Order lunas!');
        }
        */
        return response()->json(['data'=>$order]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $lunas = Order::findOrFail($id);

    if ($lunas->proof_payment) {
        $oldFilePath = public_path('bukti/'.$lunas->proof_payment);
        if (file_exists($oldFilePath)) {
            unlink($oldFilePath);
        }
    }
    $lunas->delete();

    //return redirect()->route('belumlunas.index')->with('notlunasdel', 'Terhapus!');
    return response()->json(['data'=>$lunas]);
    }
}
