with correct_currency as (select * from currency where updated in (select max(updated) from currency group by id)),
	almost_all as (select distinct coalesce(u."name", 'not defined') as name,
						coalesce (u.lastname, 'not defined') as lastname,
						b."type",
						sum(b."money") over(partition by u.id, b."type") as volume,
						coalesce(c."name", 'not defined') as currency_name,
						coalesce(c.rate_to_usd, 1) as last_rate_to_usd
					from balance b
						left join "user" u on b.user_id = u.id
						left join correct_currency c on b.currency_id = c.id)
select *, volume * last_rate_to_usd as total_volume_in_usd
from almost_all
order by 1 desc, 2, 3;