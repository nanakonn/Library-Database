create database BlueJack_Library
go
use BlueJack_Library
go

create table MsStaff(
	StaffID char(5) primary key check (StaffID like 'SF[0-9][0-9][0-9]'),
	StaffName varchar(50) check (len(StaffName) > 1) not null,
	StaffGender varchar(10) check (StaffGender in('Male', 'Female')) not null,
	StaffAddress varchar(50),
	StaffPhone varchar(20) check (StaffPhone like '+62%') not null,
	StaffSalary int not null
);
go

create table MsStudent(
	StudentID char(5) primary key check (StudentID like 'ST[0-9][0-9][0-9]'),
	StudentName varchar(50) check (len(StudentName) > 1) not null,
	StudentGender varchar(10) check (StudentGender in('Male', 'Female')) not null,
	StudentAddress varchar(50),
	StudentEmail varchar(50) check (StudentEmail like '%@%') not null
);
go

create table MsDonator(
	DonatorID char(5) primary key check (DonatorID like 'DR[0-9][0-9][0-9]'),
	DonatorName varchar(50) check (len(DonatorName) > 1) not null,
	DonatorGender varchar(10) check (DonatorGender in('Male', 'Female')) not null,
	DonatorAddress varchar(50),
	DonatorPhone varchar(20) check (DonatorPhone like '+62%') not null
);
go

create table MsBookCategory(
	BookCategoryID char(5) primary key check (BookCategoryID like 'BC[0-9][0-9][0-9]'),
	BookCategoryName varchar(50) not null
);
go

create table MsBook(
	BookID char(5) primary key check (BookID like 'BK[0-9][0-9][0-9]'),
	BookCategoryID char(5) foreign key references MsBookCategory(BookCategoryID) on update cascade on delete cascade not null,
	BookTitle varchar(50) not null,
	BookPublishDate date check (year(BookPublishDate) > 2011) not null,
	BookStock int not null,
	BookRating float not null,
);
go

create table BorrowHeader(
	BorrowTransactionID char(5) primary key check (BorrowTransactionID like 'BT[0-9][0-9][0-9]'),
	StaffID char(5) foreign key references MsStaff(StaffID) on update cascade on delete cascade not null,
	StudentID char(5) foreign key references MsStudent(StudentID) on update cascade on delete cascade not null,
	BorrowTransactionDate date not null
);
go

create table BorrowDetail(
	BorrowTransactionID char(5) foreign key references BorrowHeader(BorrowTransactionID) on update cascade on delete cascade not null,
	BookID char(5) foreign key references MsBook(BookID) on update cascade on delete cascade not null,
	ReturnDate date not null,
	primary key(BorrowTransactionID, BookID)
);
go

create table DonationHeader(
	DonationTransactionID char(5) primary key check (DonationTransactionID like 'DT[0-9][0-9][0-9]'),
	StaffID char(5) foreign key references MsStaff(StaffID) on update cascade on delete cascade not null,
	DonatorID char(5) foreign key references MsDonator(DonatorID) on update cascade on delete cascade not null,
	DonationTransactionDate date not null,
);
go

create table DonationDetail(
	DonationTransactionID char(5) foreign key references DonationHeader(DonationTransactionID) on update cascade on delete cascade not null,
	BookID char(5) foreign key references MsBook(BookID) on update cascade on delete cascade not null,
	Quantity int check (Quantity >= 10 and Quantity <= 500) not null,
	primary key(DonationTransactionID, BookID)
);