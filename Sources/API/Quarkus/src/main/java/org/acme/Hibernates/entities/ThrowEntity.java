package org.acme.hibernates.entities;

import javax.persistence.*;

import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name = "Throw")
public class ThrowEntity {

    @EmbeddedId
    public ThrowId id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
            @JoinColumn(name = "game_id", referencedColumnName = "game_id", insertable = false, updatable = false),
            @JoinColumn(name = "idGame", referencedColumnName = "idGame", insertable = false, updatable = false),
            @JoinColumn(name = "position", referencedColumnName = "position", insertable = false, updatable = false),
            @JoinColumn(name = "turnNumber", referencedColumnName = "turnNumber", insertable = false, updatable = false)
    })
    public RoundEntity round;

    @ColumnDefault("0")
    @Column(name = "pins")
    public int pins = 0;

    public ThrowEntity() {
    }

    public ThrowEntity(RoundEntity round, int pins) {
        this.round = round;
        this.pins = pins;
    }
}
