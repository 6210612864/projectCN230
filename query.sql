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
group by i.cID;

Insert into Customer values (20, ‘Yoshihide Suga’, ‘Japan’);

update invoice
set Cost = Cost * 0.07
where InvoiceID in (
select invoiceID
from (select i.invoiceID
    from invoice i
    join assign_in ai on i.InvoiceID = ai.invoiceID
    where Date like '%2020%') as sl
    );

delete from invoice
where InvoiceID in (
    select invoiceID
    from (
        select i.invoiceID
        from invoice i
            join assign_in ai on i.InvoiceID = ai.invoiceID
        where Date like '%Feb%'
        ) as sl
    );