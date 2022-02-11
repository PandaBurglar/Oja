-- Drop and recreate Users table (Example)

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS product_order CASCADE;


CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  admin BOOLEAN NOT NULL
);
CREATE TABLE products(
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
  product_name VARCHAR(255) NOT NULL,
  product_price NUMERIC NOT NULL,
  description TEXT NOT NULL,
  image VARCHAR(255) NOT NULL, 
  avaliability DATERANGE NOT NULL, 
  bag BOOLEAN Not NULL
);


CREATE TABLE orders (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  placed_at TIMESTAMP DEFAULT NOW(),
  status VARCHAR(30) DEFAULT 'Pending',
  expected_pickup VARCHAR(30),
  payment_method TEXT DEFAULT 'Credit Card',
  total_price SMALLINT DEFAULT 0,
  packageSent TIMESTAMP NOT NULL,
  packageRecieved TIMESTAMP NOT NULL
);


CREATE TABLE product_order (
  id SERIAL PRIMARY KEY NOT NULL,
  product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
  order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
  quantity SMALLINT DEFAULT 0, 
  total_price SMALLINT NOT NULL
);