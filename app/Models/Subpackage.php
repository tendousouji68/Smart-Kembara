<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subpackage extends Model
{
    use HasFactory;

    protected $table = 'tbl_ap_subpackages'; // Match your table name
    protected $fillable = ['package_id', 'name', 'picture', 'description', 'price'];

    // Relationship: A subpackage belongs to a package
    public function package()
    {
        return $this->belongsTo(Pakej::class, 'package_id');
    }
}
