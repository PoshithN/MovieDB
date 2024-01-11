create function GetMovieShowDetails(@MovieTitle varchar(50), @TheatreLocation varchar(50))
returns @MovieShows table(MovieName varchar(50), ShowDate date, ShowTime time, TheatreTitle varchar(50), Cost decimal(6,2))
as
BEGIN
	insert into @MovieShows
	select MovieName, ShowDate, ShowTime, TheatreName, Cost
		from Theatre as T
		inner join
		Shows as S
			on T.TheatreId = S.TheatreId
	where T.[Location] = @TheatreLocation and S.MovieName = @MovieTitle
	
	return
end
go


create function BookingDetails(@BookingId varchar(5))
returns @Details table(BookingId varchar(5), UserName varchar(50), MovieName varchar(50), TheatreName varchar(50), ShowDate date, ShowTime time, TotalTickets int, TotCost decimal(6,2))
as
begin
	insert into @Details
	select BookingId, U.UserName, MovieName, TheatreName, ShowDate, ShowTime, TicketCount, B.Cost
		from Booking as B
		inner join
		Users as U
			on U.UserName = B.UserName
		inner join
		Shows as S
			on S.ShowId = B.ShowId
		inner join
		Theatre as TD
			on TD.TheatreId = S.TheatreId
	where B.BookingId = @BookingId
	
	return
end