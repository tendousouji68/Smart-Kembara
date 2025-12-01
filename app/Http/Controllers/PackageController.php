<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pakej;
use App\Models\Subpackage;

class PackageController extends Controller
{
    // Method to show the Smart Umrah page with dynamic subpackages
    public function showSmartUmrah()
    {
        // Fetch the "Smart Umrah" package and its subpackages
        $package = Pakej::where('nama', 'Smart Umrah')->first();
        $subpackages = $package ? $package->subpackages : collect(); // Use collection if no package found

        return view('pakej.smart-umrah', compact('subpackages'));
    }

    // Method to show details for a specific subpackage
    public function showPackageDetail($id)
    {
        // Fetch the subpackage by ID, including its related package
        $subpackage = Subpackage::with('package')->findOrFail($id);

        return view('pakej.pakej-detail', compact('subpackage'));
    }

    public function showSmartTravel()
    {
        // Fetch the "Smart Travel" package and its subpackages
        $package = Pakej::where('nama', 'Smart Travel')->first();
        $subpackages = $package ? $package->subpackages : collect(); // Use collection if no package found
        return view('pakej.smart-travel', compact('subpackages'));
    }
}
