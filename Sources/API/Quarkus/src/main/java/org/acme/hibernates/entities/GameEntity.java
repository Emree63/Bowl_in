package org.acme.hibernates.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name = "games")
public class GameEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    @ColumnDefault("CURRENT_TIMESTAMP")
    public Date time = new Date();
    @ColumnDefault("0")
    public Long winner = 0L;
    @ColumnDefault("0")
    public int nbPoints = 0;
    @ColumnDefault("false")
    public Boolean isFinished = false;
    @ManyToOne
    @JoinColumn(name = "host_id", referencedColumnName = "id")
    public UserEntity ownerGame;

    public GameEntity() {
    }

    public GameEntity(UserEntity user, List<ParticipeEntity> players, List<RoundEntity> rounds, Date time, Long winner,
                      int nbPoints, Boolean isFinished) {
        this.ownerGame = user;
        this.time = time;
        this.winner = winner;
        this.nbPoints = nbPoints;
        this.isFinished = isFinished;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDate() {
        return this.time;
    }

    public void setDate(Date time) {
        this.time = time;
    }

    public void setWinner(Long winner) {
        this.winner = winner;
    }

    public Long getWinner() {
        return this.winner;
    }

    public void setNbPoints(int nbPoints) {
        this.nbPoints = nbPoints;
    }

    public int getNbPoints() {
        return this.nbPoints;
    }

    public void setIsFinished(Boolean isFinished) {
        this.isFinished = isFinished;
    }

    public Boolean getIsFinished() {
        return this.isFinished;
    }

}
