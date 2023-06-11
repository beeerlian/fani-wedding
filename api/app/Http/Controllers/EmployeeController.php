<?php

namespace App\Http\Controllers;

use App\Models\employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class EmployeeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $employee = Employee::all();

        //return view('employees', compact('employee'));
        return response()->json(['data'=>$employee]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $emp=employee::create($request->all());

        $emp->save();

        //return redirect()->route('employee.index')->with('reg-emp', 'Akun ditambahkan!');
        return response()->json(['data'=>$emp]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $employee = Employee::findOrFail($id);

        //return view('update_employees', compact('employee'));
        return response()->json(['data'=>$employee]);
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
        $emp = employee::findOrFail($id);

        $emp->name=$request->input('name');
        $emp->email=$request->input('email');
        $emp->number=$request->input('number');
        $emp->position=$request->input('position');
        $emp->address=$request->input('address');

        $emp->save();

        //return redirect()->route('employee.index')->with('up-emp', 'Update berhasil!');
        return response()->json(['data'=>$emp]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $emp = employee::findOrFail($id);

        $emp -> delete();

        //return redirect()->route('employee.index')->with('del-emp', 'Dihapus!');
        return response()->json(['data'=>$emp]);
    }

}
