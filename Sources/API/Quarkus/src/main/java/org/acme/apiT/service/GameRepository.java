package org.acme.api.service;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;

import org.acme.api.dto.GameDto;
import org.acme.hibernates.entities.GameEntity;

import io.quarkus.hibernate.reactive.panache.PanacheRepository;
import io.smallrye.mutiny.Uni;

@ApplicationScoped
public class GameRepository implements PanacheRepository<GameEntity> {
    public Uni<List<GameEntity>> findwithName(Long id) {
        return list("id", id);
    }

    public Uni<List<GameDto>> findByIdGame(Long id) {
        return find("id", id).project(GameDto.class).list();
    }
}
// public Uni<GameDto> getDetailsGameById(Long gameId) {
// return findById(gameId)
// .onItem().ifNull().failWith(new NotFoundException("Game not found"))
// .onItem().transform(gameEntity -> GameMappeur.toDto(gameEntity));
// }