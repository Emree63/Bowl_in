package org.acme.Hibernates.entities;

import javax.persistence.*;

@Entity
@Table(name = "throwtable")
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

    @Column(name = "pins")
    public int pins;

}
