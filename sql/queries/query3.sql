-- Query 3: GROUP BY with HAVING
-- Find artists with an average attendance rating above 4

SELECT Artist.name, AVG(Attendance.rating) AS avg_rating
FROM Attendance
JOIN Show ON Attendance.show_id = Show.show_id
JOIN ShowArtist ON Show.show_id = ShowArtist.show_id
JOIN Artist ON ShowArtist.artist_id = Artist.artist_id
GROUP BY Artist.name
HAVING AVG(Attendance.rating) > 4;

