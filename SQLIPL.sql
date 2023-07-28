--most successful teams each season and overall
select (season),winner, count(winner) as number_wins
from portfolio..matches
where winner <> ''
group by season,winner
order by season

--most successful players
select (season),player_of_match,count(player_of_match) as mostMOM
from portfolio..matches
where winner is not null
group by season,player_of_match
order by mostMOM Desc

--check for duplicates
select date,winner, venue, win_by_runs,win_by_wickets, count(*)
from portfolio..matches
group by winner, venue, win_by_runs,win_by_wickets,date
having count(*) > 1

--factors affecting win/loss
select city, venue, toss_winner,toss_decision,winner
from portfolio..matches
where result <> 'no_result'

update portfolio..matches
set city = 'Dubai'
where venue = 'Dubai International Cricket Stadium'



--Venues and toss decision affecting wins
select city, venue, count(win_by_wickets) as win_thru_fielding
from portfolio..matches
where result <> 'no_result' and toss_decision = 'field' and win_by_runs <> 0
group by city, venue

--Venues and toss decision affecting wins
select city, venue, count(win_by_runs) as win_thru_bat
from portfolio..matches
where result <> 'no_result' and toss_decision = 'bat' and win_by_wickets <> 0
group by city, venue


select *
from portfolio..matches

select *
from portfolio..deliveries