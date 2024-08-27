<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class HomeController extends Controller
{
   function user($id) {
    $user = User::where('id', $id)->first();
    return response()->json($user);
   }
}
