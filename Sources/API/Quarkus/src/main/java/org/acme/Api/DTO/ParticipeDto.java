package org.acme.Api.DTO;

import java.util.UUID;

import org.acme.Hibernates.entities.ParticipeEntity;
import org.acme.Hibernates.entities.ParticipeId;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

import io.quarkus.runtime.annotations.RegisterForReflection;

@RegisterForReflection
public class ParticipeDto {
    public Long idUser;

    @Schema(description = "Name of the guest")
    public String guestName;

    @Schema(description = "Total points of the player in the game")
    public int totalPoints;

    @Schema(description = "The User entity that this Participe belongs to")
    public UserDTO user;

    public ParticipeDto(Long idUser, UserDTO user, Integer totalPoints, String guestName) {

        this.idUser = idUser;
        this.guestName = guestName;
        this.totalPoints = totalPoints;
        this.user = user;

        // if (entity.getGame() != null) {
        // this.game = new GameDto(entity.getGame());
        // }

        // if (entity.getUser() != null) {
        // this.user = new UserDTO(entity.getUser());
        // }
    }

}
