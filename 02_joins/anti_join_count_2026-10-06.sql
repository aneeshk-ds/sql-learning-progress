-- Anti-join plus a per-entity count, 2026-10-06. Synthetic data.

-- Card 1, cold skeleton: customers who never placed an order. Clean.
select c.name from Customers c
left join Orders o on c.customer_id = o.customer_id
where o.order_id is null ;

-- Card 2, Logins/Alerts: assisted. First picked Accounts and Alerts; Logins already holds account_id.
-- count(l.login_id) given after a pointer to the kept side.
select l.account_id, count(l.login_id) as quiet_logins
from Logins l
Left join Alerts a on l.login_id = a.login_id
where a.alert_id is null
group by l.account_id ;

-- Card 3, Couriers: CLEAN, solo.
select d.courier_id, count(d.delivery_id) as clean_deliveries
from Deliveries d
Left join Complaints c on d.delivery_id = c.delivery_id
where c.complaint_id is null
group by d.courier_id ;

-- Tickets twin, unfinished on 10-05: CLEAN, solo.
select t.agent_id, count(t.ticket_id) as unanswered
from Tickets t
Left join Replies r on t.ticket_id = r.ticket_id
where r.reply_id is null
group by t.agent_id ;
