-- Query 1: Join of 3+ tables
-- Shows each attendance record with the user's username, show date, and venue name

SELECT User.username, Show.date, Venue.name, Attendance.rating, Attendance.review
FROM Attendance
JOIN User ON Attendance.user_id = User.user_id
JOIN Show ON Attendance.show_id = Show.show_id
JOIN Venue ON Show.venue_id = Venue.venue_id;
