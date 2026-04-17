CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    birth_date DATE,
    position TEXT,
    department TEXT,
    phone TEXT,
    email TEXT,
    salary DECIMAL(10,2),
    hired_date DATE
);

CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    category TEXT,
    manufacturer TEXT,
    price DECIMAL(10,2),
    quantity INTEGER,
    color TEXT,
    weight TEXT,
    warranty_month INTEGER,
    created_at DATE
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_name TEXT,
    customer_phone TEXT,
    product_id INTEGER,
    quantity INTEGER,
    total_price DECIMAL(10,2),
    payment_type TEXT,
    order_date DATE,
    delivered BOOLEAN,

    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO products (name, category, manufacturer, price, quantity)
VALUES 
('Noutbuk', 'Elektronika', 'Lenovo', 900, 15),
('Telefon', 'Elektronika', 'Samsung', 700, 30);


INSERT INTO orders (customer_name, customer_phone, product_id, quantity, total_price, payment_type, order_date, delivered)
VALUES
('Sardor', '+998901111111', 1, 1, 900, 'Karta', '2024-02-01', 1),
('Malika', '+998902222222', 2, 2, 1400, 'Naqd', '2024-02-03', 0);


SELECT 
    o.id,
    o.customer_name,
    p.name AS product_name,
    o.quantity,
    o.total_price
FROM orders o
JOIN products p ON o.product_id = p.id;

SELECT 
    p.name,
    SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.id
GROUP BY p.name
ORDER BY total_sold DESC;

SELECT 
    p.name,
    SUM(o.total_price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.id
GROUP BY p.name;

SELECT 
    customer_name,
    SUM(total_price) AS total_spent
FROM orders
GROUP BY customer_name
ORDER BY total_spent DESC;
