<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use HasFactory;
    protected $fillable = ['company_id', 'to', 'date', 'invoice_number', 'title', 'service_charge', 'vat'];
}
