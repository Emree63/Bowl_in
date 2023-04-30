package org.acme.api.mapper;

import org.acme.api.BowlDbContext;
import org.acme.api.dto.GameDTO;
import org.acme.hibernates.entities.GameEntity;

public class GameMapper {

    public static GameDTO toDto(GameEntity entity, BowlDbContext dbContext) {
        GameDTO dto = new GameDTO();
        dto.id = entity.id;
        dto.players = dbContext.participeRepository.findByGameIdQ(entity.id);
        dto.date = Extensions.toLocalDate(entity.time);
        dto.hostID = entity.ownerGame.id;

        return dto;
    }

    public static GameEntity toEntity(GameDTO entity, BowlDbContext dbContext) {
        GameEntity game = new GameEntity();

        return game;
    }

}
// GameDto gameDto = new GameDto();
// gameDto.id = gameEntity.id;
// gameDto.date =
// gameEntity.time.toInstant().atZone(ZoneOffset.UTC).toLocalDate();
// gameDto.hostID = gameEntity.ownerGame.id;
// gameDto.winner = (UserTinyDTO) userRepository.findById(gameEntity.winner).
// .map(user -> {
// return new UserTinyDTO(user.id, user.name);
// });
// gameDto.rounds = gameEntity.rounds.stream().map(round -> new
// RoundDto(round.id.participe.position,round., round.score))
// .collect(Collectors.toList());
// //
// roundRepository.findByGameId(gameEntity.id).list().onItem().transform(rounds
// // -> {
// // return rounds.stream().map(round -> new RoundDto(round.player.id,
// // round.score))
// // .collect(Collectors.toList());
// // })
// gameDto.points = gameEntity.points.entrySet().stream()
// .collect(Collectors.toMap(entry -> new UserDTO(entry.getKey()),
// Map.Entry::getValue));
// return gameDto;