package org.acme.Api.service;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;

import org.acme.Api.DTO.GameDto;
import org.acme.Hibernates.entities.GameEntity;

import io.quarkus.hibernate.reactive.panache.PanacheRepository;
import io.smallrye.mutiny.Uni;

@ApplicationScoped
public class GameService implements PanacheRepository<GameEntity> {
    public Uni<List<GameEntity>> findwithName(Long id) {
        return list("id", id);
    }

    public Uni<List<GameDto>> findByIdGame(Long id) {
        return find("id", id).project(GameDto.class).list();
    }
}
