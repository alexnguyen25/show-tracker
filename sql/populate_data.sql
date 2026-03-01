-- ShowTracker Test Data
-- populate_data.sql

PRAGMA foreign_keys = ON;

-- Clear existing data (in reverse dependency order)
DELETE FROM Setlist;
DELETE FROM Attendance;
DELETE FROM UserFollows;
DELETE FROM ShowArtist;
DELETE FROM Song;
DELETE FROM Show;
DELETE FROM User;
DELETE FROM Artist;
DELETE FROM Venue;
DELETE FROM sqlite_sequence;

-- 1. Venues
INSERT INTO Venue (name, city, state, capacity, genreTags) VALUES
    ('The Fillmore', 'San Francisco', 'CA', 1150, 'Rock, Indie, Pop'),
    ('Red Rocks Amphitheatre', 'Morrison', 'CO', 9525, 'Rock, Electronic, Country'),
    ('9:30 Club', 'Washington', 'DC', 1200, 'Indie, Punk, Hip-Hop'),
    ('Brooklyn Steel', 'New York', 'NY', 1800, 'Indie, Electronic, R&B'),
    ('The Ryman Auditorium', 'Nashville', 'TN', 2362, 'Country, Folk, Americana');

-- 2. Artists
INSERT INTO Artist (name, genre, biography) VALUES
    ('Phoebe Bridgers', 'Indie Folk', 'LA-based singer-songwriter known for her haunting melodies and confessional lyrics.'),
    ('Khruangbin', 'Psychedelic Soul', 'Houston trio blending global music influences with psychedelic grooves.'),
    ('Mitski', 'Indie Rock', 'Japanese-American artist known for emotionally intense songwriting and powerful live shows.'),
    ('Tyler, the Creator', 'Hip-Hop', 'LA rapper, producer, and creative director known for genre-defying albums.'),
    ('Hozier', 'Folk Rock', 'Irish singer-songwriter known for soulful blues-influenced folk rock.'),
    ('Japanese Breakfast', 'Indie Pop', 'Project of musician Michelle Zauner, known for deeply personal and genre-blending music.'),
    ('boygenius', 'Indie Folk', 'Supergroup consisting of Phoebe Bridgers, Julien Baker, and Lucy Dacus.'),
    ('Steve Lacy', 'R&B', 'Grammy-winning artist and producer known for his eclectic blend of R&B, funk, and rock.');

-- 3. Users
INSERT INTO User (username, email, password) VALUES
    ('concertking', 'alex@email.com', 'hashed_pw_1'),
    ('melodyhunter', 'sarah@email.com', 'hashed_pw_2'),
    ('setlistnerd', 'james@email.com', 'hashed_pw_3'),
    ('venuehopper', 'mia@email.com', 'hashed_pw_4'),
    ('indievibes', 'chris@email.com', 'hashed_pw_5'),
    ('folkfanatic', 'emma@email.com', 'hashed_pw_6'),
    ('basslineking', 'noah@email.com', 'hashed_pw_7'),
    ('showlogger', 'olivia@email.com', 'hashed_pw_8');

-- 4. Shows
INSERT INTO Show (date, ticketPrice, genre, venue_id) VALUES
    ('2024-03-15', 35.00, 'Indie Folk', 1),
    ('2024-04-20', 75.00, 'Psychedelic Soul', 2),
    ('2024-05-10', 30.00, 'Indie Rock', 3),
    ('2024-06-01', 55.00, 'Hip-Hop', 4),
    ('2024-07-04', 90.00, 'Folk Rock', 2),
    ('2024-08-18', 40.00, 'Indie Pop', 3),
    ('2024-09-22', 65.00, 'Indie Folk', 5),
    ('2024-10-31', 50.00, 'R&B', 4),
    ('2025-01-14', 45.00, 'Indie Rock', 1),
    ('2025-03-08', 80.00, 'Indie Folk', 2);

-- 5. Songs
INSERT INTO Song (title, artist_id) VALUES
    ('Motion Sickness', 1),
    ('Savior Complex', 1),
    ('Funeral', 1),
    ('Time (You and I)', 2),
    ('Connaissais de Face', 2),
    ('Nobody Speak', 2),
    ('Nobody', 3),
    ('Washing Machine Heart', 3),
    ('Liquid Smooth', 3),
    ('EARFQUAKE', 4),
    ('See You Again', 4),
    ('Too Good', 4),
    ('Take Me to Church', 5),
    ('From Eden', 5),
    ('Posing in Bondage', 6),
    ('Paprika', 6),
    ('Me & My Dog', 7),
    ('$20', 7),
    ('Bad Habit', 8),
    ('Mercury', 8);

-- 6. ShowArtist
INSERT INTO ShowArtist (show_id, artist_id) VALUES
    (1, 1),
    (1, 7),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (7, 1),
    (8, 8),
    (9, 3),
    (10, 1);

-- 7. UserFollows
INSERT INTO UserFollows (user_id, artist_id) VALUES
    (1, 1), (1, 7), (1, 3),
    (2, 5), (2, 6),
    (3, 2), (3, 8),
    (4, 4), (4, 8),
    (5, 1), (5, 6), (5, 7),
    (6, 5), (6, 1),
    (7, 2), (7, 4),
    (8, 3), (8, 6);

-- 8. Attendance
INSERT INTO Attendance (user_id, show_id, rating, review) VALUES
    (1, 1, 5, 'Phoebe was absolutely stunning. One of the best shows I have ever seen.'),
    (1, 7, 5, 'boygenius at the Ryman was a religious experience.'),
    (2, 5, 4, 'Hozier at Red Rocks was breathtaking. The venue makes everything better.'),
    (2, 6, 5, 'Japanese Breakfast put on an incredible show, Michelle is a force.'),
    (3, 2, 5, 'Khruangbin at Red Rocks was hypnotic. Perfect setlist.'),
    (3, 8, 4, 'Steve Lacy was great but the sound mix was a little off.'),
    (4, 4, 3, 'Tyler put on a good show but it felt a bit short.'),
    (4, 8, 5, 'Steve Lacy absolutely killed it at Brooklyn Steel.'),
    (5, 1, 5, 'Seeing Phoebe and boygenius on the same bill was surreal.'),
    (5, 9, 4, 'Mitski at the Fillmore was emotional and powerful.'),
    (6, 7, 5, 'boygenius at the Ryman was everything I hoped for.'),
    (6, 5, 4, 'Hozier never disappoints. Red Rocks is the perfect venue for him.'),
    (7, 2, 5, 'Khruangbin is even better live than on record.'),
    (7, 4, 4, 'Tyler delivered a high energy set, crowd was insane.'),
    (8, 3, 5, 'Mitski at the 9:30 Club was intimate and unforgettable.');

-- 9. Setlist
INSERT INTO Setlist (show_id, song_id, order_num) VALUES
    (1, 2, 1),
    (1, 1, 2),
    (1, 3, 3),
    (2, 4, 1),
    (2, 5, 2),
    (2, 6, 3),
    (3, 7, 1),
    (3, 8, 2),
    (3, 9, 3),
    (4, 10, 1),
    (4, 11, 2),
    (4, 12, 3),
    (5, 13, 1),
    (5, 14, 2),
    (6, 15, 1),
    (6, 16, 2),
    (7, 17, 1),
    (7, 18, 2),
    (8, 19, 1),
    (8, 20, 2);