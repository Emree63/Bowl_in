package org.acme.Hibernates.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.persistence.*;
@Entity
@Table(name="games")
public class GameEntity {

    @Id
    @GeneratedValue
    public Long id;

    @Column(length = 100)
    private String name;

    @Column(length = 100)
    private String password;

    private Date time;

    private UUID winner;

    private int nbPoints;

    private Boolean isFinished;

    // public List<Player> players = new ArrayList<Player>();

    // public List<Round> rounds = new ArrayList<Round>();

    // return name as uppercase in the model
    public String getName() {
        return name.toUpperCase();
    }

    // store all names in lowercase in the DB
    public void setName(String name) {
        this.name = name.toLowerCase();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password.toLowerCase();
    }

    public Date getDate() {
        return this.time;
    }

    // store all names in lowercase in the DB
    public void setDate(Date time) {
        this.time = time;
    }

    // store all names in lowercase in the DB
    public void setWinner(UUID winner) {
        this.winner = winner;
    }

    public UUID getWinner() {
        return this.winner;
    }

    // store all names in lowercase in the DB
    public void setNbPoints(int nbPoints) {
        this.nbPoints = nbPoints;
    }

    public int getNbPoints() {
        return this.nbPoints;
    }

    // store all names in lowercase in the DB
    public void setIsFinished(Boolean isFinished) {
        this.isFinished = isFinished;
    }

    public Boolean getIsFinished() {
        return this.isFinished;
    }

}
