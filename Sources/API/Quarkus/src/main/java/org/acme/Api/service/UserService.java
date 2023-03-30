package org.acme.Api.service;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;

import org.acme.Api.DTO.UserDTO;
import org.acme.Hibernates.entities.UserEntity;

import io.quarkus.hibernate.reactive.panache.PanacheRepository;
import io.smallrye.mutiny.Uni;

@ApplicationScoped
public class UserService implements PanacheRepository<UserEntity> {
    // public Uni<UserEntity> getUserByName(String name) {
    // return UserEntity.find("name", name).firstResult();
    // }

    public Uni<List<UserEntity>> findwithName(String name) {
        return list("name", name);
    }

    public Uni<List<UserDTO>> findByBowlinId(Long id) {
        return find("id", id).project(UserDTO.class).list();
    }

    // public Uni<Long> deleteUser() {
    // return delete("name", "Stef");
    // }
}