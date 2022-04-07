------- Option 1: using Joins
-- now doing the same thing with join
select b.credit_card_holder_id
, a.transaction_datetimestamp
, a.transaction_amount
from transactions as a join credit_card as b on a.credit_card_number = b.credit_card_number 
where b.credit_card_holder_id = 2 or
b.credit_card_holder_id = 18;



------- Option 2: creating sub quey 
-- First define the sub query
select credit_card_number from credit_card where  
credit_card_holder_id = 2 or
credit_card_holder_id = 18;
-- Now add this "in" the where clause 
select transaction_datetimestamp
, transaction_amount 
from transactions 
where credit_card_number in (
select credit_card_number from credit_card where  
credit_card_holder_id = 2 or
credit_card_holder_id = 18)
limit 10;



