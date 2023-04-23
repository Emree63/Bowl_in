package org.acme.api.dto;

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
    public UserDto user;

    public ParticipeDto(Long idUser, UserDto user, Integer totalPoints, String guestName) {

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
