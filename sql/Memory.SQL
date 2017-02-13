CREATE TABLE IF NOT EXISTS member (
    id           INTEGER NOT NULL PRIMARY KEY,
    name         VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS sessions (
    id           CHAR(72) PRIMARY KEY,
    session_data TEXT
);

CREATE TABLE IF NOT EXISTS game (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    type varchar(255) not null,
    data varchar(255) not null
);
