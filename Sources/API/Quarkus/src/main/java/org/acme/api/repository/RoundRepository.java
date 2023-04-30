package org.acme.api.repository;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;

import org.acme.hibernates.entities.RoundEntity;

import io.quarkus.hibernate.reactive.panache.PanacheRepository;
import io.smallrye.mutiny.Uni;

@ApplicationScoped
public class RoundRepository implements PanacheRepository<RoundEntity> {

    public Uni<List<RoundEntity>> findByGameId(Long gameId) {
        return find("game.id", gameId).list();
    }

}
