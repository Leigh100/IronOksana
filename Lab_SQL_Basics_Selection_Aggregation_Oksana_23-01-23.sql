Use bank;

# 1. Get the id values of the first 5 clients from district_id with a value equals 
# to 1.

SELECT * FROM client where district_id=1
LIMIT 5;

# 2. In the client table, get an id value of the last client where the district_id equals to 72.
SELECT client_id FROM client where district_id=72
ORDER BY client_id
DESC
LIMIT 1;

# 3. Get the 3 lowest amounts in the loan table.
SELECT * FROM loan;
SELECT amount FROM loan 
ORDER BY amount
LIMIT 3;

# 4. What are the possible values for status, ordered alphabetically in 
# ascending order in the loan table?
SELECT * FROM loan;
SELECT distinct status from loan
ORDER BY status;

#5. What is the loan_id of the highest payment received in the loan table?
SELECT * FROM loan;
SELECT loan_id from loan order by payments DESC limit 1;

# 6. What is the loan amount of the lowest 5 account_ids in the loan table? 
# Show the account_id and the corresponding amount
SELECT amount from loan order by account_id limit 5;

# 7. What are the top 5 account_ids with the lowest loan amount that have a loan 
# duration of 60 in the loan table?
SELECT account_id from loan where duration =60 
ORDER BY amount
LIMIT 5;

# 8. What are the unique values of k_symbol in the order table?
# Note: There shouldn't be a table name order, since order is reserved from the 
# ORDER BY clause. 
# You have to use backticks to escape the order table name.

Select * from `order`;
Select DISTINCT k_symbol 
From `order`;

# 9. In the order table, what are the order_ids of the client with the account_id 34?
Select order_id from `order` where account_id=34; 

# 10. In the order table, which account_ids were responsible for orders 
# between order_id 29540 and order_id 29560 (inclusive)?

Select DISTINCT account_id from `order` where order_id <= 29560 AND order_id >29540;

# 11. In the order table, what are the individual amounts that were sent to (account_to) id 30067122?

Select amount from `order` where account_to=30067122;

# 12. In the trans table, show the trans_id, date, type and amount of the 10 first transactions
# from account_id 793 in chronological order, from newest to oldest.
Select* from trans;
Select trans_id, date, type, amount from trans where account_id=793
ORDER by date
DESC
Limit 10;

# 13. In the client table, of all districts with a district_id lower than 10,
# how many clients are from each district_id?
# Show the results sorted by the district_id in ascending order.
Select * from client;
Select district_id from client where district_id<10;

Select district_id, COUNT(district_id) as count_clients_per_district 
from client where district_id<10
group by district_id 
Order by district_id;

# 14. In the card table, how many cards exist for each type? Rank the result starting with the 
# most frequent type
Select * from card;
Select type, COUNT(type) as count_of_cards_for_each_type
from card
group by type
Order by count_of_cards_for_each_type
Desc;

# 15. Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
Select * from loan; 
Select account_id, SUM(amount) as accounts_of_the_sum_of_all_loan_amounts
from loan 
group by account_id
Order by accounts_of_the_sum_of_all_loan_amounts
Desc
Limit 10;

# 16. In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, 
# ordered by date in descending order.
Select * from loan;
Select date, COUNT(loan_id) from loan where date <930907
Group by date
Order by date
Desc

# 17. In the loan table, for each day in December 1997, count the number of loans issued for 
# each unique loan duration, ordered by date and duration, both in ascending order.
# You can ignore days without any loans in your output.










