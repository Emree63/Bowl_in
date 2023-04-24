package org.acme.hibernates.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Embedded;

// public class ThrowId implements Serializable{
// @Column(name = "Order")
// private int order;

// @Column(name = "RoundIdGame")
// private int roundIdGame;

// @Column(name = "RoundPlayerPosition")
// private int roundPlayerPosition;
// }

@Embeddable
public class ThrowId implements Serializable {

    public static final long serialVersionUID = 1L;

    @Column(name = "OrderTrhow")
    public Integer OrderTrhow;

    @Embedded
    @Column(name = "round_id")
    public RoundId round;

    public ThrowId() {

    }

    public ThrowId(Integer OrderTrhow, RoundId round) {
        this.OrderTrhow = OrderTrhow;
        this.round = round;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (!(o instanceof ThrowId))
            return false;
        ThrowId throwId = (ThrowId) o;
        return Objects.equals(OrderTrhow, throwId.OrderTrhow) &&
                Objects.equals(round, throwId.round);
    }

    @Override
    public int hashCode() {
        return Objects.hash(OrderTrhow, round);
    }
}
