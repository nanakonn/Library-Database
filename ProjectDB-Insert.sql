use BlueJack_Library
go

insert into MsStaff values
('SF001', 'Adam Abrar', 'Male', 'Abraham Jr. Avenue', '+628121353246', 7000000),
('SF002', 'Mulya Hana', 'Female', 'BJ Habibie Street', '+6281277672663', 7000000),
('SF003', 'Miracle Aurelia', 'Female', 'Christine Street', '+6281213513688', 8000000),
('SF004', 'Muhammad Dzaky', 'Male', 'Donald Trump Street', '+6281287558931', 6000000),
('SF005', 'Michael Owen', 'Male', 'East Town Avenue', '+6281212557736', 6000000),
('SF006', 'Krystelle Burns', 'Female', 'Faraway Land Street', '+6281246846721', 7000000),
('SF007', 'Sam Drew', 'Male', 'Ghost Buster Street', '+6281268980641', 8000000),
('SF008', 'Connor Randall', 'Male', 'Hillfield Street', '+6281223626427', 6000000),
('SF009', 'Teagen Hall', 'Female', 'Indiana Avenue', '+6281236357271', 6000000),
('SF010', 'Eden Thomas', 'Male', 'Jordan Mike Street', '+6281267967931', 7000000);
go

insert into MsStudent values
('ST001', 'Joshua Lipponen', 'Male', 'Alakazam Avenue', 'JoshuaLippo@gmail.com'),
('ST002', 'Kelsey Merrigan', 'Female', 'Bush Washaton Street', 'KelseyMerri@gmail.com'),
('ST003', 'Jordan Donnelly', 'Female', 'Criss Cross Street', 'JordanDonn@gmail.com'),
('ST004', 'Luke Giucci', 'Male', 'Donald Duck Street', 'LukeGiucci@gmail.com'),
('ST005', 'Huy Nguyen', 'Male', 'East Away Avenue', 'NguyenHuy@yahoo.com'),
('ST006', 'Elizabeth Swan', 'Female', 'Forgotten Street', 'LizSwan@yahoo.com'),
('ST007', 'Corey Watson', 'Male', 'Gangnam Style Street', 'CoreyWatson@gmail.com'),
('ST008', 'Connor Scifleet', 'Male', 'Hotel California Street', 'Scifleet@yahoo.com'),
('ST009', 'Caitlyn Reeves', 'Female', 'Imperial Cross Avenue', 'CaitlynReeves@gmail.com'),
('ST010', 'Ethan Woodbridge', 'Male', 'Jarvis Assistant Street', 'EthanWood@yahoo.com');
go

insert into MsDonator values
('DR001', 'Adji Nouvaldi', 'Male', 'Kingston Jr. Avenue', '+6281290552307'),
('DR002', 'Mary Kendall', 'Female', 'Liam Nelson Street', '+6281223634735'),
('DR003', 'Stephanie White', 'Female', 'Melancholy Street', '+6281223634643'),
('DR004', 'Krisna Hadi', 'Male', 'Notch Alexander Avenue', '+6281234745821'),
('DR005', 'Hanif Rifqi', 'Male', 'Oliver Woodbridge Avenue', '+6281224735321'),
('DR006', 'Siti Nur', 'Female', 'Patrick Star Street', '+6281256672314'),
('DR007', 'Gusti Achmad', 'Male', 'Qwerty Uiop Street', '+6281235457457'),
('DR008', 'Abdul Haris', 'Male', 'Rick Roll Street', '+6281290867431'),
('DR009', 'Alyssa Cica', 'Female', 'Saint Patrick Street', '+6281256852348'),
('DR010', 'Naufal Rasyiq', 'Male', 'Totally Not a Street', '+6281276329562');
go

insert into MsBookCategory values
('BC001', 'Fantasy'),
('BC002', 'Mystery'),
('BC003', 'Education'),
('BC004', 'Romance'),
('BC005', 'Sci-fi');
go

insert into MsBook values
('BK001', 'BC001', 'The Name of the Wind', '2012-03-27', 180, 2.7),
('BK002', 'BC001', 'Jade City', '2017-11-07', 180, 3.6),
('BK003', 'BC002', 'Da Vinci Code', '2013-03-18', 190, 4.6),
('BK004', 'BC002', 'Gone Girl', '2012-05-24', 190, 3.4),
('BK005', 'BC003', 'Data Structures', '2012-09-14', 180, 3.2),
('BK006', 'BC003', 'Algorithm Design', '2015-03-16', 180, 3.2),
('BK007', 'BC004', 'It Ends With Us', '2016-02-02', 190, 3.7),
('BK008', 'BC004', 'Me Before You', '2012-01-05', 180, 4.4),
('BK009', 'BC005', 'All Systems Red', '2017-05-02', 180, 3.2),
('BK010', 'BC005', 'The Fifth Season', '2015-08-04', 190, 2.3);
go

