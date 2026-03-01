-- Query 5: Advanced - RANK() OVER with PARTITION BY and CASE/WHEN
-- Rank each user's attended shows by rating and label the rating

SELECT User.username, Attendance.rating,
    CASE
        WHEN Attendance.rating = 5 THEN 'Excellent'
        WHEN Attendance.rating = 4 THEN 'Good'
        WHEN Attendance.rating = 3 THEN 'Average'
        ELSE 'Poor'
    END AS rating_label,
    RANK() OVER (PARTITION BY Attendance.user_id ORDER BY Attendance.rating DESC) AS user_rank
FROM Attendance
JOIN User ON Attendance.user_id = User.user_id;

