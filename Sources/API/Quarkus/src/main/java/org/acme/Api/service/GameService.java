// package org.acme.Api.service;

// import java.time.ZoneOffset;
// import java.util.List;
// import java.util.stream.Collectors;

// import javax.enterprise.context.ApplicationScoped;
// import javax.ws.rs.NotFoundException;

// import org.acme.Api.DTO.GameDto;
// import org.acme.Api.DTO.RoundDto;
// import org.acme.Api.DTO.UserTinyDTO;
// import org.acme.Api.Mappeur.GameMappeur;
// import org.acme.Hibernates.entities.GameEntity;

// import io.smallrye.mutiny.Uni;

// @ApplicationScoped
// public class GameService {
// private final GameRepository gameRepository;
// private final UserRepository userRepository;
// private final RoundRepository roundRepository;

// public GameService(GameRepository gameRepository, UserRepository
// userRepository, RoundRepository roundRepository) {
// this.gameRepository = gameRepository;
// this.userRepository = userRepository;
// this.roundRepository = roundRepository;
// }

// public Uni<List<GameEntity>> findAllGame() {
// return gameRepository.findAll().list();
// }

// public Uni<GameEntity> saveGame(GameEntity game) {
// return gameRepository.persist(game);
// }

// // public Uni<GameEntity> updateGame(GameEntity game) {
// // return gameRepository.u(game);
// // }

// public Uni<Boolean> deleteGame(Long game) {
// return gameRepository.deleteById(game);
// }

// public Uni<GameEntity> findById(Long id) {
// return gameRepository.findById(id);
// }

// public Uni<Long> count() {
// return gameRepository.count();
// }
// }
