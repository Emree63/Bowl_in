package org.acme.Api.Mappeur;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.acme.Api.DTO.ParticipeDto;
import org.acme.Api.DTO.RoundDto;
import org.acme.Hibernates.entities.ParticipeEntity;
import org.acme.Hibernates.entities.RoundEntity;

import io.smallrye.mutiny.Uni;

public class Extensions {
    public static Uni<List<RoundDto>> toRoundDtoList(Uni<List<RoundEntity>> uni) {
        return uni.map(roundEntities -> roundEntities.stream()
                .map(RoundMappeur::toDto)
                .collect(Collectors.toList()));
    }

    public static Uni<List<ParticipeDto>> toParticipeDtoList(Uni<List<ParticipeEntity>> uni) {
        return uni
                .onItem().transformToUni(participes -> {
                    List<ParticipeDto> dtos = new ArrayList<>();
                    for (ParticipeEntity entity : participes) {
                        dtos.add(ParticipeMappeur.toDto(entity));
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
