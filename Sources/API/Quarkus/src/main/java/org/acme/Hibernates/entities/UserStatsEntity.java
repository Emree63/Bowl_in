package org.acme.Hibernates.entities;

import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
import java.io.Serializable;
import java.util.UUID;

@Entity
@Table(name = "UserStats")
public class UserStatsEntity {
    @Id
    private Long id;
    @MapsId
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userId", referencedColumnName = "id", insertable = false, updatable = false)
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
    private double avgScore = -1;
    @ColumnDefault("-1")
    private double avgPinsPerRound = -1;

    public UserStatsEntity() {
    }

    public UserStatsEntity(UserEntity user) {
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public Long getNbVictories() {
        return nbVictories;
    }

    public void setNbVictories(Long nbVictories) {
        this.nbVictories = nbVictories;
    }

    public Long getNbGames() {
        return nbGames;
    }

    public void setNbGames(Long nbGames) {
        this.nbGames = nbGames;
    }

    public Long getHighscore() {
        return highscore;
    }

    public void setHighscore(Long highscore) {
        this.highscore = highscore;
    }

    public Long getNbStrikes() {
        return nbStrikes;
    }

    public void setNbStrikes(Long nbStrikes) {
        this.nbStrikes = nbStrikes;
    }

    public Long getNbSpares() {
        return nbSpares;
    }

    public void setNbSpares(Long nbSpares) {
        this.nbSpares = nbSpares;
    }

    public double getAvgScore() {
        return avgScore;
    }

    public void setAvgScore(double avgScore) {
        this.avgScore = avgScore;
    }

    public double getAvgPinsPerRound() {
        return avgPinsPerRound;
    }

    public void setAvgPinsPerRound(double avgPinsPerRound) {
        this.avgPinsPerRound = avgPinsPerRound;
    }
}
