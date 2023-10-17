insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

select distinct coalesce(u."name", 'not defined') as name,
				coalesce(u.lastname, 'not defined') as lastname,
				c."name" as currency_name,
				b."money" * coalesce(c.rate_to_usd, 1) as currency_in_usd --нужно доработать тут =)
from balance b
	left join "user" u on b.user_id = u.id
	join currency c on b.currency_id = c.id
order by 1 desc, 2, 3;