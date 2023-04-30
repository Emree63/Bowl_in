package org.acme.api.mapper;

import org.acme.api.dto.UserStatsDTO;
import org.acme.hibernates.entities.UserStatsEntity;

public class UserStatsMapper {

    public static UserStatsDTO toDto(UserStatsEntity stats) {
        return new UserStatsDTO(stats.getNbVictories(),stats.getNbGames(), stats.getHighscore(), stats.getNbStrikes(), stats.getNbSpares(), stats.getAvgScore(), stats.getAvgPinsPerRound());
    }

}
