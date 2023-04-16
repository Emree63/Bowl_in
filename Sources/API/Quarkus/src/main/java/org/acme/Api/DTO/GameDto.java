package org.acme.Api.DTO;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.acme.Hibernates.entities.GameEntity;
import org.acme.Hibernates.entities.ParticipeEntity;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import io.quarkus.hibernate.reactive.panache.common.ProjectedFieldName;
import io.quarkus.runtime.annotations.RegisterForReflection;
import io.smallrye.mutiny.Uni;
import io.quarkus.runtime.annotations.RegisterForReflection;
import java.time.LocalDate;
import java.util.List;

// @RegisterForReflection
// @Schema(description = "A DTO for transferring game details")
// public class GameDto {
//     public Long id;
//     public List<ParticipeDto> players = new ArrayList<>();
//     public LocalDate date;
//     public Long hostID;
//     public UserDTO winner;
//     public Map<ParticipeDto, Integer> points = new HashMap<>();
//     public List<RoundDto> rounds = new ArrayList<>();

//     public GameDto() {
//     }

//     public GameDto(Long id, List<ParticipeDto> players, LocalDate date, Long hostID,
//             List<RoundDto> rounds) {
//         this.id = id;

//         this.players = players;
//         this.date = date;
//         this.hostID = hostID;
//         this.rounds = rounds;
//     }

// }

@RegisterForReflection // Annotation pour permettre l'utilisation avec Quarkus
@Schema(description = "A DTO for transferring game details")
public class GameDto {

    @JsonProperty("id")
    public Long id;

    @JsonProperty("players")
    public Uni<List<ParticipeDto>> players;

    @JsonProperty("date")
    @JsonFormat(pattern = "yyyy-MM-dd")
    public LocalDate date;

    @JsonProperty("hostID")
    public Long hostID;

    @JsonProperty("winner")
    public UserTinyDTO winner;

    @JsonIgnore
    @JsonProperty("rounds")
    public Uni<List<RoundDto>> rounds;

    public GameDto() {
        // Constructeur vide pour la désérialisation
    }

    // Constructeur avec tous les champs sauf l'ID (généré automatiquement)
    public GameDto(Long id,
            Uni<List<ParticipeDto>> players,
            LocalDate time,
            Long ownerGame,
            UserTinyDTO winner,
            Uni<List<RoundDto>> rounds) {
        this.players = players;
        this.date = time;
        this.hostID = ownerGame;
        this.winner = winner;
        this.rounds = rounds;
    }
}

// return gameDto;
// }
// @RegisterForReflection
// public class GameDto {
// public Long id;

// private Date time;

// private Long winner;

// private int nbPoints;
// // public UserDto host;

// public List<ParticipeEntity> participants;

// public GameDto() { // @ProjectedFieldName("host") UserDto owner

// // this.owner = owner;
// }

// }
