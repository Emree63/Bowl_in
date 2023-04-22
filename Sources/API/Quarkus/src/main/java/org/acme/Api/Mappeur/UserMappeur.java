package org.acme.api.mappeur;

import org.acme.api.dto.UserDTO;
import org.acme.api.dto.UserTinyDTO;
import org.acme.hibernates.entities.UserEntity;

public class UserMappeur {
    public static UserDTO toUserDto(UserEntity entity) {
        /*return new UserDTO(entity.id, entity.name, entity.stats.getNbVictories(), entity.stats.getNbGames(),
                entity.stats.getHighscore(), entity.stats.getNbStrikes(), entity.stats.getNbSpares(),
                entity.stats.getAvgScore(), entity.stats.getAvgPinsPerRound());*/
        return new UserDTO((long)2, "f","fd","fd");
    }

    public static UserTinyDTO toUserTinyDTO(UserEntity entity) {
        return new UserTinyDTO(entity.id, entity.getName());
    }
}
