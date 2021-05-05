drop table if exists Buy;
drop table if exists Assign_in;
drop table if exists Contact;
drop table if exists Invoice;
drop table if exists Customer;
drop table if exists Product;
drop table if exists Company;
drop table if exists Journal;

create table company
(
	companyName varchar(100) not null,
	TIN int auto_increment
		primary key
);

create table customer
(
	cID int auto_increment
		primary key,
	cName varchar(100) not null,
	Address varchar(255) not null
);

create table contact
(
	cID int not null,
	cContact varchar(255) null,
	constraint Contact_Customer_cID_fk
		foreign key (cID) references customer (cID)
);

create table journal
(
	jID int not null
		primary key,
	jName varchar(100) not null,
	jType varchar(100) not null
);

create table invoice
(
	InvoiceID int auto_increment
		primary key,
	Cost float not null,
	Date varchar(50) null,
	TIN int not null,
	cID int not null,
	jID int not null,
	constraint Invoice_Company_TIN_fk
		foreign key (TIN) references company (TIN),
	constraint Invoice_Customer_cID_fk
		foreign key (cID) references customer (cID),
	constraint Invoice_Journal_jID_fk
		foreign key (jID) references journal (jID)
);

create table product
(
	pID int auto_increment
		primary key,
	pName varchar(100) null,
	pType varchar(50) null,
	TIN int not null,
	constraint Product_Company_TIN_fk
		foreign key (TIN) references company (TIN)
);

create table assign_in
(
	pID int not null,
	invoiceID int not null,
	constraint Assign_in_Invoice_invoiceID_fk
		foreign key (invoiceID) references invoice (InvoiceID),
	constraint Assign_in_Product_pID_fk
		foreign key (pID) references product (pID)
);

create table buy
(
	cID int not null,
	pID int not null,
	constraint Buy_Customer_cID_fk
		foreign key (cID) references customer (cID),
	constraint Buy_Product_pID_fk
		foreign key (pID) references product (pID)
);

