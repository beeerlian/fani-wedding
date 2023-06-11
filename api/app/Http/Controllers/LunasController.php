<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\order;

class LunasController extends Controller
{
     public function index()
     {
        $lunas = Order::where('payment_status', 'lunas')->get();

        //return view ('lunas', compact('lunas'));
        return response()->json(['data'=>$lunas]);
     }

     public function update(Request $request, $id)
     {
        $order = Order::findOrFail($id);

        $order->payment_status=$request->input('payment_status');

        $order->save();

        /*
        if ($order->payment_status=='Belum lunas') {
            return redirect()->route('lunas.index')->with('lun1', 'Order belum lunas!');
        }elseif($order->payment_status=='Lunas'){
            return redirect()->route('lunas.index')->with('lun2', 'Order lunas');


        }*/
        return response()->json(['data'=>$order]);
         }

     public function destroy($id)
     {
        $notlunas = Order::findOrFail($id);

    if ($notlunas->proof_payment) {
        $oldFilePath = public_path('bukti/'.$notlunas->proof_payment);
        if (file_exists($oldFilePath)) {
            unlink($oldFilePath);
        }
    }
    $notlunas->delete();

    return redirect()->route('lunas.index')->with('lunasdel', 'Terhapus!');
    //return response()->json(['data'=>$notlunas]);
     }
}
