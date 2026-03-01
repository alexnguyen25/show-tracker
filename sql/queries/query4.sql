--- Query 4: Complex search criterion (more than one expression with logical connectors).
-- Find shows that are either Indie Folk or Folk Rock, cost less than $70, and have at least one attendance record

SELECT Show.show_id, Show.date, Show.genre, Show.ticketPrice, Venue.name
FROM Show
JOIN Venue ON Show.venue_id = Venue.venue_id
WHERE (Show.genre = 'Indie Folk' OR Show.genre = 'Folk Rock')
AND Show.ticketPrice < 70
AND Show.show_id IN (SELECT DISTINCT Attendance.show_id FROM Attendance);
