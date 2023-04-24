package org.acme.hibernates.entities;

import java.io.Serializable;

import javax.persistence.*;

import org.eclipse.microprofile.openapi.annotations.media.Schema;
import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name = "participe")
public class ParticipeEntity {

    @EmbeddedId
    public ParticipeId id;

    @ManyToOne
    @JoinColumn(name = "idUser", referencedColumnName = "id")
    public UserEntity user;
   
    @ManyToOne
    @JoinColumn(name = "idGame", referencedColumnName = "id", insertable = false, updatable = false)
    public GameEntity game;

    @Column(name = "guestName")
    public String guestName;

    @ColumnDefault("0")
    @Column(name = "totalPoints")
    public Integer totalPoints = 0;

    public ParticipeEntity() {
    }

    public ParticipeEntity(ParticipeId id, UserEntity user, GameEntity game, String guestName, Integer totalPoints) {
        this.id = id;
        this.user = user;
        this.game = game;
        this.guestName = guestName;
        this.totalPoints = totalPoints;
    }

}