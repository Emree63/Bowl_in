package org.acme;

import javax.persistence.Entity;

import io.quarkus.hibernate.reactive.panache.PanacheEntity;

@Entity
public class UserEntity extends PanacheEntity {
    public String name;
    public String password;

    // return name as uppercase in the model
    public String getName() {
        return name.toUpperCase();
    }

    // store all names in lowercase in the DB
    public void setName(String name) {
        this.name = name.toLowerCase();
    }
}
