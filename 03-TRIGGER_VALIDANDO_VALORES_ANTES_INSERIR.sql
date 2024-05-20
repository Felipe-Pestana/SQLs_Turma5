CREATE TRIGGER TriggerEmployeeDetails
ON dbo.EmployeeDetails
INSTEAD OF INSERT
AS
BEGIN
	DECLARE
		@EmpID int,
		@EmpName nchar(20),
		@EmpDep nchar(20)

	SELECT 	@EmpID= INSERTED.[Employee ID],
		@EmpName= INSERTED.[Employee Name],
		@EmpDep= INSERTED.[Employee Department]
     		   FROM INSERTED

		IF EXISTS(SELECT * FROM dbo.EmployeeDetails
				  WHERE [Employee ID]= @EmpID)
			PRINT('Record is already in the table')

		ELSE
			INSERT INTO dbo.EmployeeDetails(
				[Employee ID], [Employee Name], [Employee Department])
			VALUES(@EmpID, @EmpName, @EmpDep)
END