/*Write a query that returns active users.
An active user is someone who has made a second purchase within 7 days of any other purchase.
*/


Select distinct a1.user_id
from amazon_transactions as a1
join amazon_transactions a2 on a1.user_id = a2.user_id
and a1.id <> a2.id
and DATEDIFF(day,a1.created_at,a2.created_at) between 0 and 7
order by a1.user_id