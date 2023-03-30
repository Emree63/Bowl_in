package org.acme.Api.DTO;

import java.util.Date;
import java.util.List;

import org.acme.Hibernates.entities.GameEntity;
import org.acme.Hibernates.entities.ParticipeEntity;

import io.quarkus.hibernate.reactive.panache.common.ProjectedFieldName;
import io.quarkus.runtime.annotations.RegisterForReflection;

import io.quarkus.runtime.annotations.RegisterForReflection;
import java.time.LocalDate;
import java.util.List;

@RegisterForReflection
public class GameDto {
    private List<ParticipeDto> players;
    private LocalDate date;
    private Long hostID;
    private List<RoundDto> rounds;

    public GameDto() {
    }

    public GameDto(List<ParticipeDto> players, LocalDate date, Long hostID,
            List<RoundDto> rounds) {
        this.players = players;
        this.date = date;
        this.hostID = hostID;
        this.rounds = rounds;
    }

    public List<ParticipeDto> getPlayers() {
        return players;
    }

    public void setPlayers(List<ParticipeDto> players) {
        this.players = players;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Long getHostID() {
        return hostID;
    }

    public void setHostID(Long hostID) {
        this.hostID = hostID;
    }

    public List<RoundDto> getRounds() {
        return rounds;
    }

    public void setRounds(List<RoundDto> rounds) {
        this.rounds = rounds;
    }
}

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
