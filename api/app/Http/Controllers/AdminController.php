<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\user;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $admin = user::all();

        return view ('admin_accounts', compact('admin'));
        //return response()->json(['data' => $admin]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function add()
    {
        $admin=user::all();

        return view('register_admin', compact('admin'));
       //return response()->json(['data'=>$admin]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $edit = User::findOrFail($id);

        return view('update_profile', compact('edit'));
        //return response()->json(['data'=>$edit]);
    }

    public function store(Request $request)
    {

        $admin=User::create($request->all());

        $admin->password = Hash::make($request->password);

        $admin->save();

        return redirect()->route('admin.index')->with('reg-admin', 'Akun ditambahkan!');
        //return response()->json(['data'=>$admin]);
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

        $user = user::findOrFail($id);

            $user->name = $request->input('name');
            $user->number = $request->input('number');
            $user->address = $request->input('address');
            $user->password = hash::make($request->input('password'));
            $user->save();

        return redirect()->route('admin.index')->with('same', 'Data diupdate');
        //return response()->json(['data'=>$user]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $admin = user::findOrFail($id);

        $admin->delete();

        return redirect()->route('admin.index')->with('hapusadm', 'Dihapus!');
        //return response()->json(['data'=>$admin]);
    }
}