insert into BorrowHeader values
('BT001', 'SF001', 'ST001', '2020-11-16'),
('BT002', 'SF002', 'ST002', '2020-11-16'),
('BT003', 'SF003', 'ST003', '2020-11-16'),
('BT004', 'SF004', 'ST004', '2020-11-16'),
('BT005', 'SF005', 'ST005', '2020-11-17'),
('BT006', 'SF006', 'ST006', '2020-11-17'),
('BT007', 'SF007', 'ST007', '2020-11-17'),
('BT008', 'SF008', 'ST008', '2020-11-17'),
('BT009', 'SF009', 'ST009', '2020-11-18'),
('BT010', 'SF010', 'ST010', '2020-11-18'),
('BT011', 'SF001', 'ST003', '2020-11-19'),
('BT012', 'SF002', 'ST005', '2020-11-19'),
('BT013', 'SF003', 'ST007', '2020-11-19'),
('BT014', 'SF004', 'ST009', '2020-11-19'),
('BT015', 'SF005', 'ST010', '2020-11-19');
go

insert into BorrowDetail values
('BT001', 'BK001', '2020-12-17'),
('BT001', 'BK003', '2020-12-17'),
('BT002', 'BK002', '2020-12-17'),
('BT002', 'BK003', '2020-12-17'),
('BT003', 'BK004', '2020-12-17'),
('BT003', 'BK005', '2020-12-17'),
('BT004', 'BK010', '2020-12-17'),
('BT004', 'BK006', '2020-12-17'),
('BT005', 'BK009', '2020-12-18'),
('BT005', 'BK006', '2020-12-18'),
('BT006', 'BK003', '2020-12-18'),
('BT006', 'BK005', '2020-12-18'),
('BT007', 'BK007', '2020-12-18'),
('BT007', 'BK004', '2020-12-18'),
('BT008', 'BK009', '2020-12-18'),
('BT008', 'BK001', '2020-12-18'),
('BT009', 'BK005', '2020-12-19'),
('BT009', 'BK008', '2020-12-19'),
('BT010', 'BK002', '2020-12-19'),
('BT010', 'BK001', '2020-12-19'),
('BT011', 'BK007', '2020-12-20'),
('BT012', 'BK006', '2020-12-20'),
('BT013', 'BK002', '2020-12-20'),
('BT014', 'BK008', '2020-12-20'),
('BT015', 'BK010', '2020-12-20');
go

insert into DonationHeader values
('DT001', 'SF001', 'DR001', '2020-12-01'),
('DT002', 'SF002', 'DR002', '2020-12-02'),
('DT003', 'SF003', 'DR003', '2020-12-03'),
('DT004', 'SF004', 'DR004', '2020-12-05'),
('DT005', 'SF005', 'DR005', '2020-12-06'),
('DT006', 'SF006', 'DR006', '2020-12-07'),
('DT007', 'SF007', 'DR007', '2020-12-09'),
('DT008', 'SF008', 'DR008', '2020-12-10'),
('DT009', 'SF009', 'DR009', '2020-12-11'),
('DT010', 'SF010', 'DR010', '2020-12-13'),
('DT011', 'SF003', 'DR001', '2020-12-14'),
('DT012', 'SF005', 'DR003', '2020-12-15'),
('DT013', 'SF007', 'DR005', '2020-12-17'),
('DT014', 'SF009', 'DR007', '2020-12-18'),
('DT015', 'SF010', 'DR009', '2020-12-19');
go

insert into DonationDetail values
('DT001', 'BK001', 10),
('DT001', 'BK003', 15),
('DT002', 'BK004', 12),
('DT002', 'BK002', 20),
('DT003', 'BK005', 18),
('DT003', 'BK008', 10),
('DT004', 'BK010', 12),
('DT004', 'BK006', 18),
('DT005', 'BK007', 20),
('DT005', 'BK002', 15),
('DT006', 'BK008', 12),
('DT006', 'BK009', 10),
('DT007', 'BK002', 18),
('DT007', 'BK001', 12),
('DT008', 'BK005', 10),
('DT008', 'BK006', 15),
('DT009', 'BK004', 10),
('DT009', 'BK002', 20),
('DT010', 'BK001', 20),
('DT010', 'BK003', 10),
('DT011', 'BK010', 12),
('DT012', 'BK009', 18),
('DT013', 'BK006', 10),
('DT014', 'BK007', 15),
('DT015', 'BK008', 10);