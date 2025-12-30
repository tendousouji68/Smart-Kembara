@extends('admin/layouts/contentNavbarLayout')

@section('vendor-style')
@vite('resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.scss')
@endsection

@section('vendor-script')
@vite('resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js')
@endsection

@section('page-script')
@vite('resources/assets/js/extended-ui-perfect-scrollbar.js')
@endsection

@section('content')
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>

    <style>
        
        .container {
            max-width: 100%;
            margin-top: 20px;
        }
        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .col-md-8, .col-md-4 {
            margin-bottom: 20px;
        }
        .form-container {
            margin-bottom: 20px;
        }
        .form-container input, .form-container select {
            width: 100%;
            margin-bottom: 10px;
        }
        .register-button {
            position: relative;
        }
        .modal-content {
            padding: 15px;
        }
        .filter-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 10px; /* Add space between buttons */
        }
        .user-actions button {
            margin-right: 10px;
        }
        .table-responsive {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row align-items-center">
            <!-- Left Column: User Management Title -->
            <div class="col-md-8">
                <h2 class="text-left">User Management</h2>
            </div>

            <!-- Right Column: Add User and Filter Buttons -->
            <div class="col-md-4 text-end">
                <div class="filter-buttons">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">Add User</button>
                    <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#filterModal">Filter</button>
                </div>
            </div>
        </div>

        <!-- User Table -->
        <div class="table-responsive">
            <table class="table table-bordered" id="userTable">
                <thead>
                    <tr>
                        <th>Role</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Telephone</th>
                        <th>Branch</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Users will be dynamically added here -->
                </tbody>
            </table>
        </div>

        <!-- Modal for Adding User -->
        <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addUserModalLabel">Add New User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="userForm">
                            <div class="mb-3">
                                <label for="role" class="form-label">Role</label>
                                <select class="form-control" id="role" required>
                                    <option value="Admin">Admin</option>
                                    <option value="User">User</option>
                                    <option value="Manager">Manager</option>
                                    <option value="HR">HR</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" placeholder="Enter Name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter Email" required>
                            </div>
                            <div class="mb-3">
                                <label for="telephone" class="form-label">Telephone</label>
                                <input type="tel" class="form-control" id="telephone" placeholder="Enter Telephone" required>
                            </div>
                            <div class="mb-3">
                                <label for="branch" class="form-label">Branch</label>
                                <input type="text" class="form-control" id="branch" placeholder="Enter Branch" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add User</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for Filter -->
        <div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="filterModalLabel">Filter Users</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="roleFilter" class="form-label">Role</label>
                            <select class="form-control" id="roleFilter">
                                <option value="">All</option>
                                <option value="Admin">Admin</option>
                                <option value="User">User</option>
                                <option value="Manager">Manager</option>
                                <option value="HR">HR</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="branchFilter" class="form-label">Branch</label>
                            <input type="text" class="form-control" id="branchFilter" placeholder="Enter Branch to filter">
                        </div>
                        <div class="mb-3">
                            <label for="nameFilter" class="form-label">Name</label>
                            <input type="text" class="form-control" id="nameFilter" placeholder="Enter Name to filter">
                        </div>
                        <button class="btn btn-primary" onclick="applyFilters()">Apply Filters</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Function to handle adding users
        document.getElementById('userForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form submission

            // Get user input values
            const role = document.getElementById('role').value;
            const name = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const telephone = document.getElementById('telephone').value;
            const branch = document.getElementById('branch').value;

            // Create a new row in the table
            const tableBody = document.getElementById('userTable').getElementsByTagName('tbody')[0];
            const newRow = tableBody.insertRow();

            // Insert new cells with user data
            newRow.insertCell(0).textContent = role;
            newRow.insertCell(1).textContent = name;
            newRow.insertCell(2).textContent = email;
            newRow.insertCell(3).textContent = telephone;
            newRow.insertCell(4).textContent = branch;

            // Add action buttons
            const actionCell = newRow.insertCell(5);
            actionCell.classList.add('user-actions');
            actionCell.innerHTML = `
                <button class="btn btn-info btn-sm">View</button>
                <button class="btn btn-danger btn-sm">Delete</button>
                <button class="btn btn-warning btn-sm">Edit</button>
            `;

            // Reset the form and close the modal
            document.getElementById('userForm').reset();
            const modal = bootstrap.Modal.getInstance(document.getElementById('addUserModal'));
            modal.hide();
        });

        // Function to apply filters
        function applyFilters() {
            const roleFilter = document.getElementById('roleFilter').value.toLowerCase();
            const branchFilter = document.getElementById('branchFilter').value.toLowerCase();
            const nameFilter = document.getElementById('nameFilter').value.toLowerCase();

            const rows = document.getElementById('userTable').getElementsByTagName('tbody')[0].rows;

            for (let i = 0; i < rows.length; i++) {
                const roleCell = rows[i].cells[0];
                const branchCell = rows[i].cells[4];
                const nameCell = rows[i].cells[1];

                const roleText = roleCell.textContent.toLowerCase();
                const branchText = branchCell.textContent.toLowerCase();
                const nameText = nameCell.textContent.toLowerCase();

                if ((roleFilter === "" || roleText.includes(roleFilter)) &&
                    (branchFilter === "" || branchText.includes(branchFilter)) &&
                    (nameFilter === "" || nameText.includes(nameFilter))) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }

            const filterModal = bootstrap.Modal.getInstance(document.getElementById('filterModal'));
            filterModal.hide();
        }
    </script>
</body>
 @endsection