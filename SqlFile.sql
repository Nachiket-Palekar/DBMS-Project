Create database Project;
use Project;
create table User(
Username varchar(20),
Pass varchar(22),
FirstName varchar(20),
LastName varchar(20),
EmailPhone varchar(20),
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
     -- Timestamp
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
    -- Timestamp
create table Activity_Log(
     LogID numeric,
     Primary Key(LogID),
	 UserID numeric,
     foreign key(UserID)references User(UserID),
     ActivityType varchar(22));
     -- Timestamp

