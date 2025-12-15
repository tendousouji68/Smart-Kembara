<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subpackage extends Model
{
    use HasFactory;

    protected $table = 'tbl_ap_subpackages';  // Your table name
    protected $primaryKey = 'id';  // Primary key field
    protected $fillable = [
        'package_id', 
        'name', 
        'picture', 
        'description', 
        'price', 
        'created_at', 
        'updated_at'
    ];  // Add your fillable fields here

    public function package()
    {
        return $this->belongsTo(Package::class, 'package_id');
    }
}
