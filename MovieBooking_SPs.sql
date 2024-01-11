create procedure USP_BookTicket @UserId varchar(50), @ShowId int, @NumOfTickets int
as
begin
	declare @Tickets int, @UserName varchar(50), @Cost decimal(6, 2), @TotCost decimal(6, 2)
	begin try
		begin tran
			if not exists (select UserId  from Users where UserId = @UserId)
				return -1
			if not exists (select ShowId from Shows where ShowId = @ShowId)
				return -2
			select @Tickets = NumOfTicketsAvl from Shows where ShowId = @ShowId
			if @NumOfTickets <= 0
				return -3
			if @NumOfTickets > @Tickets
				return -4
			select @UserName = UserName from Users where UserId = @UserId
			select @Cost = Cost from Shows where ShowId = @ShowId
			set @TotCost = @Cost * @NumOfTickets
			insert into Booking (UserName, ShowId, TicketCount, Cost) values (@UserName, @ShowId, @NumOfTickets, @TotCost)
		commit tran
	end try
	begin catch
		rollback
		return -99
	end catch
end
go


alter procedure USP_BookTicket @UserId varchar(50), @ShowId int, @NumOfTickets int
as
begin
	declare @Tickets int, @UserName varchar(50), @Cost decimal(6, 2), @TotCost decimal(6, 2)
	begin try
		begin tran
			if not exists (select UserId  from Users where UserId = @UserId)
				return -1
			if not exists (select ShowId from Shows where ShowId = @ShowId)
				return -2
			select @Tickets = NumOfTicketsAvl from Shows where ShowId = @ShowId
			if @NumOfTickets <= 0
				return -3
			if @NumOfTickets > @Tickets
				return -4
			select @UserName = UserName from Users where UserId = @UserId
			select @Cost = Cost from Shows where ShowId = @ShowId
			set @TotCost = @Cost * @NumOfTickets
			insert into Booking (UserName, ShowId, TicketCount, Cost) values (@UserName, @ShowId, @NumOfTickets, @TotCost)
			update Shows set NumOfTicketsAvl = @Tickets - @NumOfTickets where ShowId = @ShowId
		commit tran
	end try
	begin catch
		rollback
		return -99
	end catch
end