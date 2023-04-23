package org.acme.api.service;

import javax.enterprise.context.ApplicationScoped;

import org.acme.api.dto.UserDto;
import org.acme.api.dto.UserTinyDto;
import org.acme.api.mapper.UserMapper;
import org.acme.hibernates.entities.UserEntity;

import io.quarkus.hibernate.reactive.panache.PanacheRepository;
import io.smallrye.mutiny.Uni;

import java.util.Objects;

@ApplicationScoped
public class UserRepository implements PanacheRepository<UserEntity> {

    public Uni<UserDto> addUser(UserTinyDto user) {
        UserEntity userEntity = UserMapper.toEntity(user);
        return persistAndFlush(userEntity)
                .map(ignore -> UserMapper.toDto(userEntity));
    }

    public Uni<UserDto> findWithName(String name) {
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

    public Uni<UserDto> findWithMail(String mail) {
        return find("mail", mail.toLowerCase())
                .firstResult()
                .map(UserMapper::toDto);
    }

    public Uni<UserDto> getUserById(Long id) {
        return find("id", id)
                .firstResult()
                .map(UserMapper::toDto);
    }

}
