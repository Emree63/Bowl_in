package org.acme.Api.DTO;

import io.quarkus.runtime.annotations.RegisterForReflection;

@RegisterForReflection
public class RoundDto {
    private int playerPosition;
    private int turn;
    private int pinsFirstThrow;
    private int pinsSecondThrow;
    private int points;

    public RoundDto() {
    }

    public RoundDto(int playerPosition, int turn, int pinsFirstThrow, int pinsSecondThrow, int points) {
        this.playerPosition = playerPosition;
        this.turn = turn;
        this.pinsFirstThrow = pinsFirstThrow;
        this.pinsSecondThrow = pinsSecondThrow;
        this.points = points;
    }

    public int getPlayerPosition() {
        return playerPosition;
    }

    public void setPlayerPosition(int playerPosition) {
        this.playerPosition = playerPosition;
    }

    public int getTurn() {
        return turn;
    }

    public void setTurn(int turn) {
        this.turn = turn;
    }

    public int getPinsFirstThrow() {
        return pinsFirstThrow;
    }

    public void setPinsFirstThrow(int pinsFirstThrow) {
        this.pinsFirstThrow = pinsFirstThrow;
    }

    public int getPinsSecondThrow() {
        return pinsSecondThrow;
    }

    public void setPinsSecondThrow(int pinsSecondThrow) {
        this.pinsSecondThrow = pinsSecondThrow;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }
}
