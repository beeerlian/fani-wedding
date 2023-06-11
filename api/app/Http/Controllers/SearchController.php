<?php

namespace App\Http\Controllers;

use App\Models\product;
use Illuminate\Contracts\Pagination\Paginator;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        $search = $request->input('search');

        // Lakukan pencarian berdasarkan keyword di model yang sesuai
        $results = product::where('name', 'like', '%' . $search . '%')->get();

        // Mengembalikan hasil pencarian dalam respons JSON
        return response()->json($results);
    }
}
