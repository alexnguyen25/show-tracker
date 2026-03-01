-- Query 2: Subquery
-- Find all users who have attended at least one show

SELECT User.username
FROM User
WHERE User.user_id IN (
    SELECT DISTINCT Attendance.user_id FROM Attendance
);
