use TempDB;
If (object_id('CustStaging_ValidPhones') is not null)
  Drop Table CustStaging_ValidPhones;
Go

Create Table CustStaging_ValidPhones
(CustomersStaging int identity Primary Key
,CustomerFirstName nvarchar(100)
,CustomerLastName nvarchar(100)
,CustomerEmail nvarchar(100)
,CustomerPhone nvarchar(100) );

Go

If (object_id('CustStaging_InValidPhones') is not null)
  Drop Table CustStaging_InValidPhones;
Go

Create Table CustStaging_InValidPhones
(CustomersStaging int identity Primary Key
,CustomerFirstName nvarchar(100)
,CustomerLastName nvarchar(100)
,CustomerEmail nvarchar(100)
,CustomerPhone nvarchar(100) );
Go

Select * From CustStaging_ValidPhones;
Select * From CustStaging_InValidPhones;