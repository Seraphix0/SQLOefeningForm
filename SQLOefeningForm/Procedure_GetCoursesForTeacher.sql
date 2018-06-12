USE SQLOefeningLocalDb;  
GO  
CREATE PROCEDURE GetCoursesForTeacher
    @Name varchar(50),   
    @Surname varchar(50)   
AS   
    SELECT Title
    FROM COURSE  
    WHERE Title IN (
		SELECT COURSE 
		FROM COURSESUBJECTS
		WHERE SUBJECT IN (
			SELECT Title
			FROM SUBJECT
			WHERE Title IN (
				SELECT SUBJECT
				FROM SUBJECTTEACHERS
				WHERE TEACHER IN (
					SELECT Id
					FROM TEACHER
					WHERE Name = @Name AND Surname = @Surname
					))));
GO  

EXEC GetCoursesForTeacher N'Bart',N'Schreurs';
GO