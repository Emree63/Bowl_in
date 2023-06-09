package org.acme.Api.Mappeur;

import java.util.List;

import org.acme.Api.DTO.RoundDto;
import org.acme.Hibernates.entities.RoundEntity;
import org.acme.Hibernates.entities.ThrowEntity;

public class RoundMappeur {

    public static RoundDto toDto(RoundEntity entity) {
        List<ThrowEntity> throwsGame = entity.throwsGame;
        int val1 = 0;
        int val2 = 0;

        if (throwsGame.size() > 0) {
            val1 = throwsGame.get(0).pins;
        }
        if (throwsGame.size() > 1) {
            val1 = throwsGame.get(1).pins;
        }

        return new RoundDto(entity.participe.id.position, 0, val1, val2, entity.points);
    }
}
