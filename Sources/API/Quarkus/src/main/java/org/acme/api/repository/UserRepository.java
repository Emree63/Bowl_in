package org.acme.api.repository;

import javax.enterprise.context.ApplicationScoped;

import org.acme.api.dto.UserDTO;
import org.acme.api.dto.UserTinyDTO;
import org.acme.api.mapper.UserMapper;
import org.acme.hibernates.entities.UserEntity;

import io.quarkus.hibernate.reactive.panache.PanacheRepository;
import io.smallrye.mutiny.Uni;

import java.util.Objects;

@ApplicationScoped
public class UserRepository implements PanacheRepository<UserEntity> {

    public Uni<UserDTO> addUser(UserTinyDTO user) {
        UserEntity userEntity = UserMapper.toEntity(user);
        return persistAndFlush(userEntity)
                .map(ignore -> UserMapper.toDto(userEntity));
    }

    public Uni<UserDTO> findWithName(String name) {
        return find("name", name.toLowerCase())
                .firstResult()
                .map(UserMapper::toDto);
    }

    public Uni<Boolean> verifiedName(String name) {
        return find("name", name.toLowerCase())
                .firstResult()
                .map(Objects::nonNull);
    }

    public Uni<Boolean> verifiedMail(String mail) {
        return find("mail", mail.toLowerCase())
                .firstResult()
                .map(Objects::nonNull);
    }

    public Uni<UserDTO> findWithMail(String mail) {
        return find("mail", mail.toLowerCase())
                .firstResult()
                .map(UserMapper::toDto);
    }

    public Uni<UserDTO> getUserById(Long id) {
        return find("id", id)
                .firstResult()
                .map(UserMapper::toDto);
    }

}
