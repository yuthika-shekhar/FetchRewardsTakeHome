-- When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

-- Display the sum of the spend based on rejected and finished categories. 
-- After performing the transformations, the data did not have accepted category, so I used the finished category instead
select
	sum(case when lower(rewardsReceiptStatus) = 'finished' then isnull(items,0) end) as total_items_accepted,
	sum(case when lower(rewardsReceiptStatus) = 'rejected' then isnull(items,0) end) as total_items_rejected
from
(
	-- select receiptId, rewardsReceiptStatus and count of items
	-- Items are foudn by counting the distinct barcodes of the items
	select
		t.receiptId,
		r.rewardsReceiptStatus,
		count(distinct i.barcode) as items
	-- merge the transactionItems, transactions, items and rewards table using the common fields
	from transactionItems as ti
	inner join transactions as t on ti.transactionId = t.id
	inner join items as i on ti.barcode = i.barcode
	inner join rewards as r on t.receiptId = r.receiptId
	-- grouping the entire data on the receiptId and rewardsReceiptStatus
	group by t.receiptId, r.rewardsReceiptStatus
) result