package org.acme.Api.service;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;

import org.acme.Api.DTO.ParticipeDto;
import org.acme.Hibernates.entities.ParticipeEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;
import io.quarkus.hibernate.orm.panache.PanacheRepository;
import io.smallrye.mutiny.Uni;

@ApplicationScoped
public class ParticipeRepository implements PanacheRepository<ParticipeEntity> {
    public List<ParticipeEntity> findByGameId(Long gameId) {
        return list("game.id", gameId);
    }

    public List<ParticipeDto> findByGameIdQ(Long gameId) {
        PanacheQuery<ParticipeDto> query = find("game.id", gameId).project(ParticipeDto.class);
        return query.list();
    }
}
