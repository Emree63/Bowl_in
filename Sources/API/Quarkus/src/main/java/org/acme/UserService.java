package org.acme;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;

import io.quarkus.hibernate.reactive.panache.PanacheRepository;
import io.smallrye.mutiny.Uni;

@ApplicationScoped
public class UserService implements PanacheRepository<UserEntity> {
    public Uni<UserEntity> getUserByName(String name) {
        return UserEntity.find("name", name).firstResult();
    }

    public Uni<List<UserEntity>> findwithName(String name) {
        return list("name", name);
    }

    public Uni<Long> deleteUser() {
        return delete("name", "Stef");
    }
}
