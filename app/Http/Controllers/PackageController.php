<?php

namespace App\Http\Controllers;

use App\Models\Package;
use App\Models\Subpackage;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PackageController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
     {
        // Fetch all packages along with their subpackages
        $packages = Package::with('subpackages')->get();

        // Return data to Inertia
        return Inertia::render('Packages/Index', [
            'packages' => $packages,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
       return Inertia::render('Packages/Create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Validate the data
        $validated = $request->validate([
            'nama' => 'required|string|max:255',
            'PackageCode' => 'nullable|string|max:255',
            'PackageStatus' => 'required|boolean',
            'subpackages' => 'required|array',  // Validate subpackages array
            'subpackages.*.name' => 'required|string|max:255',  // Validate subpackage names
        ]);

        // Create the package
        $package = Package::create([
            'nama' => $validated['nama'],
            'PackageCode' => $validated['PackageCode'],
            'PackageStatus' => $validated['PackageStatus'],
        ]);

        // Create the subpackages and associate them with the package
        foreach ($validated['subpackages'] as $subpackageData) {
            Subpackage::create([
                'name' => $subpackageData['name'],
                'package_id' => $package->id,  // Associate with the created package
            ]);
        }

        // Redirect to the packages index page with a success message
        return redirect()->route('packages.index')->with('success', 'Package and subpackages created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        // Find the package with its subpackages
        $package = Package::with('subpackages')->findOrFail($id);

        // Pass the package and its subpackages to the edit view
        return Inertia::render('Packages/Edit', [
            'package' => $package,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
{
    // Validate the input data (added rule for 'deleted')
    $validated = $request->validate([
        'nama' => 'required|string|max:255',
        'PackageCode' => 'nullable|string|max:255',
        'PackageStatus' => 'required|boolean',
        'subpackages' => 'required|array',
        'subpackages.*.id' => 'nullable|exists:tbl_ap_subpackages,id', // For existing subpackages
        'subpackages.*.name' => 'required|string|max:255',
        'subpackages.*.deleted' => 'nullable|boolean', // Allow 'deleted' flag for existing subpackages
    ]);

    // Find the package
    $package = Package::findOrFail($id);

    // Update the package
    $package->update([
        'nama' => $validated['nama'],
        'PackageCode' => $validated['PackageCode'],
        'PackageStatus' => $validated['PackageStatus'],
    ]);

    // Handle the subpackage updates and deletions
    foreach ($validated['subpackages'] as $subpackageData) {
        if (isset($subpackageData['id'])) {
            // If the subpackage is marked as deleted, delete it
            if (isset($subpackageData['deleted']) && $subpackageData['deleted']) {
                $subpackage = Subpackage::findOrFail($subpackageData['id']);
                $subpackage->delete();
            } else {
                // Update the existing subpackage
                $subpackage = Subpackage::findOrFail($subpackageData['id']);
                $subpackage->update([
                    'name' => $subpackageData['name'],
                ]);
            }
        } else {
            // Create a new subpackage if it doesn't exist
            Subpackage::create([
                'name' => $subpackageData['name'],
                'package_id' => $package->id,
            ]);
        }
    }

    // Redirect to the package index with a success message
    return redirect()->route('packages.index')->with('success', 'Package updated successfully.');
}

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // Find the package along with its subpackages
        $package = Package::with('subpackages')->findOrFail($id);

        // Delete all associated subpackages
        foreach ($package->subpackages as $subpackage) {
            $subpackage->delete();
        }

        // Delete the package itself
        $package->delete();

        // Return a success response
        return to_route("packages.index");
    }
}
