package org.acme.Api.service;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;

import org.acme.Api.DTO.UserDTO;
import org.acme.Api.DTO.UserTinyDTO;
import org.acme.Hibernates.entities.UserEntity;

import io.quarkus.hibernate.orm.panache.PanacheRepository;

@ApplicationScoped
public class UserRepository implements PanacheRepository<UserEntity> {
    // public Uni<UserEntity> getUserByName(String name) {
    // return UserEntity.find("name", name).firstResult();
    // }

    public List<UserEntity> findwithName(String name) {
        return list("name", name);
    }

    public List<UserDTO> findByBowlinId(Long id) {
        return find("id", id).project(UserDTO.class).list();
    }

    public UserTinyDTO findByBowlinIdTiny(Long id) {
        return find("id", id).project(UserTinyDTO.class).firstResult();
    }

    // public Uni<Long> deleteUser() {
    // return delete("name", "Stef");
    // }
}
