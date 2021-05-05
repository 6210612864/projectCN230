
drop table if exists Buy;
drop table if exists Assign_in;
drop table if exists Contact;
drop table if exists Invoice;
drop table if exists Customer;
drop table if exists Product;
drop table if exists Company;
drop table if exists Journal;

create table Customer
(
	cID int,
	cName varchar(100) not null,
	Address varchar(255) not null,
	constraint Customer_pk
		primary key (cID)
);

create table Product
(
	pID int,
	pName varchar(100) null,
	pType varchar(50) null,
	constraint Product_pk
		primary key (pID)
);

create table Company
(
	companyName varchar(100) not null,
	TIN int auto_increment,
	constraint Company_pk
		primary key (TIN)
);

create table Invoice
(
	InvoiceID int,
	Cost float not null,
	Date varchar(50) null,
	constraint Invoice_pk
		primary key (InvoiceID)
);

create table Journal
(
	jID int,
	jName varchar(100) not null,
	jType varchar(100) not null,
	constraint Journal_pk
		primary key (jID)
);

alter table Product
    add TIN int references Company (TIN);

alter table Invoice
    add TIN int references Company (TIN);
alter table Invoice
    add cID int references Customer (cID);
alter table Invoice
    add jID int references Journal (jID);

create table Buy
(
	cID int not null,
	pID int not null,
	constraint Buy_Customer_cID_fk
		foreign key (cID) references Customer (cID),
	constraint Buy_Product_pID_fk
		foreign key (pID) references Product (pID)
);

create table Assign_in
(
    pID int not null,
    invoiceID int not null,
    constraint Assign_in_Product_pID_fk
        foreign key (pID) references Product (pID),
    constraint Assign_in_Invoice_invoiceID_fk
        foreign key (invoiceID) references Invoice (InvoiceID)
);

create table Contact
(
    cID int not null,
    cContact varchar(255),
    constraint Contact_Customer_cID_fk
        foreign key (cId) references Customer (cID)
);


insert into customer values ( 1, 'Jacinda Ardern', 'New Zealand' );
insert into customer values ( 2, 'Justin Trudeau', 'Canada');
insert into customer values ( 3, 'Emmanuel Macron', 'France');
insert into customer values ( 4, 'Frank-Walter Steinmeier', 'Germany');
insert into customer values ( 5, 'Moon Jae-in', 'South Korea');
insert into customer values ( 6, 'Joe Biden', 'United States');
insert into customer values ( 7, 'Prayut Chan-o-cha', 'Thailand');

insert into Company values ('AstraZeneca', 570162);
insert into Company values ('Pfizer Biontech', 987657);
insert into Company values ('Moderna', 119423);
insert into Company values ('Sinovac', 735816);
insert into Company values ('Gamaleya Research Institute of Epidemiology and Microbiology',340453);
insert into Company values ('Johnson & Johnson', 146427);
insert into Company values ('Bharat Biotech',616960);


insert into Product values ( 1, 'AZD1222','Viral-Vector Vaccine',570162);
insert into Product values ( 2, 'BNT162','mRNA Vaccine',987657);
insert into Product values ( 3, 'mRNA-1273', 'mRNA Vaccine',119423);
insert into Product values ( 4, 'CoronaVac', 'Inactivated Vaccine',735816);
insert into Product values ( 5, 'Sputnik V', 'Viral-Vector Vaccine',340453);
insert into Product values ( 6, 'JNJ-78436735','Viral-Vector Vaccine',146427);
insert into Product values ( 7, 'Covaxin', 'Inactivated vaccine',616960);


insert into Journal values ( 1, 'Purchase journal', 'disbursement');
insert into Journal values ( 2, 'Sales journal', 'income');
insert into Journal values ( 3, 'Cash receipts journal', 'income');
insert into Journal values ( 4, 'Cash payment/disbursement journal', 'disbursement');
insert into Journal values ( 5, 'Purchase return journal', 'return/income');
insert into Journal values ( 6, 'Sales return journal', 'return/disbursement');
insert into Journal values ( 7, 'Journal proper/General journal', 'general');

insert into Invoice values ( 500001, 50000000, '18 Nov 2020', 146427, 1, 2);
insert into Invoice values ( 500002, 987200000, '19 Nov 2020',146427, 6, 2);
insert into Invoice values ( 1, 20000000, '25 Nov 2020', 570162, 4, 2);
insert into Invoice values ( 100001, 1925040000, '08 Dec 2020',987657, 6, 2);
insert into Invoice values ( 100002, 58500000, '09 Dec 2020', 987657, 2, 2);
insert into Invoice values ( 100003, 195000000, '10 Dec 2020', 987657, 4, 3);
insert into Invoice values ( 2 ,30400000, '17 Dec 2020', 570162, 1, 2);
insert into Invoice values ( 100004, 195000000, '21 Dec 2020', 987657, 3, 3);
insert into Invoice values ( 200001, 15000000, '06 Jan 2021', 119423, 3, 2);
insert into Invoice values ( 3, 27000000, '29 Jan 2021', 570162, 3, 2);
insert into Invoice values ( 100005, 195000000 , '03 Feb 2021', 987657, 1, 3);
insert into Invoice values ( 200002, 30000000, '04 May 2021',119423, 2, 2);
insert into Invoice values ( 500003, 6000000, '04 Feb 2021',  146427, 4, 2);
insert into Invoice values ( 500004, 15000000, '04 Feb 2021',  146427, 4, 3);
insert into Invoice values ( 4, 11100000, '10 Feb 2021',570162, 5, 2);
insert into Invoice values ( 100006, 28860000, '10 Feb 2021',987657, 5, 2);
insert into Invoice values ( 200003, 60000000, '13 Feb 2021', 119423, 4, 2);
insert into Invoice values ( 100007, 39000000, '05 April 2021', 987657, 2, 2);
insert into Invoice values ( 500005, 3000000, '24 April 2021', 146427, 2, 2);
insert into Invoice values ( 200004, 1234000000, '24 April 2021',119423, 6, 3);
insert into Invoice values ( 100008, 288600000, '05 May 2021',987657, 5, 3);