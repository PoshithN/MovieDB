insert into Theatre (TheatreName, [Location]) values ('TheatreOne', 'ECity, Bangalore'), ('TheatreTwo', 'MCity, Chennai')



insert into Users (UserId, UserName, [Password], Age, Gender, EmailId, PhoneNumber) values ('ID101', 'UserOne', 'password1', 25, 'M', 'User1@gmail.com', 9856412652), ('ID102', 'UserTwo', 'password2', 35, 'F', 'User2@gmail.com', 9856434652)



insert into Shows (TheatreId, ShowDate, ShowTime, MovieName, Cost, NumOfTicketsAvl) values (1, '2024-02-01', '10:00:00', 'MovieOne', 100, 100)
insert into Shows (TheatreId, ShowDate, ShowTime, MovieName, Cost, NumOfTicketsAvl) values (2, '2024-02-01', '11:00:00', 'MovieTwo', 120, 200)



exec USP_BookTicket @UserId = 'ID102' , @ShowId = 1003 , @NumOfTickets = 2

select * from Booking
select * from Users
select * from Theatre
select * from Shows
select * from dbo.BookingDetails('B1003')
select * from dbo.GetMovieShowDetails('MovieTwo', 'MCity, Chennai')

