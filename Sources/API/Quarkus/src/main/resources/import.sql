-- INSERT INTO users(id, name,password) VALUES (nextval('hibernate_sequence'), 'Emre','Emre');
-- INSERT INTO users(id, name,password) VALUES (nextval('hibernate_sequence'), 'Arthur','Arthur');
-- INSERT INTO users(id, name,password) VALUES (nextval('hibernate_sequence'), 'Lucas','Lucas');
-- INSERT INTO users(id, name,password) VALUES (nextval('hibernate_sequence'), 'Louison','Louison');
-- INSERT INTO users (Id, Name, Password) VALUES (1, 'Alice', 'password1'),
-- (2, 'Bob', 'password2'),
-- (3, 'Charlie', 'password3');
-- INSERT INTO user_stats (user_id, nbVictories, nbGames) VALUES
-- (1, 2, 5),
-- (2, 3, 7),
-- (3, 1, 3);
-- INSERT INTO games (Id, host_id) VALUES
-- (1, 1),
-- (2, 2);
-- INSERT INTO participe (idGame, position, iduser, guestname, totalPoints) VALUES
-- (1, 1, 1, NULL, 0),
-- (1, 2, 2, NULL, 0),
-- (2, 1, 2, NULL, 0),
-- (2, 2, NULL, 'guest1', 0),
-- (2, 3, NULL, 'guest2', 0);
-- INSERT INTO round (game_id, PlayerPosition, TurnNumber, points) VALUES
-- (1, 1, 1, 10),
-- (1, 2, 1, 7),
-- (1, 1, 2, 9),
-- (1, 2, 2, 1),
-- (1, 1, 3, 3),
-- (1, 2, 3, 10),
-- (2, 1, 1, 9),
-- (2, 2, 1, 1),
-- (2, 1, 2, 8),
-- (2, 2, 2, 2),
-- (2, 3, 2, 0),
-- (2, 1, 3, 10),
-- (2, 2, 3, 10),
-- (2, 3, 3, 7);

-- INSERT INTO ThrowTable (Order, idGame, position, , pins) VALUES
-- (1, 1, 1, 10),
-- (1, 1, 2, 7),
-- (2, 1, 1, 9),
-- (2, 1, 2, 1),
-- (3, 1, 1, 3),
-- (3, 1, 2, 10),
-- (1, 2, 1, 9),
-- (1, 2, 2, 1),
-- (2, 2, 1, 8),
-- (2, 2, 2, 2),
-- (3, 2, 3, 0),
-- (3, 2, 1, 10),
-- (4, 2, 2, 10),
-- (4, 2, 3, 7);

INSERT INTO users (name, password) VALUES ('Alice', 'password123');
INSERT INTO users (name, Password) VALUES 
('Bob', 'password2'),
('Charlie', 'password3');
INSERT INTO games (isFinished, nbPoints, time, winner, host_id) VALUES (false, 0, CURRENT_TIMESTAMP, 0, 1);
INSERT INTO participe (idGame, position, guestname, totalpoints, iduser) VALUES (1, 1, 'Alice', 0, 1);
INSERT INTO round (game_id, idGame, position, turnNumber, points) VALUES (1, 1, 1, 1, 0);
INSERT INTO throwtable (OrderTrhow, game_id, idGame, position, turnNumber, pins) VALUES (1, 1, 1, 1, 1, 0);
INSERT INTO user_stats (user_id, avgPinsPerRound, avgScore, highscore, nbGames, nbSpares, nbStrikes, nbVictories) VALUES (1, 0, 0, 0, 0, 0, 0, 0);
