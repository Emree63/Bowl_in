INSERT INTO
Users (name, password, image, mail) 
VALUES 
('david', '38762cf7f55934b34d179ae6a4c80cadccbb7f0a2c2a5b4c4a1cb595d8dadb31','','david.d_almeida@etu.uca.fr'),
('emre', 'af7c70f8789d9e0fde5b5f18b61c5e5dc5d5c5f5e7e5c4f4be7b2cb5d57ef52c','','emre.kartal@etu.uca.fr'),
('arthur', '0cc175b9c0f1b6a831c399e269772661','','arthur.valin@etu.uca.fr');

INSERT INTO userStats (userId, avgPinsPerRound, avgScore, highscore, nbGames, nbSpares, nbStrikes, nbVictories) VALUES (1, -1, -1, 0, 0, 0, 0, 0);
INSERT INTO userStats (userId, avgPinsPerRound, avgScore, highscore, nbGames, nbSpares, nbStrikes, nbVictories) VALUES (2, -1, -1, 0, 0, 0, 0, 0);
INSERT INTO userStats (userId, avgPinsPerRound, avgScore, highscore, nbGames, nbSpares, nbStrikes, nbVictories) VALUES (3, -1, -1, 0, 0, 0, 0, 0);

/*INSERT INTO games (isFinished, nbPoints, time, winner, host_id) VALUES (false, 0, CURRENT_TIMESTAMP, 0, 1);
INSERT INTO participe (idGame, position, guestname, totalpoints, iduser) VALUES (1, 1, 'Alice', 0, 1);
INSERT INTO round (game_id, idGame, position, turnNumber, points) VALUES (1, 1, 1, 1, 0);
INSERT INTO throwtable (OrderTrhow, game_id, idGame, position, turnNumber, pins) VALUES (1, 1, 1, 1, 1, 0);
INSERT INTO user_stats (user_id, avgPinsPerRound, avgScore, highscore, nbGames, nbSpares, nbStrikes, nbVictories) VALUES (1, 0, 0, 0, 0, 0, 0, 0);*/
