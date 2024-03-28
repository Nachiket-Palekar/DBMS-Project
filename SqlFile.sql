Create database Project;
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
Primary Key(UserID));
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
    Primary Key(PayeeID),
    UserID numeric,
    foreign key(UserID)references User(UserID),
    PayeeName varchar(22),
    PayeeAccountNumber numeric,
    PayeeBank varchar(22),
	Autopay char(2),
    PayeeType varchar(10));
create table Session_table(
    SessionID numeric,
    Primary Key(SessionID),
    UserID numeric,
    foreign key(UserID)references User(UserID),
    Token char(5),
    ExpirationTime numeric,
    LoginTime numeric);
create table Security_Table(
    UserID numeric,
    foreign key(UserID)references User(UserID),
    SecurityQuestion varchar(22),
    SecurityAnswer varchar(22));
create table Card_Table (
    CardID numeric,
    Primary Key(CardID),
     UserID numeric,
    foreign key(UserID)references User(UserID),
    CardNumber numeric,
    CardType varchar(15),
    ExpiryDate numeric,
    CVV numeric);
create table Interest_Rate(
    AccountType varchar(10),
    InterestRate float);
create table Loan_Table(
    LoanID numeric,
    Primary Key(LoanID),
     UserID numeric,
    foreign key(UserID)references User(UserID),
    LoanAmount numeric,
    InterestRate float,
    LoanTerm numeric,
    StartDate numeric,
    Loan_Status varchar(15));
create table Message_Table(
     MessageID numeric,
     Primary Key(MessageID),
	 UserID numeric,
     foreign key(UserID)references User(UserID),
     MessageText varchar(20));
     
create table Exchange_Rate (
     CurrencyFrom varchar(15),
     CurrencyTo varchar(15),
     ExchangeRate numeric);
create table Branch_Table(
	 BranchID numeric,
     Primary Key(BranchID),
     BranchName varchar(20),
     Location varchar(22));
create table ATM_Table(
	ATMID numeric,
     Primary Key(ATMID),
     Location varchar(20),
     ATM_Status varchar(22));
create table Customer_Service_Request(
    RequestID numeric,
    Primary Key(RequestID),
    UserID numeric,
    foreign key(UserID)references User(UserID),
    RequestType varchar(22),
    CSR_Description varchar(22),
    CSR_Status varchar(10),
    AssignedTo varchar(22));

create table Activity_Log(
     LogID numeric,
     Primary Key(LogID),
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


									

