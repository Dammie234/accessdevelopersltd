<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Organization;

class OrganizationController extends Controller
{
    function store(Request $request) {
        $this->validate($request, [
            'name' => 'required|string|unique:organizations',
            'address' => 'required|string'
        ]);

        Organization::create([
            'name' => $request->name,
            'address' => $request->address
        ]);

        return response()->json(['message' => 'Organization successfully added']);
    }

    function index() {
        $organizations = Organization::all();
        return response()->json($organizations);
    }

    function show($id) {
        $organization = Organization::where('id', $id)->first();
        return response()->json($organization);
    }

    function update(Request $request, $id) {
        $this->validate($request, [
            'name' => 'required|string',
            'address' => 'required|string'
        ]);

        Organization::where('id', $id)->update([
            'name' => $request->name,
            'address' => $request->address
        ]);

        return response()->json(['message' => 'Organization successfully updated']);
    }
}
