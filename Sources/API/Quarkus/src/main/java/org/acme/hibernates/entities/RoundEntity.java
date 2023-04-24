package org.acme.hibernates.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.*;

// @Entity
// public class RoundEntity {
// @Column(name = "first_throw")
// private int firstThrow;

// @Column(name = "second_throw")
// private int secondThrow;

// @Column(name = "points")
// private int points;

// @EmbeddedId
// // @ApiModelProperty(notes = "Composite primary key of the entity")
// private RoundId id;

// // @Id
// @Column(name = "turn_number")
// // @ApiModelProperty(notes = "The turn number in this Round")
// private int turnNumber;

// @ManyToOne
// @MapsId("gameid")
// // @ApiModelProperty(notes = "The Game entity that this Round belongs to")
// @JoinColumn(name = "game_id", referencedColumnName = "id", insertable =
// false, updatable = false)
// private GameEntity game;

// @ManyToOne
// @MapsId("playerPosition")
// @JoinColumns({
// @JoinColumn(name = "game_id", referencedColumnName = "id"),
// @JoinColumn(name = "player_position", referencedColumnName = "position")
// })
// // @ApiModelProperty(notes = "The Participe entity that represents the player
// in
// // this Round")
// private ParticipeEntity participant;

// public RoundEntity() {
// }

// public RoundEntity(RoundId roundId, ParticipeEntity participe, int
// turnNumber, int pinsFirstThrow,
// int pinsSecondThrow, int points) {
// this.id = roundId;
// this.participant = participe;
// this.turnNumber = turnNumber;
// this.firstThrow = pinsFirstThrow;
// this.secondThrow = pinsSecondThrow;
// this.points = points;
// }

// public int getFirstThrow() {
// return this.firstThrow;
// }

// public void setFirstThrow(int firstThrow) {
// this.secondThrow = firstThrow;
// }

// public int getturnNumber() {
// return this.turnNumber;
// }

// public void setturnNumber(int turnNumber) {
// this.turnNumber = turnNumber;
// }

// public int getSecondThrow() {
// return this.secondThrow;
// }

// public void setSecondThrow(int secondThrow) {
// this.secondThrow = secondThrow;
// }

// public int getPoints() {
// return this.points;
// }

// public void setPoints(int points) {
// this.points = points;
// }
// }

// @Entity
// @Table(name = "Round")
// @IdClass(RoundId.class)
// public class RoundEntity {

//     // @Id
//     // @ManyToOne
//     // @JoinColumn(name = "idGame", referencedColumnName = "id")
//     // @MapsId
//     // public GameEntity game;

//     // @Id
//     // @MapsId
//     // @ManyToOne
//     // @JoinColumns({
//     // @JoinColumn(name = "roundIdGame", referencedColumnName = "game"),
//     // @JoinColumn(name = "roundPlayerPosition", referencedColumnName = "position")
//     // })
//     // public ParticipeEntity playerPosition;

//     @Id
//     @ManyToOne
//     @JoinColumn(name = "idgame")
//     @MapsId
//     public GameEntity game;

//     @Id
//     @ManyToOne
//     @JoinColumn(name = "playerposition", referencedColumnName = "position")
//     @MapsId("participePosition")
//     public ParticipeEntity participe;

//     @Id
//     @Column(name = "turnNumber")
//     public Integer turnNumber;

//     @Column(name = "points")
//     public Integer points;

//     // @OneToMany(mappedBy = "round", cascade = CascadeType.ALL, orphanRemoval =
//     // true)
//     // public List<ThrowEntity> throwsGame = new ArrayList<>();

//     // constructors, getters and setters
// }
@Entity
@Table(name = "Round")
public class RoundEntity {

    @EmbeddedId
    public RoundId id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "game_id", referencedColumnName = "id", insertable = false, updatable = false)
    public GameEntity game;

    @ManyToOne
    @JoinColumns({
            @JoinColumn(name = "idGame", referencedColumnName = "idGame", insertable = false, updatable = false),
            @JoinColumn(name = "position", referencedColumnName = "position", insertable = false, updatable = false)
    })
    public ParticipeEntity participe;

    @Column(name = "points")
    public Integer points;

    @OneToMany(mappedBy = "round", cascade = CascadeType.ALL, orphanRemoval = true)
    public List<ThrowEntity> throwsGame = new ArrayList<>();

    public RoundEntity() {
        this.throwsGame.add(new ThrowEntity());
        this.throwsGame.add(new ThrowEntity());
    }

    public RoundEntity(GameEntity game, ParticipeEntity participe, Integer points, ThrowEntity throwEntity) {
        this.game = game;
        this.participe = participe;
        this.points = points;
        this.throwsGame.add(throwEntity);
    }

}