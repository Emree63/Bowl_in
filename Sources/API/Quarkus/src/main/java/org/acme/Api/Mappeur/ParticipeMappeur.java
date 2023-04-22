package org.acme.api.mappeur;

import org.acme.api.dto.ParticipeDto;
import org.acme.hibernates.entities.ParticipeEntity;

public class ParticipeMappeur {
    public static ParticipeDto toDto(ParticipeEntity entity) {
        return new ParticipeDto(entity.user.id, UserMappeur.toUserDto(entity.user), entity.totalPoints,
                entity.guestName);
    }

}
