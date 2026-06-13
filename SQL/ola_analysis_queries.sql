use ola;

create table bookings(
booking_Date                             datetime,
booking_Time                             time,
Booking_ID                        int,
Booking_Status                    varchar(20),
Customer_ID                       int,
Vehicle_Type                      varchar(10),
Pickup_Location                   varchar(10),
Drop_Location                     varchar(10),
V_TAT                         float,
C_TAT                         float,
Canceled_Rides_by_Customer        varchar(20),
Canceled_Rides_by_Driver          varchar(20),
Incomplete_Rides                  varchar(10),
Incomplete_Rides_Reason           varchar(10),
Booking_Value                   int,
Payment_Method                    varchar(10),
Ride_Distance                   int,
Driver_Ratings                float,
Customer_Rating               float
);


select * from bookings;

# 1. retrive all successfull bookings
create view successfull_bookings as
select * from bookings 
where Booking_Status = 'success';

# 2. find the avarage ride distance for each vehical type
create view ride_distance_for_each_vehical as
select Vehicle_Type,
avg(Ride_Distance) as avg_Distance
from bookings
group by Vehicle_Type;

# 3. get the total number of cancel rides by customer 
create view cancel_rides_by_customer as
select count(*) from bookings
where Booking_Status = 'canceled by Customer';

#4. list the top 5 customer who booked the hiest number of rides
create view top_5_customer as
select Customer_ID, count(Booking_ID) as total_rides 
from bookings
group by Customer_ID
order by total_rides desc limit 5;

# 5. Get the number of rides canceled by driver due to personal and car related issues
create view rides_canceled_by_driver_p_c_related_issues as
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

# 6. Find the maximum and minimum driver rating for prime sedan bookings
create view max_min_driver_rating as
select min(Driver_Ratings) as min_rating, max(Driver_Ratings) as max_rating, Vehicle_Type
from bookings
where Vehicle_Type = 'Prime Sedan';

# 7. retrive all rides where payment was made using upi
create view payment_method as
select *
from bookings 
where Payment_Method = 'UPI';

# 8. find the average customer rating per vehical type
create view avg_cust_rating as
select Vehicle_Type, avg(Customer_Rating) as avg_cust_rating
from bookings
Group by Vehicle_Type;

# 9. calculate the total booking value of rides completed successfully
create view total_sucessful_ride_value as
select sum(Booking_Value) as total_sucessful_ride_value, Booking_Status
from bookings
where Booking_Status = 'Success';

# 10. list all incomplete ride alonge with the reason
create view incomplete_ride_reason as
select Booking_ID, Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes';

select * from bookings;

# ====================================================================================

# 1. retrive all successfull bookings
select * from successfull_bookings;

# 2.  find the avarage ride distance for each vehical type
select * from ride_distance_for_each_vehical;

# 3. get the total number of cancel rides by customer 
select * from cancel_rides_by_customer;

#4. list the top 5 customer who booked the hiest number of rides
select * from top_5_customer;

# 5. Get the number of rides canceled by driver due to personal and car related issues
select * from rides_canceled_by_driver_p_c_related_issues;

# 6. Find the maximum and minimum driver rating for prime sedan bookings
select * from max_min_driver_rating;

# 7. retrive all rides where payment was made using upi
select * from  payment_method;

# 8. find the average customer rating per vehical type
select * from avg_cust_rating;

# 9. calculate the total booking value of rides completed successfully
select * from total_sucessful_ride_value;

# 10. list all incomplete ride alonge with the reason
select * from  incomplete_ride_reason;

