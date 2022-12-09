-- When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

-- Display the average of the spend based on rejected and finished categories. 
-- After performing the transformations, the data did not have accepted category, so I used the finished category instead
select
	avg(case when lower(rewardsReceiptStatus) = 'finished' then isnull(spend,0) end) as avg_spend_accepted,
	avg(case when lower(rewardsReceiptStatus) = 'rejected' then isnull(spend,0) end) as avg_spend_rejected
from
(
	-- select the recipt id, rewardsReceiptStatus and sum the finalPrice as spend
	select
		t.receiptId,
		w.rewardsReceiptStatus,
		sum(l.finalPrice) as spend
	-- merge the transactionItems, transactions, items and rewards table using the common fields
	from transactionItems as l
	inner join transactions as t on l.transactionId = t.id
	inner join items as i on l.barcode = i.barcode
	inner join rewards as w on t.receiptId = w.receiptId
	-- group by the receiptId and rewardReceiptStatus
	group by t.receiptId, w.rewardsReceiptStatus
) result