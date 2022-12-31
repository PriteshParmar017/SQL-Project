-- 1. Create new schema as ecommerce
create database ecommerce;
use ecommerce;

-- 3. Run SQL command to see the structure of table
select * from users_data;
desc users_data;

-- 4. Run SQL command to select first 100 rows of the database
select * from users_data limit 100;


-- 5. How many distinct values exist in table for field country and language
select count(distinct country),count(distinct language) from users_data;

-- 6.Check whether male users are having maximum followers or female users.
select socialNbFollowers,socialNbFollows from users_data;
select gender,sum(socialNbFollowers) max_follow from users_data group by gender order by max_follow desc limit 1;


-- 7. Calculate the total users those
-- Uses Profile Picture in their Profile
-- Uses Application for Ecommerce platform
-- Uses Android app
-- Uses ios app

select 'Profile Picture',count(hasProfilePicture) from users_data where hasProfilePicture='True'
union
select 'ios app',count(hasIosApp) from users_data where hasIosApp='True'
union
select 'Android app',count(hasAndroidApp) from users_data where hasAndroidApp='True'
union
select 'Application for Ecommerce platform',count(hasAnyApp) from users_data where hasAnyApp='True';


-- 8. Calculate the total number of buyers for each country and
-- sort the result in descending order of total number of buyers.(Hint: consider only those users having at least 1 product bought.)
select country,count(productsBought) total_number_of_buyer from users_data where productsBought>=1 group by country
order by total_number_of_buyer desc;


-- 9. Calculate the average number of sellers for each country and sort the result in ascending
-- order of total number of sellers.(Hint: consider only those users having at least 1 product sold.)
select country,avg(productsSold) avg_number_of_sellers from users_data where productsSold>=1 group by country
order by avg_number_of_sellers asc;


-- 10. Display name of top 10 countries having maximum products pass rate.
select country,sum(productsPassRate) top from users_data group by country order by top desc limit 10;


-- 11. Calculate the number of users on an ecommerce platform for different language choices.
select language ,count(type) users from users_data group by language;

-- 12. Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform.
select gender,count(productsWished) wishlist, sum(socialProductsLiked) liked from users_data where gender='F' or productsWished >0
  or socialproductsliked>0;

-- 13. Check the choice of male users about being seller or buyer.(Hint: use UNION to solve this question.)
select 'Male',  'Total' from users_data 
Union
select 'Products Bought',count(productsBought) buyer from users_data where gender='M'
Union
select 'Products Sold' ,count(productsSold) seller from users_data where gender='M';

-- 14. Which country is having maximum number of buyers?
select country,count(productsBought) buyer from users_data group by country order by buyer desc limit 1;

-- 15. List the name of 10 countries having zero number of sellers.
select country,sum(productsSold) sellers from users_data where productsSold = 0 group by country order by sellers asc limit 10;

-- 16. Display record of top 110 users who have used ecommerce platform recently.
select * from users_data order by daysSinceLastLogin limit 110;


-- 17. Calculate the number of female users those who have not logged in since last 100 days.
select count(gender) female from users_data where gender='F' and daysSinceLastLogin>=100;

-- 18. Display the number of female users of each country at ecommerce platform.
select country,count(gender) female from users_data where gender='F' and hasAnyApp='True' group by country;

-- 19. Display the number of male users of each country at ecommerce platform.
select country,count(gender) male from users_data where gender='M' and hasAnyApp='True' group by country;

-- 20. Calculate the average number of products sold and bought on ecommerce platform by male users for each country.
select country,avg(productsSold) Average_sold,avg(productsBought) Average_bought from users_data 
where gender='M' group by country ;


