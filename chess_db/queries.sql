--This inserts  data for users
INSERT INTO "users" ("id", "username", "password" , "email", "registration_date" , "type")
VALUES
(1, 'atinad6', 'bbb9347924614d04c58a8ddba06828c0', 'ati@gmail.com', '2023-11-01', 'regular'),
(2, 'arnads_1', '9cc07dec074c169d4946eb9d326be970', 'ardie@gmail.com', '2024-16-01', 'regular'),
(3, 'freddiy9', 'Ecc07dec074c169d4946eb9d326be970', 'freddi7@gmail.com', '2024-16-01', 'guest');

--This inserts  data for players
INSERT INTO "players" ("user_id" , "first_name" , "last_name", "country", "rating")
VALUES
(1, 'Atinad', 'Hugo' , 'USA', 1500),
(2, 'Ardnas', 'Mala' , 'Italy', 1300);

--This inserts data for games
INSERT INTO "games" ("player1_id" , "player2_id" , "moves" , "result" , "date")
VALUES
(1, 2, 'e4 e5 Nf3 Nc6', 'win', '2024-11-10'),
(2, 1, 'd4 d5 c4 c6', 'draw', '2024-11-12');

--  This inserts data statistics
INSERT INTO "statistics" ("player_id", "games", "wins", "losses", "draws")
VALUES
  (1, 10, 6, 3, 1),
  (2, 8, 4, 4, 0);


--Find player with highest rating
SELECT "id", "first_name", "last_name" FROM "players"
ORDER BY "rating" DESC
LIMIT 1;

--Find player with most games
SELECT "first_name" , "last_name" , COUNT("games") AS "total_games" FROM "players"
JOIN "statistics" ON "players"."id" = "statistics"."player_id"
GROUP BY "first_name" , "last_name"
ORDER BY "total_games" DESC
LIMIT 1;

--Find all guest users
SELECT "id" FROM "users"
 WHERE "type" = 'guest';
