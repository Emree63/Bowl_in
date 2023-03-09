package org.acme.Hibernates.entities;

import javax.persistence.*;

@Entity
@Table(name="users")
public class UserEntity {
    @Id
    @GeneratedValue
    public Long id;
    @Column(length = 100)
    private String name;

    @Column(length = 100)
    private String password;

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "user", orphanRemoval = true)
    private UserStatsEntity stats;

    public UserEntity() {
        this.stats = new UserStatsEntity(this);
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
