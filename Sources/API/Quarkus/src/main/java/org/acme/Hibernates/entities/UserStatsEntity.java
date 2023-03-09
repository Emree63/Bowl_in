package org.acme.Hibernates.entities;

import org.eclipse.microprofile.openapi.annotations.media.Schema;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
import java.io.Serializable;
import java.util.UUID;

@Entity
@Schema(description = "The entity describing all the stats of a user")
@Table(name="user_stats")
public class UserStatsEntity {
    @Id
    @Schema(description = "The ID of the user")
    private Long id;
    @MapsId
    @OneToOne
    @JoinColumn (name = "user_id", referencedColumnName  = "id", insertable = false, updatable = false)
    private UserEntity user;
    @ColumnDefault("0")
    @Schema(description = "The total number of victories")
    private Long nbVictories = 0L;
    @ColumnDefault("0")
    @Schema(description = "The total number of game played")
    private Long nbGames = 0L;
    @ColumnDefault("0")
    @Schema(description = "The best score of the user")
    private Long highscore = 0L;
    @ColumnDefault("0")
    @Schema(description = "The total number of strikes made by the user")
    private Long nbStrikes = 0L;
    @ColumnDefault("0")
    @Schema(description = "The total number of spares made by the user")
    private Long nbSpares = 0L;
    @ColumnDefault("-1")
    @Schema(description = "The average score of the user")
    private Double avgScore = 0d;
    @ColumnDefault("-1")
    @Schema(description = "The average number of pins knocked down in a single round by the user")
    private Double avgPinsPerRound = 0d;

    public UserStatsEntity() {
    }

    public UserStatsEntity(UserEntity user) {
        this.user = user;
    }
}
