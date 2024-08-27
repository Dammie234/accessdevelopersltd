<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvoiceRow extends Model
{
    use HasFactory;
    protected $fillable = ['invoice_id', 'qty', 'description', 'rate', 'amount', 'invoice_number'];
}
