use BlueJack_Library
go

-- Borrow
insert into BorrowHeader values
('BT016', 'SF001', 'ST001', '2020-11-20')

insert into BorrowDetail values
('BT016', 'BK001', '2020-12-17')

update MsBook
set BookStock -= 1
from MsBook
where BookID = 'BK001'
go

-- Donate
insert into DonationHeader values
('DT016', 'SF001', 'DR001', '2020-12-22')

insert into DonationDetail values
('DT016', 'BK001', 10)

update MsBook
set BookStock += 10
from MsBook
where BookID = 'BK001'
go