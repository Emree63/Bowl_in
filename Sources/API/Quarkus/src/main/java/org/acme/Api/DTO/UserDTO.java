package org.acme.Api.DTO;

import io.quarkus.hibernate.orm.panache.common.ProjectedFieldName;
import io.quarkus.runtime.annotations.RegisterForReflection;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

@RegisterForReflection
@Schema(description = "A DTO for transferring user details")
public class UserDTO {
    public Long id;
    public String name;
    public UserStatsDTO stats;

    public UserDTO(Long id, String name,
            @ProjectedFieldName("stats.nbVictories") Long nbVictories,
            @ProjectedFieldName("stats.nbGames") Long nbGames,
            @ProjectedFieldName("stats.highscore") Long highscore,
            @ProjectedFieldName("stats.nbStrikes") Long nbStrikes,
            @ProjectedFieldName("stats.nbSpares") Long nbSpares,
            @ProjectedFieldName("stats.avgScore") Double avgScore,
            @ProjectedFieldName("stats.avgPinsPerRound") Double avgPinsPerRound) {
        this.id = id;
        this.name = name;
        this.stats = new UserStatsDTO(nbVictories, nbGames, highscore, nbStrikes, nbSpares, avgScore, avgPinsPerRound);
    }
}