<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pakej extends Model
{
    use HasFactory;

    protected $table = 'tbl_ap_packages'; // Match your table name
    protected $fillable = ['nama'];

    // Relationship: A package has many subpackages
    public function subpackages()
    {
        return $this->hasMany(Subpackage::class, 'package_id');
    }
}
