package org.acme.Api.Mappeur;

import org.acme.Api.DTO.ParticipeDto;
import org.acme.Api.DTO.RoundDto;
import org.acme.Hibernates.entities.ParticipeEntity;

public class ParticipeMappeur {
    public static ParticipeDto toDto(ParticipeEntity entity) {
        return new ParticipeDto(entity.user.id, UserMappeur.toUserDto(entity.user), entity.totalPoints,
                entity.guestName);
    }

}
