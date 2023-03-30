package org.acme.Hibernates.entities;

import java.io.Serializable;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

// import javax.persistence.*;
// import javax.persistence.Embeddable;
// import javax.persistence.ManyToOne;

// import org.eclipse.microprofile.openapi.annotations.media.Schema;

// @Embeddable
// public class ParticipeId implements Serializable {

// // @Column(name = "game_id")
// // private Long gameId;

// // @Column(name = "position")
// // private int position;
// @Id
// @ManyToOne
// @JoinColumn(name = "game_id", referencedColumnName = "id")
// @Schema(description = "The Game entity that this Participe belongs to")
// private GameEntity game;

// @Id
// @Schema(description = "The position of the player in the game")
// private int position;

// // public ParticipeId() {

// // }

// // public ParticipeId(Long gameId, int position) {
// // this.gameId = gameId;
// // this.position = position;
// // }

// public GameEntity getGame() {
// return game;
// }

// public void setGame(GameEntity game) {
// this.game = game;
// }

// public int getPosition() {
// return position;
// }

// public void setPosition(int position) {
// this.position = position;
// }

// @Override
// public boolean equals(Object o) {
// if (this == o)
// return true;
// if (o == null || getClass() != o.getClass())
// return false;
// ParticipeId that = (ParticipeId) o;
// return position == that.position && game.equals(that.game);
// }

// @Override
// public int hashCode() {
// return Objects.hash(game, position);
// }
// }
@Embeddable
public class ParticipeId implements Serializable {
    public static final long serialVersionUID = 1L;

    @Column(name = "idGame")
    public Long game;

    @Column(name = "position")
    public Integer position;

    public ParticipeId() {
    }

    public ParticipeId(Long game, Integer position) {
        this.game = game;
        this.position = position;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (!(o instanceof ParticipeId))
            return false;
        ParticipeId that = (ParticipeId) o;
        return Objects.equals(game, that.game) &&
                Objects.equals(position, that.position);
    }

    @Override
    public int hashCode() {
        return Objects.hash(game, position);
    }
}
