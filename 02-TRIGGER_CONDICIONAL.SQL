CREATE TRIGGER [dbo].[InsertSP]
ON [dbo].[Persons]
AFTER INSERT
AS
BEGIN
	DECLARE
		@FirstName nchar(10),
		@LastName nchar(10),
		@FullName nchar(30)
	
	SELECT @FirstName= INSERTED.[First Name],
		@LastName= INSERTED.[Last Name] FROM INSERTED
	
	SET @FullName= @FirstName+ @LastName

	IF EXISTS(SELECT * FROM dbo.Names WHERE [First Name]= @FirstName AND [Last Name]= @LastName)
	BEGIN
		PRINT('Record Already Exists in the Names Table')
	END
	ELSE
	BEGIN
		INSERT INTO dbo.Names([First Name], [Last Name], [Full Name])
		VALUES(@FirstName, @LastName, @FullName)
		PRINT('Record Inserted in the Names Table')
	END	
END