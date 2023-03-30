package org.acme.Hibernates.entities;

import java.io.Serializable;

import javax.persistence.*;

import org.eclipse.microprofile.openapi.annotations.media.Schema;

// @Entity
// @Table(name = "participe")
// public class ParticipeEntity {
// // @EmbeddedId
// // @Schema(description = "Composite primary key of the entity")
// // private ParticipeId id;

// // @Id
// // @ManyToOne
// // @JoinColumn(name = "game_id", referencedColumnName = "id")
// // @Schema(description = "The Game entity that this Participe belongs to")
// // private GameEntity game;
// @Id
// @Schema(description = "The position of the player in the game")
// private int position2;
// @Id
// @Schema(description = "The position of the player in the game")
// private int position;

// @ManyToOne
// @JoinColumn(name = "id_user", referencedColumnName = "id")
// @Schema(description = "The User entity that this Participe belongs to")
// private UserEntity user;

// @Column(name = "guest_name")
// @Schema(description = "Name of the guest")
// private String guestName;

// @Column(name = "total_points")
// @Schema(description = "Total points of the player in the game")
// private int totalPoints;

// // @MapsId
// // @OneToOne
// // @JoinColumn(name = "user_id", referencedColumnName = "id", insertable =
// // false, updatable = false)
// // private UserEntity user;

// // public ParticipeId getId() {
// // return id;
// // }

// // public void setId(ParticipeId id) {
// // this.id = id;
// // }

// public String getGuestName() {
// return guestName;
// }

// public void setGuestName(String guestName) {
// this.guestName = guestName;
// }

// public int getTotalPoints() {
// return totalPoints;
// }

// public void setTotalPoints(int totalPoints) {
// this.totalPoints = totalPoints;
// }

// public UserEntity getUser() {
// return user;
// }

// public void setUser(UserEntity user) {
// this.user = user;
// }

// }
@Entity
@Table(name = "participe")
public class ParticipeEntity {

    @EmbeddedId
    public ParticipeId id;

    @ManyToOne
    @JoinColumn(name = "iduser", referencedColumnName = "id")
    public UserEntity user;
    /// luii
    @ManyToOne
    @JoinColumn(name = "idGame", referencedColumnName = "id", insertable = false, updatable = false)
    public GameEntity game;

    @Column(name = "guestname")
    public String guestName;

    @Column(name = "totalpoints")
    public Integer totalPoints;
}