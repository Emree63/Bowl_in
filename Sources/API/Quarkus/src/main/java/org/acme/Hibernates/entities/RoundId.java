package org.acme.hibernates.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.*;

// @Embeddable
// public class RoundId implements Serializable {
// @Column(name = "game_id")
// private Long gameId;

// @Column(name = "player_position")
// private int playerPosition;

// @Column(name = "turn_number")
// private int turnNumber;

// public RoundId() {
// }

// public RoundId(Long gameId, int playerPosition, int turnNumber) {
// this.gameId = gameId;
// this.playerPosition = playerPosition;
// this.turnNumber = turnNumber;
// }

// public Long getGameId() {
// return gameId;
// }

// public void setGameId(Long gameId) {
// this.gameId = gameId;
// }

// public int getPlayerPosition() {
// return playerPosition;
// }

// public void setPlayerPosition(int playerPosition) {
// this.playerPosition = playerPosition;
// }

// public int getTurnNumber() {
// return turnNumber;
// }

// public void setTurnNumber(int turnNumber) {
// this.turnNumber = turnNumber;
// }

// @Override
// public boolean equals(Object o) {
// if (this == o)
// return true;
// if (o == null || getClass() != o.getClass())
// return false;
// RoundId roundID = (RoundId) o;
// return playerPosition == roundID.playerPosition && turnNumber ==
// roundID.turnNumber
// && Objects.equals(gameId, roundID.gameId);
// }

// @Override
// public int hashCode() {
// return Objects.hash(gameId, playerPosition, turnNumber);
// }
// }

// public class RoundId implements Serializable {

//     // @ManyToOne
//     // @JoinColumn(name = "IdGame")
//     public Long game;

//     public Integer participe;

//     public Integer turnNumber;

//     public RoundId() {
//     }

//     public RoundId(GameEntity game, ParticipeEntity participePosition, Integer turnNumber) {
//         this.game = game.id;
//         this.participe = participePosition.position;
//         this.turnNumber = turnNumber;
//     }

//     public RoundId(Long game, Integer participePosition, Integer turnNumber) {
//         this.game = game;
//         this.participe = participePosition;
//         this.turnNumber = turnNumber;
//     }

//     @Override
//     public boolean equals(Object o) {
//         if (this == o)
//             return true;
//         if (!(o instanceof RoundId))
//             return false;
//         RoundId that = (RoundId) o;
//         return Objects.equals(game, that.game) &&
//                 Objects.equals(participe, that.participe) &&
//                 Objects.equals(turnNumber, that.turnNumber);
//     }

//     @Override
//     public int hashCode() {
//         return Objects.hash(game, participe, turnNumber);
//     }
// }
// public class RoundId implements Serializable {

//     public static final long serialVersionUID = 1L;

//     public Long game;

//     public ParticipeId participe;

//     public Integer turnNumber;

//     public RoundId() {
//     }

//     public RoundId(Long gameId, ParticipeId participeId, Integer turnNumber) {
//         this.game = gameId;
//         this.participe = participeId;
//         this.turnNumber = turnNumber;
//     }

//     @Override
//     public boolean equals(Object o) {
//         if (this == o)
//             return true;
//         if (!(o instanceof RoundId))
//             return false;
//         RoundId that = (RoundId) o;
//         return Objects.equals(game, that.game) &&
//                 Objects.equals(participe, that.participe) &&
//                 Objects.equals(turnNumber, that.turnNumber);
//     }

//     @Override
//     public int hashCode() {
//         return Objects.hash(game, participe, turnNumber);
//     }
// }

@Embeddable
public class RoundId implements Serializable {

    public static final long serialVersionUID = 1L;

    @Column(name = "game_id")
    public Long game;

    @Embedded
    @Column(name = "participe")
    public ParticipeId participe;

    @Column(name = "turnNumber")
    public Integer turnNumber;

    public RoundId() {
    }

    public RoundId(Integer turnNumber, ParticipeId participeId) {
        this.turnNumber = turnNumber;
        this.participe = participeId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (!(o instanceof RoundId))
            return false;
        RoundId that = (RoundId) o;
        return Objects.equals(game, that.game) &&
                Objects.equals(participe, that.participe) &&
                Objects.equals(turnNumber, that.turnNumber);
    }

    @Override
    public int hashCode() {
        return Objects.hash(game, participe, turnNumber);
    }

}