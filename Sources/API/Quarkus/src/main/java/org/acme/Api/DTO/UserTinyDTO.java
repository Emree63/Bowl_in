package org.acme.Api.DTO;

import io.quarkus.hibernate.reactive.panache.common.ProjectedFieldName;
import io.quarkus.runtime.annotations.RegisterForReflection;

@RegisterForReflection
public class UserTinyDTO {
    public Long id;
    public String name;
    public UserTinyDTO(Long id, String name) {
        this.id = id;
        this.name = name;
    }
}
