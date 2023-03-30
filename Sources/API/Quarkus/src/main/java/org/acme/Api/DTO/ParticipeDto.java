package org.acme.Api.DTO;

import java.util.UUID;

import org.acme.Hibernates.entities.ParticipeEntity;
import org.acme.Hibernates.entities.ParticipeId;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

import io.quarkus.runtime.annotations.RegisterForReflection;

@RegisterForReflection
public class ParticipeDto {
    @Schema(description = "Composite primary key of the entity")
    public ParticipeId id;

    @Schema(description = "Position of the player in the game")
    public int position;

    public Long idUser;

    @Schema(description = "Name of the guest")
    public String guestName;

    @Schema(description = "Total points of the player in the game")
    public int totalPoints;

    @Schema(description = "The Game entity that this Participe belongs to")
    public GameDto game;

    @Schema(description = "The User entity that this Participe belongs to")
    public UserDTO user;

    public ParticipeDto() {
    }

    public ParticipeDto(ParticipeEntity entity) {
        this.id = entity.id;
        this.position = entity.id.position;
        this.idUser = entity.user.id;
        this.guestName = entity.guestName;
        this.totalPoints = entity.totalPoints;

        // if (entity.getGame() != null) {
        // this.game = new GameDto(entity.getGame());
        // }

        // if (entity.getUser() != null) {
        // this.user = new UserDTO(entity.getUser());
        // }
    }

}
