package org.acme.Hibernates.entities;

import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
import java.io.Serializable;
import java.util.UUID;

@Entity
@Table(name="user_stats")
public class UserStatsEntity {
    @Id
    private Long id;
    @MapsId
    @OneToOne
    @JoinColumn (name = "user_id", referencedColumnName  = "id", insertable = false, updatable = false)
    private UserEntity user;
    @ColumnDefault("0")
    private Long nbVictories = 0L;
    @ColumnDefault("0")
    private Long nbGames = 0L;
    @ColumnDefault("0")
    private Long highscore = 0L;
    @ColumnDefault("0")
    private Long nbStrikes = 0L;
    @ColumnDefault("0")
    private Long nbSpares = 0L;
    @ColumnDefault("-1")
    private Double avgScore = 0d;
    @ColumnDefault("-1")
    private Double avgPinsPerRound = 0d;

    public UserStatsEntity() {
    }

    public UserStatsEntity(UserEntity user) {
        this.user = user;
    }
}
