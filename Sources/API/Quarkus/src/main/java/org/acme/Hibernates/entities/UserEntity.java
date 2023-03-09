package org.acme.Hibernates.entities;

import org.eclipse.microprofile.openapi.annotations.media.Schema;

import javax.persistence.*;

@Entity
@Schema(description = "The entity describing a user")
@Table(name="users")
public class UserEntity {
    @Id
    @GeneratedValue
    @Schema(description = "The unique ID of the user")
    public Long id;
    @Column(length = 100)
    @Schema(description = "The name of the user")
    private String name;

    @Column(length = 100)
    @Schema(description = "The hashed password of the user")
    private String password;

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "user", orphanRemoval = true)
    @Schema(description = "The stats of the user")
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
