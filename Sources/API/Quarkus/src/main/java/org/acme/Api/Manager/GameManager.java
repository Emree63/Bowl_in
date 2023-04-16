package org.acme.Api.Manager;

import java.util.List;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.NotFoundException;

import org.acme.Api.DTO.GameDto;
import org.acme.Api.Mappeur.GameMappeur;

import io.smallrye.mutiny.Uni;

public class GameManager {

    private final DbManager dbManager;

    public GameManager(DbManager dbManager) {
        this.dbManager = dbManager;
    }

    public Uni<GameDto> saveGame(GameDto game) {
        return dbManager.dbContext.gameRepository.persist(GameMappeur.toEntity(game, dbManager.dbContext))
                .onItem().transform(gameEntity -> GameMappeur.toDto(gameEntity, dbManager.dbContext));
    }

    public Uni<GameDto> getDetailsGameById(Long gameId) {
        return dbManager.dbContext.gameRepository.findById(gameId)
                .onItem().ifNull().failWith(new NotFoundException("Game not found"))
                .onItem().transform(gameEntity -> GameMappeur.toDto(gameEntity, dbManager.dbContext));
    }

    public Uni<List<GameDto>> getAllGames() {
        return dbManager.dbContext.gameRepository.findAll().list()
                .onItem().transform(games -> games.stream()
                        .map(gameEntity -> GameMappeur.toDto(gameEntity, dbManager.dbContext))
                        .collect(Collectors.toList()))
                .onFailure().invoke(throwable -> {
                    // Log the error or perform any other error handling here
                    throwable.printStackTrace();
                });

    }

    public Uni<Long> countGame() {
        return dbManager.dbContext.gameRepository.count();
    }
}
