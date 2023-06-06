# PRAXYYYS


## Features
- Dashboard
- Product List
- Create Product 
- Videos

## Installation

1. Clone the repository:
git clone <repository_url>

2. Install the dependencies:
composer install

3. Set up the database:

- Create a MySQL database named `praxxys`.
- Configure the database connection in the `.env` file.

4. Migrate the database:
php artisan migrate

5. Seed the database:

php artisan db:seed
php artisan db:seed --class=productSeeder



