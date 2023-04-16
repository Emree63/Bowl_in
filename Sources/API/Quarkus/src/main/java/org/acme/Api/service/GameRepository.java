package org.acme.Api.service;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import org.acme.Hibernates.entities.GameEntity;

import io.quarkus.hibernate.orm.panache.PanacheRepository;

@ApplicationScoped
public class GameRepository implements PanacheRepository<GameEntity> {
    public List<GameEntity> findwithName(Long id) {
        return list("id", id);
    }

    public List<GameEntity> findByIdGame(Long id) {
        return find("id", id).list();
    }
}
// public Uni<GameDto> getDetailsGameById(Long gameId) {
// return findById(gameId)
// .onItem().ifNull().failWith(new NotFoundException("Game not found"))
// .onItem().transform(gameEntity -> GameMappeur.toDto(gameEntity));
// }