create database finance;

use finance;

create table customer( 
	customerId int primary key auto_increment, 
    name varchar(25) not null, 
    phoneNo int not null unique, 
    email varchar(25) unique, 
    userName varchar(15) not null unique, 
    password varchar(20) not null, 
    address varchar(50),
    age int,
    salary int,
    check(age>=18 and salary>=10000) );

create table product(
	productId int primary key auto_increment,
    productName varchar(25) not null unique,
    productDesc varchar(100),
    productPrice int not null,
    imageURL varchar(50) );

create table orderDetails(
	orderId int primary key auto_increment,
    orderDate date not null,
    emiPeriod int not null,
    check(emiPeriod in (3,6,9,12)),
    customerId int references customer(customerId),
    productId int references product(productId) );
    
create table emiCard(
	cardNo bigint primary key auto_increment,
    cardIssueDate date not null,
    validityYears int not null default 1,
    remainingCredit int,
    cardType varchar(10) default 'Under Verification' not null, 
    check(cardType in ('Gold', 'Titanium', 'Under Verification')),
	customerId int references customer(customerId) );
alter table emiCard auto_increment=101022120000;
    