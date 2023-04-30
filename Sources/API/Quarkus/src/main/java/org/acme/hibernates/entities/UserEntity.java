package org.acme.hibernates.entities;

import javax.persistence.*;

@Entity
@Table(name = "users", uniqueConstraints = {@UniqueConstraint(columnNames = {"name"}), @UniqueConstraint(columnNames = {"mail"})})
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

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "user", orphanRemoval = true)
    public UserStatsEntity stats;

    public UserEntity() {
        this.stats = new UserStatsEntity(this);
    }

    public UserEntity(String name, String image, String mail, String password) {
        this.name = name;
        this.image = image;
        this.mail = mail;
        this.password = password;
        this.stats = new UserStatsEntity(this);
    }

    public String getName() {
        return name.substring(0, 1).toUpperCase() + name.substring(1);
    }

    public void setName(String name) {
        this.name = name.toLowerCase();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail.toLowerCase();
    }

}
