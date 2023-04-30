package org.acme.api.dto;

import io.quarkus.runtime.annotations.RegisterForReflection;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

@RegisterForReflection
@Schema(description = "A DTO describing the stats of a User")
public class UserStatsDTO {
    public Long nbVictories;
    public Long nbGames;
    public Long highscore;
    public Long nbStrikes;
    public Long nbSpares;
    public Double avgScore;
    public Double avgPinsPerRound;

    public UserStatsDTO(Long nbVictories, Long nbGames, Long highscore, Long nbStrikes, Long nbSpares, Double avgScore,
                        Double avgPinsPerRound) {
        this.nbVictories = nbVictories;
        this.nbGames = nbGames;
        this.highscore = highscore;
        this.nbStrikes = nbStrikes;
        this.nbSpares = nbSpares;
        this.avgScore = avgScore;
        this.avgPinsPerRound = avgPinsPerRound;
    }

}