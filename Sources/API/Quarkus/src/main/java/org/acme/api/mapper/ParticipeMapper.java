package org.acme.api.mapper;

import org.acme.api.dto.ParticipeDTO;
import org.acme.hibernates.entities.ParticipeEntity;

public class ParticipeMapper {
    public static ParticipeDTO toDto(ParticipeEntity entity) {
        return new ParticipeDTO(entity.user.id, UserMapper.toDto(entity.user), entity.totalPoints,
                entity.guestName);
    }

}
