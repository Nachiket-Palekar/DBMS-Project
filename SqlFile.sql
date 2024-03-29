create database Project;
use Project;
create table User(
Username varchar(20),
Pass varchar(22),
FirstName varchar(20),
LastName varchar(20),
EmailPhone varchar(40),
Address varchar(20),
DateOfBirth numeric,
UserID numeric,
primary key(UserID));
create table Account(
AccountID numeric,
 UserID numeric,
 AccountType varchar(4),
 Balance numeric,
 DateOpened numeric,
 Status_acc varchar(8),
 primary key(AccountID),
 foreign key(UserID)references User(UserID));
create table Transaction(
TransactionID numeric,
AccountType varchar(4),
AccountID numeric,
Balance numeric,
DateOpened numeric,
Status_acc varchar(8),
TransactionType varchar(10),
 Amount numeric,
 TransactionDate numeric,
 Description_Trans varchar(22),
 BalanceAfterTransaction numeric,
primary key(TransactionID),
foreign key(AccountID)references Account(AccountID));
create table Payee(
    PayeeID numeric,
    primary key(PayeeID),
    UserID numeric,
    foreign key(UserID)references User(UserID),
    PayeeName varchar(22),
    PayeeAccountNumber numeric,
    PayeeBank varchar(22),
	Autopay char(2),
    PayeeType varchar(10));
create table Session_table(
    SessionID numeric,
    primary key(SessionID),
    UserID numeric,
    foreign key(UserID)references User(UserID),
    Token char(5),
    ExpirationTime numeric,
    LoginTime numeric);
create table Security_Table(
    UserID numeric,
    foreign key(UserID)references User(UserID),
    SecurityQuestion varchar(82),
    SecurityAnswer varchar(82));
create table Card_Table (
    CardID numeric,
    primary key(CardID),
     UserID numeric,
    foreign key(UserID)references User(UserID),
    CardNumber long,
    CardType varchar(15),
    ExpiryDate numeric,
    CVV numeric);
create table Interest_Rate(
    AccountType varchar(20),
    InterestRate float);
create table Loan_Table(
    LoanID numeric,
    primary key(LoanID),
     UserID numeric,
    foreign key(UserID)references User(UserID),
    LoanAmount numeric,
    InterestRate float,
    LoanTerm numeric,
    StartDate numeric,
    Loan_Status varchar(15));
create table Message_Table(
     MessageID numeric,
     primary key(MessageID),
	 UserID numeric,
     foreign key(UserID)references User(UserID),
     MessageText varchar(1000));
     
create table Exchange_Rate (
     CurrencyFrom varchar(15),
     CurrencyTo varchar(15),
     ExchangeRate float);
create table Branch_Table(
	 BranchID numeric,
     primary key(BranchID),
     BranchName varchar(20),
     Location varchar(22));
create table ATM_Table(
	ATMID numeric,
     primary key(ATMID),
     Location varchar(90),
     ATM_Status varchar(90));
create table Customer_Service_Request(
    RequestID numeric,
    primary key(RequestID),
    UserID numeric,
    foreign key(UserID)references User(UserID),
    RequestType varchar(22),
    CSR_Description varchar(1000),
    CSR_Status varchar(22),
    AssignedTo varchar(60));

create table Activity_Log(
     LogID numeric,
     primary key(LogID),
	 UserID numeric,
     foreign key(UserID)references User(UserID),
     ActivityType varchar(22));

insert into user values("john_doe","password1", "John","Doe","john.doe@email.com","123 Main St.",01011990,1101),
("jane_doe","password2","Jane","Doe","jane.doe@email.com","456 Oak St.",02021985,1102),
("jim_brown","password3","Jim", "Brown","jim.brown@email.com","789 Elm St.",03031995,1103),
("jake_gray","password4","Jake","Gray","jake.gray@email.com","321 Pine St.",04041992,1104),
("joan_green",	"password5","Joan","Green","joan.green@email.com","654 Maple St.",05051997,1105),
("jordan_white","password6","Jordan","White","jordan.white@email.com","987 Ash St.",06061994,1106),
("jessica_purple","password7","Jessica","Purple","jessica.purple@email.com","135 Cedar St.",07071991,1107),
("jack_orange","password8","Jack","Orange",	"jack.orange@email.com","246 Birch St.", 08081993,1108),
("jill_black","password9",	"Jill",	"Black","jill.black@email.com",	"369 Walnut St.",09091996,1109),
("james_yellow","password10","James","Yellow","james.yellow@email.com","478 Cherry St.",09091996,1110);

