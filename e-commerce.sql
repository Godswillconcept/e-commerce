CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255),
    dob DATETIME NOT NULL,
    gender ENUM("Male", "Female")
),
CREATE TABLE IF NOT EXISTS vendors (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL UNIQUE,
    `address` VARCHAR(255),
),
CREATE TABLE IF NOT EXISTS categories (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `parent_id` INT,
    FOREIGN KEY (parent_id) REFERENCES categories(id) ON DELETE CASCADE ON UPDATE CASCADE,
    `description` VARCHAR(255) NOT NULL,
    `icon` VARCHAR(255) NOT NULL
),
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `category_id` INT,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE ON UPDATE CASCADE,
    `brand` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `quantity` INT DEFAULT 1,
    `image` VARCHAR(255)
),
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `user_id` INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    `order_date` DATETIME,
    `status` ENUM('Processing', 'Pending', "Delivered")
),
CREATE TABLE IF NOT EXISTS order_details (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `order_id` INT,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE ON UPDATE CASCADE,
    `product_id` INT,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    quantity INT not NULL DEFAULT 1,
    `total_amount` DECIMAL(10, 2) NOT NULL
),
CREATE TABLE IF NOT EXISTS payments (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `order_id` INT,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE ON UPDATE CASCADE,
    `payment_date` DATETIME,
    `payment_amount` DECIMAL(10, 2),
    `payment_method` ENUM('Credit/Debit_card', "PayPal", "COD")
),
CREATE TABLE IF NOT EXISTS carts (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `user_id` INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
),
CREATE TABLE IF NOT EXISTS cart_details(
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `cart_id` INT,
    FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE ON UPDATE CASCADE,
    `product_id` INT,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    `quantity` INT NOT NULL DEFAULT 1
),
CREATE TABLE IF NOT EXISTS reviews(
    id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `product_id` INT,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    `user_id` INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    `rating` ENUM("one", "two", "three", "four", "five"),
    `comment` VARCHAR(255) NOT NULL,
    `review_date` DATETIME
),
CREATE TABLE IF NOT EXISTS supplies(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `product_id` INT,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    `vendor_id` INT,
    FOREIGN KEY (vendor_id) REFERENCES vendors(id) ON DELETE CASCADE ON UPDATE CASCADE,
    `quantity` INT NOT NULL DEFAULT 1,
    `total_amount` DECIMAL(10, 2) NOT NULL,
    `date` DATETIME
),
