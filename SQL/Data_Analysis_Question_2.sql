
select b.credit_card_holder_id
, TO_CHAR(a.transaction_datetimestamp, 'MM') as month
, TO_CHAR(a.transaction_datetimestamp, 'DD') as day
, a.transaction_amount as amount
from transactions as a join credit_card as b on a.credit_card_number = b.credit_card_number 
where b.credit_card_holder_id = 25 and
a.transaction_datetimestamp > '2018-01-01 00:00:00' and
a.transaction_datetimestamp < '2018-07-01 00:00:00'
order by a.transaction_datetimestamp asc;



