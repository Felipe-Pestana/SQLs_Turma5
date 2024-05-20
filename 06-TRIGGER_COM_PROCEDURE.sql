CREATE PROCEDURE [dbo].[InsertIntoNames] @FName nchar(10), @LName nchar(10), @FullName nchar(30)
AS
BEGIN
	INSERT INTO dbo.Names([First Name], [Last Name], [Full Name])
	VALUES(@FName, @LName, @FullName)
END




CREATE TRIGGER InsertSP
	ON dbo.Persons
AFTER INSERT
AS
BEGIN
	DECLARE
		@FirstName nchar(10),
		@LastName nchar(10),
		@FullName nchar(30)
	
	SELECT 	@FirstName= INSERTED.[First Name],
		@LastName= INSERTED.[Last Name] FROM INSERTED

	SET @FullName= @FirstName + @LastName

	EXEC dbo.InsertIntoNames @Firstname, @LastName, @FullName
END
