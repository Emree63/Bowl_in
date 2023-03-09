package org.acme.Hibernates.entities;

import javax.persistence.Entity;

// @Entity
public class RoundEntity {
    private int firstThrow;
    private int secondThrow;
    private int points;

    public int getFirstThrow() {
        return this.firstThrow;
    }

    public void setFirstThrow(int firstThrow) {
        this.secondThrow = firstThrow;
    }

    public int getSecondThrow() {
        return this.secondThrow;
    }

    public void setSecondThrow(int secondThrow) {
        this.secondThrow = secondThrow;
    }

    public int getPoints() {
        return this.points;
    }

    public void setPoints(int points) {
        this.points = points;
    }
}
