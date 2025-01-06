-- This creates the users table
CREATE TABLE "users" (
    "id" INTEGER PRIMARY KEY,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    "email" TEXT UNIQUE,
    "registration_date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "type" TEXT CHECK("type" IN ('regular', 'guest')) DEFAULT 'regular'

);

-- This creates the players table
CREATE TABLE "players" (
    "id" INTEGER PRIMARY KEY,
    "user_id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    FOREIGN KEY ("user_id") REFERENCES "users"("id")
);

-- This creates the games table
CREATE TABLE "games" (
    "id" INTEGER PRIMARY KEY,
    "player1_id" INTEGER,
    "player2_id" INTEGER,
    "moves" TEXT NOT NULL,
    "result" TEXT CHECK (result IN ('win', 'loss', 'draw')),
    "date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("player1_id") REFERENCES "players"("id"),
    FOREIGN KEY ("player2_id") REFERENCES "players"("id")
);

-- This creates the tournaments table
CREATE TABLE "tournaments" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "start_date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "end_date" DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- This creates the tournament_participants table
CREATE TABLE "tournament_participants" (
    "id" INTEGER PRIMARY KEY,
    "tournament_id" INTEGER,
    "player_id" INTEGER,
    FOREIGN KEY ("tournament_id") REFERENCES "tournaments"("id"),
    FOREIGN KEY ("player_id") REFERENCES "players"("id")
);

-- This creates the statistics table
CREATE TABLE "statistics" (
    "player_id" INTEGER PRIMARY KEY,
    "games" INTEGER NOT NULL,
    "wins" INTEGER NOT NULL,
    "losses" INTEGER NOT NULL,
    "draws" INTEGER NOT NULL,
    FOREIGN KEY ("player_id") REFERENCES "players"("id")
);

--This creates indexes to speed common queries
CREATE INDEX games_player1 ON "games"("player1_id");

CREATE INDEX games_player2 ON "games"("player2_id");

CREATE INDEX tournament_partipants ON "tournaments_partipants"("tournament_id", "player_id");

CREATE INDEX statistics ON "statistics" ("player_id");

--This creates a view
CREATE VIEW "most_games" AS
SELECT
    "first_name",
    "last_name",
    COUNT("games") AS "total_games"
FROM
    "players"
    JOIN "statistics" ON "players"."id" = "statistics"."player_id"
GROUP BY
    "first_name",
    "last_name"
ORDER BY
    "total_games" DESC
LIMIT
    1;
