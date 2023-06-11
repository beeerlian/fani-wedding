<?php

namespace App\Http\Controllers;

use App\Models\partner;
use App\Models\employee;
use Illuminate\Http\Request;

class PartnerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $partner = partner::all();

        //return view('partners', compact('partner'));
        return response()->json(['data'=>$partner]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
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
        $part=partner::create($request->all());

        $part->save();

        //return redirect()->route('partner.index')->with('part1', 'Partner ditambahkan!');
        return response()->json(['data'=>$part]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $partner = partner::findOrFail($id);

        //return view('update_partners', compact('partner'));
        return response()->json(['data'=>$partner]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, $id)
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
        $part = partner::findOrFail($id);

        $part->name=$request->input('name');
        $part->email=$request->input('email');
        $part->number=$request->input('number');
        $part->keterangan=$request->input('keterangan');
        $part->address=$request->input('address');

        $part->save();

        //return redirect()->route('partner.index')->with('up-part', 'Update berhasil!');
        return response()->json(['data'=>$part]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $part=partner::findOrFail($id);

        $part->delete();

        //return redirect()->route('partner.index')->with('part-del', 'Terhapus!');
        return response()->json(['data'=>$part]);
    }
}
