-- ShowTracker Database
-- create_tables.sql

PRAGMA foreign_keys = ON;

-- 1. User
CREATE TABLE User (
    user_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    username    TEXT NOT NULL UNIQUE,
    email       TEXT NOT NULL UNIQUE,
    password    TEXT NOT NULL
);

-- 2. Artist
CREATE TABLE Artist (
    artist_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT NOT NULL,
    genre       TEXT NOT NULL,
    biography   TEXT
);

-- 3. Venue
CREATE TABLE Venue (
    venue_id    INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT NOT NULL,
    city        TEXT NOT NULL,
    state       TEXT NOT NULL,
    capacity    INTEGER NOT NULL CHECK (capacity > 0),
    genreTags   TEXT
);

-- 4. Show
CREATE TABLE Show (
    show_id         INTEGER PRIMARY KEY AUTOINCREMENT,
    date            DATE NOT NULL,
    ticketPrice     DECIMAL(10,2) NOT NULL CHECK (ticketPrice >= 0),
    genre           TEXT NOT NULL,
    venue_id        INTEGER NOT NULL,
    FOREIGN KEY (venue_id) REFERENCES Venue(venue_id)
);

-- 5. Song
CREATE TABLE Song (
    song_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    title       TEXT NOT NULL,
    artist_id   INTEGER NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

-- 6. Attendance
CREATE TABLE Attendance (
    attendance_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id         INTEGER NOT NULL,
    show_id         INTEGER NOT NULL,
    rating          INTEGER CHECK (rating BETWEEN 1 AND 5),
    review          TEXT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (show_id) REFERENCES Show(show_id)
);

-- 7. Setlist
CREATE TABLE Setlist (
    setlist_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    show_id     INTEGER NOT NULL,
    song_id     INTEGER NOT NULL,
    order_num   INTEGER NOT NULL,
    FOREIGN KEY (show_id) REFERENCES Show(show_id),
    FOREIGN KEY (song_id) REFERENCES Song(song_id)
);

-- 8. ShowArtist (junction table: Show <-> Artist)
CREATE TABLE ShowArtist (
    show_id     INTEGER NOT NULL,
    artist_id   INTEGER NOT NULL,
    PRIMARY KEY (show_id, artist_id),
    FOREIGN KEY (show_id) REFERENCES Show(show_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

-- 9. UserFollows (junction table: User <-> Artist)
CREATE TABLE UserFollows (
    user_id     INTEGER NOT NULL,
    artist_id   INTEGER NOT NULL,
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);