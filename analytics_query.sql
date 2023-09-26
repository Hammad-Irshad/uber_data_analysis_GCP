CREATE OR REPLACE TABLE `uber_data_analysis.tbl_analytics` AS (
SELECT 
f.trip_id
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
t.trip_distance,
r.rate_code_name,
pe.pickup_latitude,
pe.pickup_longitude,
dr.dropoff_latitude,
dr.dropoff_longitude,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount
FROM 

`uber_data_analysis.fact_table` f
JOIN `uber_data_analysis.datetime_dim` d  ON f.datetime_id=d.datetime_id
JOIN `uber_data_analysis.passenger_count_dim` p  ON p.passenger_count_id=f.passenger_count_id  
JOIN `uber_data_analysis.trip_distance_dim` t  ON t.trip_distance_id=f.trip_distance_id  
JOIN `uber_data_analysis.rate_code_dim` r ON r.rate_code_id=f.rate_code_id  
JOIN `uber_data_analysis.pickup_location_dim` pe ON pe.pickup_location_id=f.pickup_location_id
JOIN `uber_data_analysis.dropoff_location_dim` dr ON dr.dropoff_location_id=f.dropoff_location_id
JOIN `uber_data_analysis.payment_type_dim` pay ON pay.payment_type_id=f.payment_type_id)
;
