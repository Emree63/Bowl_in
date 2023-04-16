package org.acme.Api.Mappeur;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.acme.Api.DTO.ParticipeDto;
import org.acme.Api.DTO.RoundDto;
import org.acme.Hibernates.entities.ParticipeEntity;
import org.acme.Hibernates.entities.RoundEntity;

public class Extensions {
    public static List<RoundDto> toRoundDtoList(List<RoundEntity> entities) {
        List<RoundDto> dtos = new ArrayList<>();
        for (RoundEntity entity : entities) {
            dtos.add(RoundMappeur.toDto(entity));
        }
        return dtos;
    }

    public static List<ParticipeDto> toParticipeDtoList(List<ParticipeEntity> entities) {
        List<ParticipeDto> dtos = new ArrayList<>();
        for (ParticipeEntity entity : entities) {
            dtos.add(ParticipeMappeur.toDto(entity));
        }
        return dtos;
    }

    public static LocalDate toLocalDate(Date date) {
        return date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }
}
