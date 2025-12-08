<p align="center">
<a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a>
</p>

<p align="center">
<a href="#"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="#"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="#"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="#"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About the Project

This project is built using the [Laravel](https://laravel.com) framework, known for its elegant syntax and feature-rich toolset that makes web application development both enjoyable and efficient. 

The project utilizes the **VILT Stack** (Vue.js, Inertia.js, Laravel, and Tailwind CSS) for full-stack development. The VILT stack provides a streamlined approach to building modern web applications, combining dynamic front-end components with a robust and scalable back-end. 

Additionally, **Flowbite**, a Tailwind CSS component library, is integrated to speed up UI development, offering pre-built, customizable UI elements that enhance the design and functionality of the application.

## Getting Started

### Prerequisites

- **PHP >= 8.0**
- **Composer** for dependency management
- **MySQL** or any other supported database
- **Node.js & NPM** for compiling frontend assets

### Installation

1. Clone the repository: `git clone https://github.com/yourusername/yourproject.git`
2. Navigate into the project directory: `composer install`
3. Install PHP dependencies: `composer install`
4. Install Node.js dependencies and compile assets: `npm install &&  npm run dev`
5. Copy .env.example to .env and configure your database and other environment settings: `cp .env.example .env`
6. Generate the application key: `php artisan key:generate`
7. Run database migrations and seeders: `php artisan migrate --seed`
8. Serve the application: `php artisan serve`

### Project Structure
This project follows Laravel’s default directory structure, with a focus on the following components:
- app/Models: All Eloquent models for interacting with the database.
- app/Http/Controllers: Controllers for handling application logic.
- routes/web.php: Routes for web and API endpoints.
- resources/js: Vue templates for the frontend.
- public/: Assets such as JavaScript, CSS, and images.

### Contributing
Contributions to this project are welcome! Feel free to fork the repository and submit pull requests with improvements.
