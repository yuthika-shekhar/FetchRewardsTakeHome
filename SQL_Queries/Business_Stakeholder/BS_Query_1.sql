-- What are the top 5 brands by receipts scanned for most recent month?
select top 5
	i.brandCode,
	sum(ti.finalPrice) as spend
-- joined the table 'receipts' along with the table 'transactions' on the id
-- joined the items table with the transactions table on barcode
-- merged the transactions table with the transactionItems table
from transactionItems as ti
inner join (select month(max(dateScanned))-2 m, year(max(dateScanned)) y from receipts) as recent on 1=1
inner join transactions as t on ti.transactionId = t.id
inner join receipts as r on t.receiptId = r.id and month(r.dateScanned) = recent.m and year(r.dateScanned) = recent.y
inner join items as i on ti.barcode = i.barcode
-- group by the barcodes
group by i.brandCode
-- in order to get the top 5 brands, order by spen, spend variable is created by summing the finalPrice from the transactionItems table
order by spend desc



