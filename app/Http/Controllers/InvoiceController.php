<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Company;
use App\Invoice;
use App\InvoiceRow;
use Illuminate\Support\Facades\DB;

class InvoiceController extends Controller
{
    function companies() {
        $companies = Company::all();
        return response()->json($companies);
    }

    function store(Request $request) {
        $this->validate($request, [
            'company' => 'required',
            'to' => 'required|string',
            'title' => 'required|string'
        ]);

        // get invoice number
        $last_sale = Invoice::orderBy('id', 'desc')->first();
        if (empty($last_sale)) {
            $last_invoice = '700000';
        } else {
            $last_invoice = $last_sale->invoice_number;
        }
        $last_invoice++;

        $invoice_no = sprintf('%05d', $last_invoice);

        $invoice = Invoice::create([
            'company_id' => $request->company,
            'to' => $request->to,
            'date' => date('Y-m-d'),
            'invoice_number' => $invoice_no,
            'title' => $request->title,
            'service_charge' => $request->service_charge,
            'vat' => $request->vat
        ]);
        $number_of_rows = $request->number_of_rows;
        for ($i = 0; $i < $number_of_rows; $i++) {
            InvoiceRow::create([
                'invoice_id' => $invoice->id,
                'qty' => $request->qty[$i],
                'description' => $request->description[$i],
                'rate' => $request->rate[$i],
                'amount' =>  ($request->qty[$i] * $request->rate[$i]),
                'invoice_number' => $invoice_no
            ]);
        }

        return response()->json(['message' => 'Invoice created successfully']);
    }

    function index() {
        $invoices = DB::table('invoices')
                        ->leftJoin('companies', 'companies.id', '=', 'invoices.company_id')
                        ->select('invoices.*', 'companies.name')
                        ->orderBy('invoices.id', 'desc')
                        ->get();
        return response()->json($invoices);
    }
    function invoices() {
        $invoices = DB::table('invoices')
                        ->leftJoin('companies', 'companies.id', '=', 'invoices.company_id')
                        ->select('invoices.*', 'companies.name')
                        ->orderBy('invoices.id', 'desc')
                        ->take(10)
                        ->get();
        return response()->json($invoices);
    }

    function show($id) {
        $invoice = DB::table('invoices')
                        ->leftJoin('companies', 'companies.id', '=', 'invoices.company_id')
                        ->leftJoin('organizations', 'organizations.address', '=', 'invoices.to')
                        ->where('invoices.id', $id)
                        ->select('invoices.*', 'companies.name', 'companies.address', 'companies.logo', 'organizations.name as organization')
                        ->first();
        $invoice_rows = InvoiceRow::where('invoice_id', $id)->get();

        return response()->json(['invoice' => $invoice, 'invoice_rows' => $invoice_rows]);
    }

}
