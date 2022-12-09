-- Checking for the data quality issue of inconsistent data
 
-- selecting the quantitypurchased, itemPrice, finalPrice and receiptID
-- join the transactionItems and transactions table on id
-- condition to test inconsistency is by checking the products with quantities greater than 1 and where itemPrice and finalPrice are equal
select ti.quantityPurchased, ti.itemPrice, ti.finalPrice, t.receiptId
from transactionItems ti inner join transactions t on ti.transactionId=t.id
where ti.itemPrice=ti.finalPrice and cast(quantityPurchased as float) >1 