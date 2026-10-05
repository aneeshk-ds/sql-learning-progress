-- Anti-join reactivation, 2026-10-05. Synthetic data. Visual: anti_join.html.

-- 10-04 carry-over: Libraries never loaned. This INNER JOIN returns Monceau, Monceau, Sentier:
-- the libraries that HAVE loaned, the inverse. A plain join can only answer "has", never "never".
select library_name
from Libraries lib
join Loans l on lib.library_id = l.library_id ;

-- Rep 1, Teachers never taught. Correct, assisted line by line. Bare class_id breaks the alias rule.
select t.teacher_name
from Teachers t
left join Classes c on t.teacher_id = c.teacher_id
where class_id is null ;

-- Rep 2, Drivers never rode, NOT IN. First write: correct output, but an unneeded join inside the
-- subquery and a name compare (ledger #16).
select d.driver_name
from Drivers d
where driver_name not in(
select d.driver_name from Drivers d
join Rides r on d.driver_id = r.driver_id) ;
-- Rewrite after help: Rides alone already holds the list of ids.
select d.driver_name
from Drivers d
where d.driver_id not in(select driver_id from Rides) ;

-- Rep 3, Authors never published. CLEAN, solo, first try.
select a.author_name
from Authors a
where a.author_id not in (
select author_id from Books) ;

-- Rep 4, Stores never audited. CLEAN, solo, first try.
-- Habit: test IS NULL on the joined key (a.store_id), not a regular column that could be NULL.
select s.store_city
from Stores s
left join Audits a on s.store_id = a.store_id
where a.audit_date is null ;

-- Anti-join + count per entity (1581 shape). Not clean, unfinished.
-- Sessions twin, first write: dropped GROUP BY (ledger #8, seventh fire). SELECT written first.
select s.user_id, count(s.session_id) as empty_sessions
from Sessions s
Left join Orders o on s.session_id = o.session_id
where o.order_id is null ;
-- Correct once FROM / JOIN / WHERE / GROUP BY were written first and SELECT last.

-- Tickets twin, last write at wrap: semicolon before GROUP BY, and count(reply_id) counts the
-- NULL side, which returns 0 for every agent (ledger #23). Count a Tickets column instead.
select t.agent_id, count(reply_id) as unanswered
from Tickets t
left join Replies r on t.ticket_id = r.ticket_id
where r.reply_id is null ;
group by t.agent_id
