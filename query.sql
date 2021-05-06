select distinct cName as 'Customer Name', Address ,
       ifnull(sum(case when companyName = 'Moderna' then Cost end),0) as Moderna,
       ifnull(sum(case when companyName = 'Johnson & Johnson' then Cost end),0) as 'J&J',
       ifnull(sum(case when companyName = 'Gamaleya Research Institute of Epidemiology and Microbiology' then Cost end),0) as Spuknik,
       ifnull(sum(case when companyName = 'AstraZeneca' then Cost end),0) as AZ,
       ifnull(sum(case when companyName = 'Bharat Biotech' then Cost end),0) as 'Bharat',
       ifnull(sum(case when companyName = 'Sinovac' then Cost end),0) as Sinovac,
       ifnull(sum(case when companyName = 'Pfizer Biontech' then Cost end),0) as 'Pfizer',
       Total
from customer
join invoice i on customer.cID = i.cID
join company c on c.TIN = i.TIN
inner join
(
    SELECT cName, sum(Cost) as Total
    from customer
        jOIN invoice i on customer.cID = i.cID
        join company c on c.TIN = i.TIN
    group by cName
) total using (cName)
group by i.cID