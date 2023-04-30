package org.acme.api.manager;

import java.util.List;
import java.util.stream.Collectors;

import javax.ws.rs.NotFoundException;

import org.acme.api.dto.GameDTO;
import org.acme.api.mapper.GameMapper;

import io.smallrye.mutiny.Uni;

public class GameManager {

    private final DbManager dbManager;

    public GameManager(DbManager dbManager) {
        this.dbManager = dbManager;
    }

    public Uni<GameDTO> saveGame(GameDTO game) {
        return dbManager.dbContext.gameRepository.persist(GameMapper.toEntity(game, dbManager.dbContext))
                .onItem().transform(gameEntity -> GameMapper.toDto(gameEntity, dbManager.dbContext));
    }

    public Uni<GameDTO> getDetailsGameById(Long gameId) {
        return dbManager.dbContext.gameRepository.findById(gameId)
                .onItem().ifNull().failWith(new NotFoundException("Game not found"))
                .onItem().transform(gameEntity -> GameMapper.toDto(gameEntity, dbManager.dbContext));
    }

    public Uni<List<GameDTO>> getAllGames() {
        return dbManager.dbContext.gameRepository.findAll().list()
                .onItem().transform(games -> games.stream()
                        .map(gameEntity -> GameMapper.toDto(gameEntity, dbManager.dbContext))
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
