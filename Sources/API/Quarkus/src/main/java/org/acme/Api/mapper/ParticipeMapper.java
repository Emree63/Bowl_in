package org.acme.api.mapper;

import org.acme.api.dto.ParticipeDto;
import org.acme.hibernates.entities.ParticipeEntity;

public class ParticipeMapper {
    public static ParticipeDto toDto(ParticipeEntity entity) {
        return new ParticipeDto(entity.user.id, UserMapper.toDto(entity.user), entity.totalPoints,
                entity.guestName);
    }

}
