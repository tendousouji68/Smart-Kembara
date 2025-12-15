<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    use HasFactory;

    protected $table = 'tbl_ap_packages';  // Your table name
    protected $primaryKey = 'id';  // Primary key field
    protected $fillable = [
        'nama', 
        'PackageCode', 
        'Agency', 
        'BranchAgency', 
        'PackageStatus', 
        'created_at', 
        'updated_at'
    ];  // Add your fillable fields here

    public function subpackages()
    {
        return $this->hasMany(Subpackage::class, 'package_id');
    }
}
