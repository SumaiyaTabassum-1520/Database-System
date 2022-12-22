-------Find all customer related information who have an 
--------account in a branch, located in the same 
-------city as they live
-------(without subquery)

Select Distinct  C.customer_name, customer_street,customer_city
From Customer C, Branch B, Depositor D, Account A
Where C.customer_name = D.customer_name
and A.account_number = D.account_number
and customer_city = branch_city;


-------Find all customer related information who have an 
---------account in a branch, located in the same 
-------city as they live
-----(With Subquery)

Select Distinct  C.customer_name, customer_street,customer_city
From Customer C, Branch B, Depositor D, Account A
Where C.customer_name = D.customer_name
and A.account_number = D.account_number 
and C.customer_city IN (Select Distinct  customer_city                                                                              
                        from Customer,Branch 
                        Where customer_city = branch_city);

                                                                               
-------Find all customer related information who have a loan 
----------in a branch, located in the same city as they live
-------(Without Subquery)

Select Distinct  C.customer_name, customer_street,customer_city
From Customer C, Branch B,  Loan L, Borrower Br
Where C.customer_name = Br.customer_name
and L.branch_name = B.branch_name
and  customer_city = branch_city;


-------Find all customer related information who have a loan 
----------in a branch, located in the same city as they live
-------(With Subquery)

Select Distinct  C.customer_name, customer_street,customer_city
From Customer C, Branch B,  Loan L, Borrower Br
Where C.customer_name = Br.customer_name
and L.branch_name = B.branch_name
and C.customer_city IN (Select Distinct  customer_city 
                        from Customer,Branch 
                        Where customer_city = branch_city);


-------For each branch city, find the average balance of all 
-----the accounts opened in a branch located in that branch city. 
---Do not include any branch city in the result where the total 
---balance of all accounts opened in a branch located in that 
---city is less than 1000
---(with‘having’ clause)

Select Distinct branch_city , avg(balance) as Avg_balance
From Account A, Branch B
Where B.branch_name = A.branch_name
Group By branch_city
Having sum(balance) > 1000;


-------For each branch city, find the average balance of all 
-----the accounts opened in a branch located in that branch city. 
---Do not include any branch city in the result where the total 
---balance of all accounts opened in a branch located in that 
---city is less than 1000
-----(Without having clause)

Select  R1.branch_city, Avg_balance
From(Select branch_city, avg(balance) as Avg_balance From Account A,Branch B
           Where B.branch_name = A.branch_name
           GROUP BY branch_city) R1,
          (Select branch_city, sum(balance) as Total_balance                      
           From Account A,Branch B
           Where B.branch_name = A.branch_name
           Group By branch_city) R2 
                             Where R1.branch_city = R2.branch_city 
                             and R2.Total_balance>1000;


-------For each branch city, find the average amount of all 
-------the loans opened in a branch located in that branch city. 
-----Do not include any branch city in the result where the 
----average amount of all loans opened in a branch located in 
------that city is less than 1500
------(With having clause)

Select Distinct branch_city , avg(amount) as Avg_amount
From Branch B , Loan L
Where B.branch_name = L.branch_name
Group By branch_city
Having avg(amount) > 1500;


-------For each branch city, find the average amount of all 
-------the loans opened in a branch located in that branch city. 
-----Do not include any branch city in the result where the 
----average amount of all loans opened in a branch located in 
------that city is less than 1500
-------(Without having clause)------

Select Distinct branch_city , Avg_amount
From (Select Distinct branch_city , avg(amount) as Avg_amount
From Branch B , Loan L
Where B.branch_name = L.branch_name
Group By branch_city)
Where Avg_amount > 1500;


-------Find the customer name, customer street, customer city 
-------of the account which has the highest balance among all the
------accounts 
-----(With All keyword)

Select Distinct C.customer_name, customer_street,customer_city
From Customer C, Account A, Depositor D
Where C.customer_name = D.customer_name
And A.account_number = D.account_number
And balance >= All (Select balance From Account);


-------Find the customer name, customer street, customer city 
-------of the account which has the highest balance among all the
------accounts 
------(Without using All keyword)

Select Distinct C.customer_name, customer_street,customer_city
From Customer C, Account A, Depositor D
Where C.customer_name = D.customer_name
And A.account_number = D.account_number
And balance >= (Select max(balance) From Account);


-------Find the customer name, customer street, customer city of the loan which has the lowest 
amount among all the loans
------(With using All keyword)

Select Distinct C.customer_name, customer_street,customer_city
From Customer C, Loan L, Borrower Br
Where C.customer_name = Br.customer_name
And L.loan_number = Br.loan_number
and amount <= All (Select amount from Loan);


-------Find the customer name, customer street, customer city 
-----of the loan which has the lowest amount among all the loans
-------(Without using All keyword)

Select Distinct C.customer_name, customer_street,customer_city
From Customer C, Loan L, Borrower Br
Where C.customer_name = Br.customer_name
And L.loan_number = Br.loan_number
and amount <= (Select min(amount) from Loan);


-------Find the distinct branches (name and city) that have 
-------opened both accounts and loans. 
------(With In keyword)

Select Distinct B.branch_name,branch_city From  Branch B, Account A
Where B.branch_name = A.branch_name
And B.branch_name IN (Select Distinct B.branch_name 
                      From  Branch B, Loan L
                       Where  B.branch_name = L.branch_name);


-------Find the distinct branches (name and city) that have 
-------opened both accounts and loans
-------(With Exists keyword)

Select Distinct B.branch_name,branch_city From  Branch B, Account A
Where B.branch_name = A.branch_name
 And Exists (Select * From  Branch B1, Loan L
             Where  A.branch_name = L.branch_name);


-------Find the distinct customers (name and city) who do not 
------have loans but have accounts
---------(With NOT IN keyword)

Select Distinct C.customer_name,customer_city From Customer C, Depositor D
Where C.customer_name = D.customer_name
And C.customer_name NOT IN (Select C.customer_name                                                           
                                                                         From Customer C,Borrower Br                                                          
                                                                          Where C.customer_name =  
                                                                                          Br.customer_name);


-------Find the distinct customers (name and city) who do not 
------have loans but have accounts
-------(With NOT Exists keyword)

Select Distinct C.customer_name,customer_city 
From Customer C , Depositor D
Where C.customer_name = D.customer_name
And NOT Exists (Select * From Customer C1, Borrower B
                Where  C.customer_name = B.customer_name);



