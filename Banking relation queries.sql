drop table depositor cascade constraints;
drop table borrower cascade constraints;
drop table account cascade constraints;
drop table loan cascade constraints;
drop table customer cascade constraints;
drop table branch cascade constraints;

create table account
   (account_number 	varchar(15)	not null,
    branch_name		varchar(15)	not null,
    balance 		number		not null,
    primary key(account_number));

create table branch
   (branch_name 	varchar(15)	not null,
    branch_city 	varchar(15)	not null,
    assets 		number		not null,
    primary key(branch_name));

create table customer
   (customer_name 	varchar(15)	not null,
    customer_street 	varchar(12)	not null,
    customer_city 	varchar(15)	not null,
    primary key(customer_name));

create table loan
   (loan_number 	varchar(15)	not null,
    branch_name		varchar(15)	not null,
    amount 		number		not null,
    primary key(loan_number));

create table depositor
   (customer_name 	varchar(15)	not null,
    account_number 	varchar(15)	not null,
    primary key(customer_name, account_number),
    foreign key(account_number) references account(account_number),
    foreign key(customer_name) references customer(customer_name));

create table borrower
   (customer_name 	varchar(15)	not null,
    loan_number 	varchar(15)	not null,
    primary key(customer_name, loan_number),
    foreign key(customer_name) references customer(customer_name),
    foreign key(loan_number) references loan(loan_number));

/* populate relations */

insert into customer	values ('Jones',	'Main',		'Harrison');
insert into customer	values ('Smith',	'Main',		'Rye');
insert into customer	values ('Hayes',	'Main',		'Harrison');
insert into customer	values ('Curry',	'North',	'Rye');
insert into customer	values ('Lindsay',	'Park',		'Pittsfield');
insert into customer	values ('Turner',	'Putnam',	'Stamford');
insert into customer	values ('Williams',	'Nassau',	'Princeton');
insert into customer	values ('Adams',	'Spring',	'Pittsfield');
insert into customer	values ('Johnson',	'Alma',		'Palo Alto');
insert into customer	values ('Glenn',	'Sand Hill',	'Woodside');
insert into customer	values ('Brooks',	'Senator',	'Brooklyn');
insert into customer	values ('Green',	'Walnut',	'Stamford');
insert into customer	values ('Jackson',	'University',	'Salt Lake');
insert into customer	values ('Majeris',	'First',	'Rye');
insert into customer	values ('McBride',	'Safety',	'Rye');

insert into branch	values ('Downtown',	'Brooklyn',	 900000);
insert into branch	values ('Redwood',	'Palo Alto',	2100000);
insert into branch	values ('Perryridge',	'Horseneck',	1700000);
insert into branch	values ('Mianus',	'Horseneck',	 400200);
insert into branch	values ('Round Hill',	'Horseneck',	8000000);
insert into branch	values ('Pownal',	'Bennington',	 400000);
insert into branch	values ('North Town',	'Rye',		3700000);
insert into branch	values ('Brighton',	'Brooklyn',	7000000);
insert into branch	values ('Central',	'Rye',		 400280);

insert into account	values ('A-101',	'Downtown',	500);
insert into account	values ('A-215',	'Mianus',	700);
insert into account	values ('A-102',	'Perryridge',	400);
insert into account	values ('A-305',	'Round Hill',	350);
insert into account	values ('A-201',	'Perryridge',	900);
insert into account	values ('A-222',	'Redwood',	700);
insert into account	values ('A-217',	'Brighton',	750);
insert into account	values ('A-333',	'Central',	850);
insert into account	values ('A-444',	'North Town',	625);

insert into depositor values ('Johnson','A-101');
insert into depositor values ('Smith',	'A-215');
insert into depositor values ('Hayes',	'A-102');
insert into depositor values ('Hayes',	'A-101');
insert into depositor values ('Turner',	'A-305');
insert into depositor values ('Johnson','A-201');
insert into depositor values ('Jones',	'A-217');
insert into depositor values ('Lindsay','A-222');
insert into depositor values ('Majeris','A-333');
insert into depositor values ('Smith',	'A-444');

