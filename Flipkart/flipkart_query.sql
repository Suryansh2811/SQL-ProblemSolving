/* List top 3 sellers in each product for january. */


select seller_id, total_sales, product_category, market_place, 
'January' as month
from(


select seller_id, product_category, market_place, SUM(total_sales) as total_sales, 
ROW_NUMBER() over (partition by product_category order by sum(total_sales) desc) as rank
from flipkart_sales_data 
where substring(month, 7,1) = 1
group by seller_id,product_category,market_place) ranked_data

where rank <= 3