insert into account values(1001,1101,"CHE",5000,1620105600,"Active"),
(1002,1102,"SAV",10000,1620105600,"Active"),
(1003,1103,"CRE",2000,1620105600,"Active"),
(1004,1104,"CHE",7000,1620105600,"Inactive"),
(1005,1105,"SAV",15000,1620105600,"Active"),
(1006,1106,"CRE",3000,1620105600,"Active"),
(1007,1107,"CHE",8000,1620105600,"Active"),
(1008,1108,"SAV",12000,1620105600,"Active"),
(1009,1109,"CRE",4000,1620105600,"Active"),
(1010,1110,"CHE",9000,1620105600,"Active");

insert into transaction values (2000,	"CHE",1001,	3000,	1620105600,	"Active",	"DEBIT",100,1620368000,	"Online purchase",	2900),					
(2001,	"CHE", 1002,	3000,	1620105600,	"Active",	"DEBIT",50,1620368001,	"In-store purchase",	2950),
(2002,	"CHE",1003,	5000,	1620105600,	"Active",	"CREDIT",200,	1620368002,	"Employee reimbursement", 5200),					
(3001,	"SAV",1004,	10000,	1620105600,	"Active",	"DEBIT",2000,1620368003,	"Withdrawal",	8000),					
(3002,	"SAV",1005,	15000,	1620105600,	"Active",	"CREDIT",1000,1620368004,	"Interest earned",	16000),					
(4001,	"CRE",1006,	4000,	1620105600,	"Active",	"DEBIT",100,1620368005,	"Online payment",	3900),					
(4002,	"CRE",1007,	4000,	1620105600,	"Active",	"DEBIT",100,1620368006,	"Interest charge",	3800),					
(4003,	"CRE",1008,	7000,	1620105600,	"Active",	"CREDIT",500,	1620368007,	"Purchase reward",	7500),					
(4004,	"CRE",1009,	7000,	1620105600,	"Active",	"DEBIT",300,1620368008,	"Cash advance",	7200),					
(4005,	"CRE",1010,	7000,	1620105600,	"Active",	"DEBIT",500,1620368008,	"Cash advance",	6900);					

insert into payee values (5001,	1101,	"John Smith",	123456789,	"Acme Bank",	1	,"Personal"),									
(5002,	1102,	"Jane Doe",	234567890,	"Bank of America",	1	,"Personal"),									
(5003,	1103,	"Acme Inc.",	345678901,	"Wells Fargo",	1	,"Business"),									
(5004,	1104,	"Acme Inc.",	456789012,	"Wells Fargo",	1	,"Business"),									
(5005,	1105,	"XYZ Inc.",	567890123,	"Chase Bank",	1	,"Business"),									
(5006,	1106,	"Acme Inc.",	678901234,	"Wells Fargo",	0	,"Business"),									
(5007,	1107,	"Office Supplies",	789012345,	"Staples",	1,	"Business	"),								
(5008,	1108,	"Utilities",	890123456,	"ABC Utility",	1	,"Personal"),									
(5009,	1109,	"Gas and Electric",	901234567,	"DEF Utility",	1	,"Personal"),									
(5010,	1110,	"Rent",	1234567890,	"Local Property",	1	,"Personal");

insert into session_table values (3001,	1101,1,1620105600,	1620105660),												
(3002,	1102,1,	1620105660,	1620105720),												
(3003,	1103,1,	1620105720,	1620105780),												
(3004,	1104,1,	1620105780,	1620105840),												
(3005,	1105,1,	1620105840,	1620105900),												
(3006,	1106,1,	1620105900,	1620105960),												
(3007,	1107,1,	1620105960,	1620106020),												
(3008,	1108,1,	1620106020,	1620106080),												
(3009,	1109,1,	1620106080,	1620106140),												
(3010,	1110,1,	1620106140,	1620106200);												
									
insert into security_table values (1101,	"What is your favorite color?",	"Blue"),												
(1102,	"What is your pet's name?",	"Fluffy"),												
(1103,	"What is your favorite sports team?",	"NY Yankees"),												
(1104,	"What is your favorite movie?",	"The Godfather	"),											
(1105,	"What is your favorite book?",	"To Kill a Mockingbird"),												
(1106,	"What is your favorite food?",	"Pizza"),												
(1107,	"What is your favorite band?",	"The Beatles"),												
(1108,	"What is your favorite TV show?",	"Game of Thrones"),												
(1109,	"What is your favorite holiday?",	"Christmas"),												
(1110,	"What is your favorite superhero?",	"Superman");												

