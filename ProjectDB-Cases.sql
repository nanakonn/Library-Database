use BlueJack_Library
go

-- 1
select
	StudentName,
	StudentAddress,
	bh.BorrowTransactionID,
	BorrowTransactionDate,
	[Number of Books] = count(bh.BorrowTransactionID)
from MsStudent ms
	join BorrowHeader bh on ms.StudentID = bh.StudentID
	join BorrowDetail bd on bh.BorrowTransactionID = bd.BorrowTransactionID
where year(BorrowTransactionDate) = 2020
	and StudentAddress like '% Street'
group by StudentName, StudentAddress, bh.BorrowTransactionID, BorrowTransactionDate
go

-- 2
select
	BookTitle,
	[Publish Month] = datename(m, BookPublishDate),
	BookCategoryName,
	[Total Sum Donation] = sum(Quantity)
from MsBookCategory mbc
	join MsBook mb on mbc.BookCategoryID = mb.BookCategoryID
	join DonationDetail dd on mb.BookID = dd.BookID
where BookCategoryName like '%y%'
	and month(BookPublishDate) % 2 != 0
group by BookTitle, BookPublishDate, BookCategoryName
go

-- 3
select
	bh.BorrowTransactionID,
	[BorrowTransactionDate] = format(BorrowTransactionDate, 'dd MMM yyyy'),
	StudentName,
	[Books Borrowed] = count(bh.BorrowTransactionID),
	[Average Book Rating] = avg(BookRating)
from MsStudent ms
	join BorrowHeader bh on ms.StudentID = bh.StudentID
	join BorrowDetail bd on bh.BorrowTransactionID = bd.BorrowTransactionID
	join MsBook mb on bd.BookID = mb.BookID
where StudentEmail like '%gmail%'
group by bh.BorrowTransactionID, BorrowTransactionDate, StudentName
having avg(BookRating) > 4.0
go

-- 4
select
	[DonatorName] = 'Ms. ' + DonatorName,
	[DonationDate] = format(DonationTransactionDate, 'MMM dd, yyyy'),
	[Books Donated] = sum(Quantity),
	[Average Rating] = avg(BookRating)
from MsDonator md
	join DonationHeader dh on md.DonatorID = dh.DonatorID
	join DonationDetail dd on dh.DonationTransactionID = dd.DonationTransactionID
	join MsBook mb on dd.BookID = mb.BookID
where day(DonationTransactionDate) between 1 and 14
	and DonatorGender = 'Female'
group by DonatorName, DonationTransactionDate
go

-- 5
select distinct
	DonatorName,
	DonationTransactionDate,
	StaffName,
	StaffGender,
	[StaffSalary] = 'Rp. ' + cast(StaffSalary as varchar)
from MsDonator md
	join DonationHeader dh on md.DonatorID = dh.DonatorID
	join MsStaff ms on dh.StaffID = ms.StaffID,(
		select
			avg(StaffSalary) as Average
		from MsStaff
	) as AverageSalary
where StaffSalary > AverageSalary.Average
	and len(DonatorName) >= 2
order by DonationTransactionDate desc
go

-- 6
select distinct
	dh.DonationTransactionID,
	[BookTitle] = replace(BookTitle, ' ', ''),
	[Rating Percentage] = cast(BookRating * 20 as varchar) + '%',
	Quantity,
	DonatorPhone
from MsDonator md
	join DonationHeader dh on md.DonatorID = dh.DonatorID
	join DonationDetail dd on dh.DonationTransactionID = dd.DonationTransactionID
	join MsBook mb on dd.BookID = mb.BookID,(
		select
			avg(BookRating) as Average
		from MsBook
	) as AverageRating
where BookRating > AverageRating.Average
	and len(DonatorAddress) > 15
go

-- 7
select distinct
	bh.BorrowTransactionID,
	[Borrow Date] = format(BorrowTransactionDate, 'MM-dd-yyyy'),
	[Return Day] = datename(weekday, ReturnDate),
	BookTitle,
	[BookRating] = cast(BookRating as varchar) + ' star(s)',
	BookCategoryName
from BorrowHeader bh
	join BorrowDetail bd on bh.BorrowTransactionID = bd.BorrowTransactionID
	join MsBook mb on bd.BookID = mb.BookID
	join MsBookCategory mbc on mb.BookCategoryID = mbc.BookCategoryID,(
		select
			min(BookRating) as Minimum,
			max(BookRating) as Maximum
		from MsBook
	) as Rating
where BookRating = Rating.Minimum or BookRating = Rating.Maximum
	and BookStock > 10
order by bh.BorrowTransactionID desc
go

-- 8
select distinct
	[StudentName] = 'Mr. ' + StudentName,
	[StudentEmail] = replace(StudentEmail, '.com', ''),
	[Books Borrowed] = count(BorrowTransactionID)
from MsStudent mst
	join BorrowHeader bh on mst.StudentID = bh.StudentID
	join MsStaff ms on bh.StaffID = ms.StaffID,(
		select
			avg(StaffSalary) as Average
		from MsStaff
	) as AverageSalary
where StudentGender = 'Male'
	and StaffSalary > AverageSalary.Average
group by StudentName, StudentEmail
union
select distinct
	[StudentName] = 'Ms. ' + StudentName,
	[StudentEmail] = replace(StudentEmail, '.com', ''),
	[Books Borrowed] = count(BorrowTransactionID)
from MsStudent mst
	join BorrowHeader bh on mst.StudentID = bh.StudentID
	join MsStaff ms on bh.StaffID = ms.StaffID,(
		select
			avg(StaffSalary) as Average
		from MsStaff
	) as AverageSalary
where StudentGender = 'Female'
	and StaffSalary < AverageSalary.Average
group by StudentName, StudentEmail
go

-- 9
create view ViewDonationDetail as
select
	DonatorName,
	[Donation Transaction] = count(dh.DonationTransactionID),
	[Average Quantity] = avg(Quantity)
from MsDonator md
	join DonationHeader dh on md.DonatorID = dh.DonatorID
	join DonationDetail dd on dh.DonationTransactionID = dd.DonationTransactionID
where DonatorAddress like '% Street'
	or DonatorAddress like '% Avenue'
group by DonatorName
having count(dh.DonationTransactionID) > 1
go

-- 10
create view ViewStudentBorrowingData as
select
	StudentName,
	[Borrow Transaction] = count(bh.BorrowTransactionID),
	[Average Duration] = avg(datediff(day, BorrowTransactionDate, ReturnDate))
from MsStudent ms
	join BorrowHeader bh on ms.StudentID = bh.StudentID
	join BorrowDetail bd on bh.BorrowTransactionID = bd.BorrowTransactionID
where StudentGender = 'Male'
	and StudentEmail like '%yahoo%'
group by StudentName
go