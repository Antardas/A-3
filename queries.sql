-- Query 1: JOIN
SELECT
    b.booking_id,
    u.name AS customer_name,
    v.name as vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status AS status
FROM
    bookings as b
    INNER JOIN users as u ON b.user_id = u.user_id
    INNER JOIN vehicles AS v ON b.vehicle_id = v.vehicle_id;

-- Query 2: EXISTS
SELECT *
FROM vehicles v
WHERE
    NOT EXISTS (
        SELECT *
        FROM bookings b
        WHERE
            b.vehicle_id = v.vehicle_id
    );

-- Query 2: WHERE

SELECT *
FROM vehicles AS v
WHERE
    v.status = 'available'
    AND v.type = 'car';

--Query 4: GROUP BY and HAVING


SELECT v.name AS vehicle_name, COUNT(b.vehicle_id) AS total_bookings 
FROM vehicles v
    INNER JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY
    v.vehicle_id,
    v.name
HAVING
    COUNT(b.vehicle_id) > 2;