insert into card_table values (5620,	1101,	1234567890123450,	"Visa",	0824,	123),
(5621,	1102,	1234567890123450,	"Visa",	0924,	123),
(5622,	1103,	1234567890123460,	"Visa",	1024,	123),
(5623,	1104,	1234567890123460,	"Visa",	1124,	123),
(5624,	1105,	1234567890123460,	"Visa",	1224,	123),
(5625,	1106,	1234567890123470,	"Visa",	0125,	123),
(5626,	1107,	1234567890123470,	"Visa",	0225,	123),
(5627,	1108,	1234567890123470,	"Visa",	0325,	123),
(5628,	1109,	1234567890123480,	"Visa",	0425,	123),
(5629,	1110,	1234567890123480,	"Visa",	0525,	123);

insert into interest_rate values ("Checking",0),
("Savings",0.02),
("MoneyMarket",0.03),
("CD",0.05),
("RewardsChecking",0.005),
("CreditCard",0.15);

insert into loan_table values ( 1     ,1101  ,10000     ,0.05       ,60      ,1614028400,"Active"),       
( 2     ,1102  ,15000     ,0.06       ,36      ,1614114800,"Pending"),      
( 3     ,1103  ,20000     ,0.07       ,48      ,1614201200,"Active"),       
( 4     ,1104  ,5000      ,0.08       ,24      ,1614287600,"In Progress"),
( 5     ,1105  ,12000     ,0.05       ,60      ,1614374000,"Completed"),    
( 6     ,1106  ,8000      ,0.06       ,36      ,1614460400,"Active"),       
( 7     ,1107  ,25000     ,0.07       ,48      ,1614546800,"Pending"),      
( 8     ,1108  ,30000     ,0.08       ,24      ,1614633200,"In Progress"), 
( 9     ,1109  ,15000     ,0.05       ,60      ,1614719600,"Completed"),    
( 10    ,1110  ,20000     ,0.06       ,36      ,1614806000,"Active");   

insert into Message_Table values
(1, 1101, 'Welcome to our banking services! Your account is now active.'),
(2, 1102, 'We are sorry to inform you that your last transaction was declined due to insufficient funds.'),
(3, 1103, 'Your new credit card has been issued and is on its way. Your card number is 1234-5678-9012-3456.'),
(4, 1104, 'Please update your account information to ensure the security of your account.'),
(5, 1105, 'Your loan application has been approved. You will receive further details via email.'),
(6, 1106, 'Your account will be charged a $10 monthly maintenance fee starting from next month.'),
(7, 1107, 'We are pleased to offer you a 0.5% interest rate increase on your savings account.'),
(8, 1108, 'Your account has been locked for security reasons. Please contact customer service to unlock it.'),
(9, 1109, 'Your account balance is low. Please make a deposit to avoid any service interruptions.'),
(10, 1110, 'Thank you for choosing our bank. We appreciate your business and look forward to serving you in the future.'); 

insert into Exchange_Rate values
('USD', 'EUR', 0.84),
('USD', 'GBP', 0.73),
('USD', 'JPY', 111.56),
('USD', 'CAD', 1.27),
('USD', 'CHF', 0.93),
('USD', 'AUD', 1.32),
('USD', 'CNY', 6.38),
('USD', 'SEK', 8.55),
('USD', 'NZD', 1.43),
('USD', 'NOK', 8.62);   

insert into Branch_Table values
(1, 'Headquarters', 'New York, NY'),
(2, 'Midtown Branch', 'New York, NY'),
(3, 'Brooklyn Branch', 'Brooklyn, NY'),
(4, 'Queens Branch', 'Queens, NY'),
(5, 'Bronx Branch', 'Bronx, NY'),
(6, 'Manhattan Branch', 'Manhattan, NY'),
(7, 'Staten Island Branch', 'Staten Island, NY'),
(8, 'Jersey City Branch', 'Jersey City, NJ'),
(9, 'Newark Branch', 'Newark, NJ'),
(10, 'Philadelphia Branch', 'Philadelphia, PA');