insert into loan	values ('L-17',		'Downtown',	1000);
insert into loan	values ('L-23',		'Redwood',	2000);
insert into loan	values ('L-15',		'Perryridge',	1500);
insert into loan	values ('L-14',		'Downtown',	1500);
insert into loan	values ('L-93',		'Mianus',	500);
insert into loan	values ('L-11',		'Round Hill',	900);
insert into loan	values ('L-16',		'Perryridge',	1300);
insert into loan	values ('L-20',		'North Town',	7500);
insert into loan	values ('L-21',		'Central',	570);

insert into borrower values ('Jones',	'L-17');
insert into borrower values ('Smith',	'L-23');
insert into borrower values ('Hayes',	'L-15');
insert into borrower values ('Jackson',	'L-14');
insert into borrower values ('Curry',	'L-93');
insert into borrower values ('Smith',	'L-11');
insert into borrower values ('Williams','L-17');
insert into borrower values ('Adams',	'L-16');
insert into borrower values ('McBride',	'L-20');
insert into borrower values ('Smith',	'L-21');

commit;

--Queries

--Find all branch names and cities with assets more than 1000000
--(on single table)

Select branch_name, branch_city from Branch
Where Assets > 1000000;

--Find all account numbers and their balance which are opened in ‘Downtown’ branch or which have balance in between 600 and 750
--(on single table)

Select account_number,branch_name,balance 
from account
Where branch_name = 'Downtown' 
Or balance between 600 and 700;

--Find all account numbers which are opened in a branch located in ‘Rye’ city
--(multiple tables)

Select Account_number
From Account,Branch
Where Account.branch_name=Branch.branch_name and branch_city='Rye';

--Find all loan numbers which have amount greater than or equal to 1000 and their customers are living in ‘Harrison’ city
--(multiple tables)

Select Loan.loan_number 
From Loan,Customer,Borrower
Where Borrower.customer_name = Customer.customer_name and Borrower.loan_number=Loan.loan_number and
amount >= 1000 and customer_city='Harrison';

--Display the account related information based on the
descending order of the balance
--(order by clause)

Select * from Account
Order by balance desc;

--Display the customer related information in alphabetic order of customer cities
--(order by clause)

Select distinct * from Customer
Order by customer_city ASC;

--Find all customer names who have an account as well as a loan.
-- (intersect)

Select customer_name from Depositor
Intersect
Select customer_name from Borrower;

--Find all customer related information who have an account or a loan.
--(union)

Select * from Customer, Depositor
Where Customer.customer_name = Depositor.customer_name
Union
Select * from Customer, Borrower
Where Borrower.customer_name= Customer.customer_name;

--Find all customer names and their cities who have a loan but not an account.
--minus

Select customer.customer_name, customer.customer_city from customer,borrower
Where Borrower.customer_name= Customer.customer_name
Minus
Select customer.customer_name, customer.customer_city from Customer,Depositor
Where Customer.customer_name= Depositor.customer_name;

--Find the total assets of all branches
-- (aggregate function)

Select Sum(assets) from branch;

--Find the average balance of accounts at each branch. 
--(aggregate function)

Select branch_name, Avg(balance)
 from Account 
group by branch_name;
 
--Find the average balance of accounts at each branch city. 
--(aggregate function)

Select branch.branch_city , Avg(balance)
from Account,branch
where branch.branch_name=Account.branch_name
group by branch.branch_city ;


--Find the lowest amount of loan at each branch. 
--(aggregate function)

Select branch.branch_name, min(amount)
From branch,loan
where branch.branch_name = loan.branch_name
group by branch.branch_name;


--Find the total number of loans at each branch. 
--(aggregate function)

Select branch.branch_name, count(loan_number)
From branch,loan
where branch.branch_name = loan.branch_name
group by branch.branch_name;

--Find the customer name and account number of the account which has the highest balance.
--(aggregate function)

Select c.customer_name,a.account_number,max(balance)
From Customer c,Account a,Depositor d
Where c.customer_name=d.customer_name and a.account_number=d.account_number
group by c.customer_name,a.account_number;

