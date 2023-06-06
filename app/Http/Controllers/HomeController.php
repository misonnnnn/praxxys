<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    // /**
    //  * Create a new controller instance.
    //  *
    //  * @return void
    //  */
    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }

    // /**
    //  * Show the application dashboard.
    //  *
    //  * @return \Illuminate\Contracts\Support\Renderable
    //  */
    public function index()
    {
        $productCount = Product::count();
        $userCount    = User::count();
        $products      = Product::all();
        return view('home',[
            'productCount' => $productCount,
            'userCount'    => $userCount,
            'products'     => $products
        ]);
    }
}
