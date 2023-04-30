package org.acme.api.dto;

import java.util.List;

import org.eclipse.microprofile.openapi.annotations.media.Schema;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import io.quarkus.runtime.annotations.RegisterForReflection;
import io.smallrye.mutiny.Uni;

import java.time.LocalDate;

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
public class GameDTO {

    @JsonProperty("id")
    public Long id;

    @JsonProperty("players")
    public Uni<List<ParticipeDTO>> players;

    @JsonProperty("date")
    @JsonFormat(pattern = "yyyy-MM-dd")
    public LocalDate date;

    @JsonProperty("hostID")
    public Long hostID;

    @JsonProperty("winner")
    public UserTinyDTO winner;

    @JsonIgnore
    @JsonProperty("rounds")
    public Uni<List<RoundDTO>> rounds;

    public GameDTO() {
        // Constructeur vide pour la désérialisation
    }

    // Constructeur avec tous les champs sauf l'ID (généré automatiquement)
    public GameDTO(Long id,
                   Uni<List<ParticipeDTO>> players,
                   LocalDate time,
                   Long ownerGame,
                   UserTinyDTO winner,
                   Uni<List<RoundDTO>> rounds) {
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
