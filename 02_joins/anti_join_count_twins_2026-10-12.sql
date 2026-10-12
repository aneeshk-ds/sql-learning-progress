-- COUNT after a LEFT JOIN anti-join. 2026-10-12. Ledger #23 regressed (clean twice on 10-06).
-- Rule: the column in WHERE ... IS NULL can never go inside COUNT. Count the thing you list, not the thing that is missing.

-- Twin B: Orders(order_id, customer), Deliveries(delivery_id, order_id) -> customer, undelivered
-- Attempt 1 (wrong): count(d.delivery_id) -> 0 for every customer.
-- Fixed after the column was named:
select o.customer, count(o.order_id) as undelivered
from Orders o
left join Deliveries d on o.order_id = d.order_id
where d.delivery_id is null
group by o.customer;

-- Twin C: Bills(bill_id, flat), Payments(payment_id, bill_id) -> flat, unpaid_bills. Clean, first try.
select b.flat, count(b.bill_id) as unpaid_bills
from Bills b
left join Payments p on b.bill_id = p.bill_id
where p.payment_id is null
group by b.flat;

-- Twin D: Tickets(ticket_id, agent), Replies(reply_id, ticket_id) -> agent, unanswered
-- Attempt 1 (wrong): count(r.reply_id) -> 0. Fixed after the count_after_left_join.html visual:
select t.agent, count(t.ticket_id) as unanswered
from Tickets t
left join Replies r on t.ticket_id = r.ticket_id
where r.reply_id is null
group by t.agent;
