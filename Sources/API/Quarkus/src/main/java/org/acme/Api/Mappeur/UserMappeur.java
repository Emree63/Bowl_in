package org.acme.Api.Mappeur;

import org.acme.Api.DTO.UserDTO;
import org.acme.Api.DTO.UserTinyDTO;
import org.acme.Hibernates.entities.UserEntity;

public class UserMappeur {
    public static UserDTO toUserDto(UserEntity entity) {
        return new UserDTO(entity.id, entity.name, entity.stats.getNbVictories(), entity.stats.getNbGames(),
                entity.stats.getHighscore(), entity.stats.getNbStrikes(), entity.stats.getNbSpares(),
                entity.stats.getAvgScore(), entity.stats.getAvgPinsPerRound());
    }

    public static UserTinyDTO toUserTinyDTO(UserEntity entity) {
        return new UserTinyDTO(entity.id, entity.name);
    }
}
