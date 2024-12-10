-- 1. 3 pelanggan teratas berdasarkan total nominal pesanan
SELECT c.first_name, c.last_name,
	SUM(o.total_amount) total_order_amount
FROM customers c
JOIN orders o on o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_order_amount DESC
LIMIT 3;

-- 2. rata-rata nominal pesanan untuk setiap pelanggan
SELECT c.first_name, c.last_name,
	AVG(o.total_amount) avg_order
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id;

-- 3. karyawan yang sudah menyelesaikan lebih dari 4 tiket support
SELECT e.first_name, e.last_name, COUNT(s.ticket_id) resolved_ticket
FROM employees e
JOIN supporttickets s ON s.employee_id = e.employee_id
WHERE s.status = 'resolved'
GROUP BY e.employee_id
HAVING resolved_ticket > 4;

-- 4. semua produk yang belum pernah dipesan
SELECT p.product_name
FROM products p
LEFT JOIN orderdetails od ON od.product_id = p.product_id
WHERE od.order_id IS NULL;

-- 5. total pendapatan yang dihasilkan dari penjualan
SELECT SUM(quantity * unit_price) total_revenue
FROM orderdetails; 

-- 6. harga rata-rata tiap kategori dan harga rata-rata yang lebih dari $500
WITH 
cte_avg_price AS(
	SELECT category, AVG(price) rerata
	FROM products
	GROUP BY category
)
SELECT * 
FROM cte_avg_price
WHERE rerata > 500;

-- 7. pelanggan yang membuat setidaknya 1 pesanan dengan total jumlah > $1000
SELECT * 
FROM customers
WHERE customer_id IN (
	SELECT customer_id
	FROM orders
	WHERE total_amount > 1000);