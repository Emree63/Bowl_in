package org.acme.Hibernates.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "Users")
public class UserEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    @Column(length = 64)
    private String name;

    @Column(length = 255)
    private String image;

    @Column(length = 255)
    private String mail;

    @Column(length = 144)
    private String password;

    //@OneToOne(cascade = CascadeType.ALL, mappedBy = "user", orphanRemoval = true)
    //public UserStatsEntity stats;

    public UserEntity() {
        //this.stats = new UserStatsEntity(this);
    }

    // return name as uppercase in the model
    public String getName() {
        return name.toUpperCase();
    }

    // store all names in lowercase in the DB
    public void setName(String name) {
        this.name = name.toLowerCase();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password.toLowerCase();
    }

}
