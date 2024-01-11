create table Theatre(
	TheatreId int constraint pk_Theatre primary key identity,
	ThaetreName varchar(50) not null,
	[Location] varchar(100) not null
)
go

--alter table Theatre
--drop column ThaetreName
--add TheatreName varchar(50) not null

alter table Theatre
drop column ThaetreName

alter table Theatre
add TheatreName varchar(50) not null

create table Users(
	UserId varchar(50) constraint pk_UserId primary key,
	UserName varchar(50) constraint uk_UserName unique not null,
	[Password] varchar(50) not null,
	Age int,
	Gender char(1),
	EmailId varchar(50) constraint uk_EmailId unique not null,
	PhoneNumber numeric(10) not null
)
go

create table Shows(
	ShowId int constraint pk_ShowId primary key identity(1000,1),
	TheatreId int constraint fk_TheatreId foreign key references Theatre(TheatreId) not null,
	ShowDate date not null,
	ShowTime time not null,
	MovieName varchar(50) not null,
	Cost decimal(6,2) not null,
	NumOfTicketsAvl int not null
)
go

create table Booking(
	BookingId varchar(5) constraint chk_BookingId check(BookingId like 'B%' and datalength(bookingId)=5),
	UserName varchar(50) constraint fk_UserId foreign key references Users(UserName) not null,
	ShowId int constraint fk_ShowId foreign key references Shows(ShowId) not null,
	TicketCount int not null,
	Cost decimal(6,2) not null
)
go

alter table Booking
add ID int identity(1001,1)

alter table Booking
drop constraint chk_BookingId

alter table Booking
drop column BookingId

alter table Booking
add BookingId as 'B' + cast(ID as varchar(4)) persisted constraint pk_BookingId primary key

