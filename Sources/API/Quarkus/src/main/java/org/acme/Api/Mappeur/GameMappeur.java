package org.acme.Api.Mappeur;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.acme.Api.BowlDbContext;
import org.acme.Api.DTO.GameDto;
import org.acme.Api.DTO.UserTinyDTO;
import org.acme.Hibernates.entities.GameEntity;

public class GameMappeur {

    public static GameDto toDto(GameEntity entity, BowlDbContext dbContext) {
        GameDto dto = new GameDto();
        dto.id = entity.id;
        dto.players = Extensions.toParticipeDtoList(dbContext.participeRepository.findByGameId(entity.id));
        dto.date = Extensions.toLocalDate(entity.time);
        dto.hostID = entity.ownerGame.id;
        dto.winner = dbContext.userRepository.findByBowlinIdTiny(new Long(0));
        dto.rounds = Extensions.toRoundDtoList(dbContext.roundRepository.findByGameId(entity.id));
        return dto;
    }

    public static GameEntity toEntity(GameDto entity, BowlDbContext dbContext) {
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