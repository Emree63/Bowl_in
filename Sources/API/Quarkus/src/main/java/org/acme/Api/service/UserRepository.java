package org.acme.api.service;

import javax.enterprise.context.ApplicationScoped;

import org.acme.api.dto.UserDTO;
import org.acme.hibernates.entities.UserEntity;

import io.quarkus.hibernate.reactive.panache.PanacheRepository;
import io.smallrye.mutiny.Uni;

@ApplicationScoped
public class UserRepository implements PanacheRepository<UserEntity> {

    // public Uni<UserEntity> getUserByName(String name) {
    //      return UserEntity.find("name", name).firstResult();
    // }

    public Uni<UserDTO> findwithName(String name) {
        return find("name", name.toLowerCase()).project(UserDTO.class).firstResult();
    }

    public Uni<UserDTO> findwithMail(String mail) {
        return find("mail", mail.toLowerCase()).project(UserDTO.class).firstResult();
    }

    public Uni<UserDTO> getUserById(Long id) {
        return find("id", id).project(UserDTO.class).firstResult();
    }

}
