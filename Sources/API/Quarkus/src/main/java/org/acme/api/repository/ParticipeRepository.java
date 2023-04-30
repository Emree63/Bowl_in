package org.acme.api.repository;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;

import org.acme.api.dto.ParticipeDTO;
import org.acme.hibernates.entities.ParticipeEntity;

import io.quarkus.hibernate.reactive.panache.PanacheQuery;
import io.quarkus.hibernate.reactive.panache.PanacheRepository;
import io.smallrye.mutiny.Uni;

@ApplicationScoped
public class ParticipeRepository implements PanacheRepository<ParticipeEntity> {
    public Uni<List<ParticipeEntity>> findByGameId(Long gameId) {
        return list("game.id", gameId);
    }

    public Uni<List<ParticipeDTO>> findByGameIdQ(Long gameId) {
        PanacheQuery<ParticipeDTO> query = find("game.id", gameId).project(ParticipeDTO.class);
        return query.list();
    }
}
