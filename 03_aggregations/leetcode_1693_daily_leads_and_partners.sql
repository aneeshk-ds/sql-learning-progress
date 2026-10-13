-- LeetCode 1693 Daily Leads and Partners (Easy, 87%)
-- 2026-10-13 block 2, fluency (timed). Clean, first try. Streak 4 of 5 (Tier 1).

select date_id, make_name,
       count(distinct lead_id) as unique_leads,
       count(distinct partner_id) as unique_partners
from DailySales
group by date_id, make_name;
