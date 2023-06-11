<?php

namespace App\Http\Controllers;

use App\Models\product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $product = product::all();

        return view('products',compact('product'));
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
        $product=Product::create($request->all());

        if ($request->hasFile('image')) {
            $request->file('image')->move('images/', $request->file('image')->getClientOriginalName());
            $product->image=$request->file('image')->getClientOriginalName();
            $product->save();
        }

        return redirect()->route('products.index')->with('prodsucc', 'Produk berhasil ditambahkan!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = Product::findOrFail($id);

        return view('update_product', compact('product'));
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

        $product = Product::findOrFail($id);

        $product->name=$request->input('name');
        $product->category=$request->input('category');
        $product->keterangan=$request->input('keterangan');
        $product->price=$request->input('price');

        if ($request->hasFile('image')) {
        $myFile = 'images/'.$product->image;
        if(File::exists($myFile))
        {
            File::delete($myFile);
        }

        $request->file('image')->move('images/', $request->file('image')->getClientOriginalName());
        $product->image=$request->file('image')->getClientOriginalName();
    }

        $product->save();

    return redirect()->route('products.index')->with('success', 'Berhasil update data');
}
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::findOrFail($id);

        if ($product->image) {
            $oldFilePath = public_path('images/'.$product->image);
            if(file_exists($oldFilePath)){
            unlink($oldFilePath);
        }}

        $product -> delete();

        return redirect()->route('products.index')->with('success', 'Berhasil hapus data');
    }

}
