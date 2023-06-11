<?php

namespace App\Http\Controllers;

use App\Models\order;
use Illuminate\Http\Request;
use App\Models\order as ModelsOrder;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;


class ImageController extends Controller
{
    public function download($id)
    {
        $order = Order::findOrFail($id);

        if ($order->image) {
            $path = public_path('images/'.$order->image);
            return Response::download($path);
        }{
    return redirect()->route('orders.index')->with('success', 'Produk berhasil ditambahkan!');
}}}


