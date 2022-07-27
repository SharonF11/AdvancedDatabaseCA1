create database dbca;
#CREATE TABLE ADMIN
CREATE TABLE Admin(
    AdminID varchar(10) not null PRIMARY KEY, 
    Fname varchar(30) not null,
    Lname varchar(30) not null, 
    UserName varchar(15) not null, 
    Password varchar(10) not null
);
#CREATE TABLE CUSTOMERS
CREATE TABLE Customers(
    CustomerID varchar(10) not null PRIMARY KEY, 
    Fname varchar(30) not null,
    Lname varchar(30) not null, 
    Email varchar(15) not null, 
    Address varchar(30) not null,
    Telephone varchar(10) not null
);
#CREATE TABLE ADMINCUSTOMERRELATION
CREATE TABLE AdminCustomerRelation(
    CustomerID varchar(10) NOT NULL,
    AdminID varchar(10) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID), 
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID),
    UNIQUE (CustomerID, AdminID)
);
#CREATE TABLE ACTIVITY
CREATE TABLE Activity(
    ActivityID varchar(10) not null PRIMARY KEY, 
    Activity varchar(30) not null,
    CustomerID varchar(10) not null,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) 
);
#CREATE TABLE PAYMENT
CREATE TABLE Payment(
    PaymentID varchar(10) not null PRIMARY KEY,
    ccNo varchar(16),
    ExpiryDate varchar(20),
    CVVNO varchar(15)
    );
#CREATE TABLE RESERVATION
CREATE TABLE Reservation(
    ReservationID varchar(10) not null PRIMARY KEY,
    Activity varchar(30) not null,
    Date varchar(30) not null,
    Time varchar(30) not null, 
    Place varchar(15) not null, 
    Participants varchar(30) not null,
    ActivityID varchar(10) unique not null,
    PaymentID varchar(10) unique not null,
    FOREIGN KEY (ActivityID) REFERENCES Activity(ActivityID),
    FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID) 
);
#CREATE TABLE CHILDREN
CREATE TABLE Children(
    ChildrenID varchar(10) not null PRIMARY KEY,
    Fname varchar(30) not null,
    Lname varchar(30) not null, 
    DOB varchar(15) not null,
    CustomerID varchar(10) not null,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    );
#JOIN
SELECT customers.CustomerID, Customers.FName, children.Fname
FROM children
INNER JOIN Customers ON children.CustomerID=Customers.CustomerID;
#GROUPBY WITH HAVING
SELECT COUNT(ReservationID),Place
FROM reservation
WHERE Participants>2
GROUP BY Place
HAVING COUNT(ReservationID)>1 ;