insert into ATM_Table values
(1, '123 Main St, Anytown, USA', 'Operational'),
(2, '456 Elm St, Anytown, USA', 'Out of Service'),
(3, '789 Oak St, Anytown, USA', 'Operational'),
(4, '101 Maple Ave, Anytown, USA', 'Operational'),
(5, '202 Pine Rd, Anytown, USA', 'Operational'),
(6, '303 Birch Blvd, Anytown, USA', 'Operational'),
(7, '404 Cedar Dr, Anytown, USA', 'Out of Service'),
(8, '505 Willow Way, Anytown, USA', 'Operational'),
(9, '606 Hickory Hwy, Anytown, USA', 'Operational'),
(10, '707 Cherry Cir, Anytown, USA', 'Operational');

insert into Customer_Service_Request values
(1, 1101, 'AccountUpdate', 'Request to change account address', 'Open', 'John Doe'),
(2, 1102, 'PasswordReset', 'Password reset request', 'Completed', 'Jane Smith'),
(3, 1103, 'NewAccount', 'Request for new checking account', 'InProgress', 'John Doe'),
(4, 1104, 'LoanInquiry', 'Inquiry about home loan options', 'Open', 'Jane Smith'),
(5, 1105, 'FraudAlert', 'Report of possible fraudulent activity', 'InProgress', 'John Doe'),
(6, 1106, 'CardReplacement', 'Request to replace lost credit card', 'Completed', 'Jane Smith'),
(7, 1107, 'AccountClosure', 'Request to close account', 'Open', 'John Doe'),
(8, 1108, 'CreditLimitIncrease', 'Request for credit limit increase', 'InProgress', 'Jane Smith'),
(9, 1109, 'DisputeTransaction', 'Dispute of recent transaction', 'Open', 'John Doe'),
(10, 1110, 'AccountTransfer', 'Request to transfer funds between accounts', 'Completed', 'Jane Smith');

insert into Activity_Log values
(1, 1101, 'Login'),
(2, 1102, 'PasswordChange'),
(3, 1103, 'FundTransfer'),
(4, 1104, 'AccountCreation'),
(5, 1105, 'LoanApplication'),
(6, 1106, 'PasswordReset'),
(7, 1107, 'CardRequest'),
(8, 1108, 'AccountDeletion'),
(9, 1109, 'StatementRequest'),
(10, 1110, 'Deposit');


SELECT * FROM User;
SELECT AccountID, Balance FROM Account WHERE AccountType = 'CHE';
SELECT * FROM Transaction WHERE AccountID IN (SELECT AccountID FROM Account WHERE UserID = 1101);
SELECT UserID, COUNT(*) as TotalAccounts FROM Account GROUP BY UserID;
SELECT UserID, SUM(Balance) as TotalBalance FROM Account GROUP BY UserID;
SELECT UserID, COUNT(*) as TotalTransactions, SUM(Amount) as TotalAmount FROM Transaction GROUP BY UserID;
SELECT * FROM Payee WHERE UserID = 1101;
SELECT AccountType, Balance FROM Account WHERE UserID = 1101;
SELECT SecurityQuestion, SecurityAnswer FROM Security_Table WHERE UserID = 1101;
SELECT * FROM Card_Table WHERE UserID = 1101;
SELECT Username, FirstName, LastName FROM User WHERE UserID IN (SELECT UserID FROM Account GROUP BY UserID HAVING COUNT(*) > 1);
SELECT AccountType, COUNT(*) as TotalTransactions, SUM(Amount) as TotalAmount FROM Transaction GROUP BY AccountType;
SELECT u.Username, u.FirstName, u.LastName, a.AccountType, t.Amount FROM User u JOIN Account a ON u.UserID = a.UserID JOIN Transaction t ON a.AccountID = t.AccountID;
SELECT u.Username, u.FirstName, u.LastName, st.SecurityQuestion FROM User u JOIN Security_Table st ON u.UserID = st.UserID;
SELECT SecurityQuestion FROM security_table WHERE UserID = 1110;
SELECT * FROM activity_log WHERE UserID = 1109;
SELECT * FROM exchange_rate WHERE currencyFrom = 'USD';
SELECT * FROM account WHERE Balance BETWEEN 900 AND 1100;
SELECT InterestRate FROM Interest_Rate WHERE AccountType = 'SAV';
select*from transaction;
select AccountID,UserID from account;