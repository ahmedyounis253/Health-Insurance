drop database Insurancecompany;
create database InsuranceCompany;
use InsuranceCompany;
create table admin(

adminid int AUTO_INCREMENT not null,
FirstName varchar(50),
LastName varchar(50),
Email varchar(50) UNIQUE not null,
imagepath varchar(100),
facebook varchar(100),
github varchar(100),
linkedIn varchar(100),
Age int,
RegistrationDate Date,
primary key (adminid)
);

create table Hospital(
HospitalId int not null AUTO_INCREMENT ,
Name varchar(50) UNIQUE,
Website varchar(50),
Country varchar(50),
Region varchar(50),
City varchar(50),
Street varchar(50),
primary key(HospitalId)
);
create table HospitalContacts(   /* multivalued attribute maybe more than one contact  */
ContactId int not null AUTO_INCREMENT primary key,
HospitalId int not null,
Phone varchar(20),
foreign key (HospitalId ) references Hospital(hospitalId)  ON DELETE CASCADE ON UPDATE CASCADE
);

create table Plan (
  PlanId int not null AUTO_INCREMENT,
  Type varchar(10), /* Basic Premiem Gold   */
  Description varchar(1000),
  Primary key (PlanId)
);


create table HospitalPlan(
   /* many to  many relationship between hospitals and plans
     hospital can register to many plans
     and plan can include many hospitals
     */
HospitalPlanId int not null AUTO_INCREMENT primary key,
HospitalId int not null,
PlanId int Not null,
foreign key (HospitalId) references Hospital(HospitalId)  ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (PlanId)  references Plan(PlanId)  ON DELETE CASCADE ON UPDATE CASCADE

);

create table Customer(
  CustomerId int not null AUTO_INCREMENT,
  HolderId int not null,
  PlanId int not null,
  FirstName varchar(50),
  LastName varchar(50),
  Email varchar(50) UNIQUE not null,
  Age int,
  RegistrationDate Date,
  Stuff boolean,
  primary key (CustomerId),
  foreign key (HolderId) references Customer(CustomerId)  ON DELETE CASCADE ON UPDATE CASCADE,  /* one to many relationship between customer ---> dependents  */
  foreign key (PlanId) references Plan(PlanId)   ON DELETE CASCADE ON UPDATE CASCADE /* one to many relationship between Plan ---> Customers/dependents */
);

create table customerContact(  /* multivalued attribute maybe more than one contact  */
ContactId int not null AUTO_INCREMENT primary key,
CustomerId int not null,
Phone varchar(20),
foreign key (CustomerId) references Customer(CustomerId)  ON DELETE CASCADE ON UPDATE CASCADE
);

create table claim(
 ClaimId int not null AUTO_INCREMENT primary key,
 HospitalId int not null,
 CustomerId int not null,
 resolved boolean,
 SubmittingDate date,
 Expense int,
 Description varchar(1000),

foreign key (HospitalId) references Hospital(HospitalId)  ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (CustomerId) references Customer(CustomerId)  ON DELETE CASCADE ON UPDATE CASCADE


);
