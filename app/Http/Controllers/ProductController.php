<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function index()
    {
        return view('products');
    }
    public function createProduct()
    {
        return view('create-product');
    }

    public function editProduct(Request $request)
    {
        $id     = $request->id;
        $check  = Product::find($id);
        if($check){
            return view('edit-product',['id'=>$id]);
        }
        return abort(404);
    }
    public function getProduct()
    {
        $products = Product::all();

        return response()->json($products);
    }
    public function getProductById(Request $request)
    {
        $id = $request->id;
        $product = Product::find($id);
        return response()->json($product);
    }
    
    public function addProduct()
    {
        // $products = Request()->all();
        // $query    = Product::create($products);
        // return response()->json($query);


        $requestData = Request()->all();
        // Get the uploaded images
        $images = Request()->file('images');
        $imagePaths = [];
        // Store each image and get their paths
        foreach ($images as $image) {
            $path = $image->store('public/images');
            $imagePaths[] = Storage::url($path);
        }
        // Add the image paths to the request data
        $requestData['images'] = json_encode($imagePaths);
        // Create the product with the updated request data
     
        $product = Product::create($requestData);
        return response()->json($product);
    }

    public function updateProduct(Request $request)
{
    $id = $request->input('id');
    $requestData = $request->except('imageFiles');
    
    // Get the uploaded images
    $images = $request->file('imageFiles');
    if($images){
        $requestData['images'] = json_decode($requestData['images']);
            // Store each image and get their paths
            foreach ($images as $image) {
                $path = $image->store('public/images');
                $imagePath = Storage::url($path);
                array_push($requestData['images'],$imagePath);
            }

            $requestData['images'] = json_encode($requestData['images']);

    }
    $check = Product::find($id); // Retrieve the product you want to update
    
    if ($check) {
        $check->update($requestData); // Update the product attributes
        return response()->json($check);
    } else {
        return response()->json(['error' => 'Product not found'], 404);
    }
}


    public function deleteProduct(Request $request)
    {
        $id = $request->id;
        $product = Product::find($id);
        $query = false;
        if ($product) {
            $query = $product->delete();
        } 
        return response()->json($query);
    }
}
