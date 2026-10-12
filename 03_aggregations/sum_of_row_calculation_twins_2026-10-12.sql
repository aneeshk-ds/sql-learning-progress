-- Total of a row-level calculation per group. 2026-10-12. Ledger #24 (new).

-- Shelves(store, item_id, qty), Items(item_id, item_name, weight_kg) -> store, total_weight
-- Attempt 1 (wrong): summed one unit's weight, qty never used; LEFT JOIN unneeded (every item exists).
-- select s.store, sum(i.weight_kg) as total_weight
-- from Shelves s left join Items i on i.item_id = s.item_id
-- group by s.store;
-- Fixed after hint (4 Rice bags x 25 kg = 100 kg):
select s.store, sum(s.qty * i.weight_kg) as total_weight
from Shelves s
join Items i on i.item_id = s.item_id
group by s.store;

-- Twin A: Bookings(booking_id, hotel, nights, room_rate) -> hotel, revenue. Clean, first try.
select hotel, sum(room_rate * nights) as revenue
from Bookings
group by hotel;

-- Twin A2: Cart(cart_id, user_name, product_id, units), Products(product_id, product_name, price)
-- -> user_name, cart_total. Clean, first try.
select c.user_name, sum(p.price * c.units) as cart_total
from Cart c
join Products p on c.product_id = p.product_id
group by c.user_name;
