package org.acme.api.mapper;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.acme.api.dto.ParticipeDTO;
import org.acme.api.dto.RoundDTO;
import org.acme.hibernates.entities.ParticipeEntity;
import org.acme.hibernates.entities.RoundEntity;

import io.smallrye.mutiny.Uni;

public class Extensions {
    public static Uni<List<RoundDTO>> toRoundDtoList(Uni<List<RoundEntity>> uni) {
        return uni.map(roundEntities -> roundEntities.stream()
                .map(RoundMapper::toDto)
                .collect(Collectors.toList()));
    }

    public static Uni<List<ParticipeDTO>> toParticipeDtoList(Uni<List<ParticipeEntity>> uni) {
        return uni
                .onItem().transformToUni(participes -> {
                    List<ParticipeDTO> dtos = new ArrayList<>();
                    for (ParticipeEntity entity : participes) {
                        dtos.add(ParticipeMapper.toDto(entity));
                    }
                    return Uni.createFrom().item(dtos);
                })
                .onFailure().invoke(throwable -> {
                    // Log the error or perform any other error handling here
                    throwable.printStackTrace();
                });
    }

    public static LocalDate toLocalDate(Date date) {
        return date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }
}
