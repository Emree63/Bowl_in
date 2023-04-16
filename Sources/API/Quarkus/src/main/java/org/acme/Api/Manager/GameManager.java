package org.acme.Api.Manager;

import java.util.List;
import java.util.stream.Collectors;

import javax.ws.rs.NotFoundException;

import org.acme.Api.DTO.GameDto;
import org.acme.Api.Mappeur.GameMappeur;
import org.acme.Hibernates.entities.GameEntity;

public class GameManager {

    private final DbManager dbManager;

    public GameManager(DbManager dbManager) {
        this.dbManager = dbManager;
    }

    public GameDto saveGame(GameDto game) {
        GameEntity entity = GameMappeur.toEntity(game, dbManager.dbContext);
        dbManager.dbContext.gameRepository.persist(entity);
        return GameMappeur.toDto(entity, dbManager.dbContext);

    }

    public GameDto getDetailsGameById(Long gameId) {
        GameEntity g = dbManager.dbContext.gameRepository.findById(gameId);
        if (g == null) {
            throw new NotFoundException("Game not found");
        }
        return GameMappeur.toDto(g, dbManager.dbContext);
    }

    public List<GameDto> getAllGames() {
        List<GameEntity> games = dbManager.dbContext.gameRepository.findAll().list();
        return games.stream()
                .map(gameEntity -> GameMappeur.toDto(gameEntity, dbManager.dbContext))
                .collect(Collectors.toList());

    }

    public Long countGame() {
        return dbManager.dbContext.gameRepository.count();
    }
}
