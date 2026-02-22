Create database uber;

use uber;

set global local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE 'D:/Uber Project/uber_data_cleaned.csv'
INTO TABLE uber_rides
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE uber_rides (
    `date` DATE,
    `time` TIME,

    booking_id VARCHAR(20) PRIMARY KEY,
    booking_status VARCHAR(30),
    customer_id VARCHAR(20),

    vehicle_type VARCHAR(50),
    pickup_location VARCHAR(100),
    drop_location VARCHAR(100),

    avg_vtat DECIMAL(6,2),
    avg_ctat DECIMAL(6,2),

    cancelled_rides_by_customer TINYINT,
    reason_for_cancelling_by_customer VARCHAR(255),

    cancelled_rides_by_driver TINYINT,
    driver_cancellation_reason VARCHAR(255),

    incomplete_rides TINYINT,
    incomplete_rides_reason VARCHAR(255),

    booking_value DECIMAL(10,2),
    ride_distance DECIMAL(8,2),

    payment_method VARCHAR(30),

    `datetime` DATETIME
);
 select 
	customer_id,
	count(customer_id) as customer_count 
from uber_rides
group by customer_id
having count(booking_id) > 2;

select
	sum(booking_value) total_customer_value
from uber_rides 
where customer_id = "CID4523979"