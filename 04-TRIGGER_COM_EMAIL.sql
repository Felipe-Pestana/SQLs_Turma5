CREATE TRIGGER dbo.TriggerStudent
       ON dbo.Student
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE
		@CollegeID int,
		@MailBody nchar(70)

	SELECT @CollegeID= INSERTED.[College ID] FROM INSERTED

	SET @MailBody= 'A new student with the college ID '+ STR(@CollegeID)+ 'is added'

    	EXEC msdb.dbo.sp_send_dbmail
            @profile_name = 'Test_Profile'
           ,@recipients = 'recipient@gmail.com'
           ,@subject = 'Sending the Test Email'
           ,@body = @MailBody
END