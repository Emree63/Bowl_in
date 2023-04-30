package org.acme.api.dto;

import io.quarkus.runtime.annotations.RegisterForReflection;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

@RegisterForReflection
@Schema(description = "A minimal DTO for transferring user information")
public class UserTinyDTO {

    public String name;
    public String image;
    public String mail;
    public String password;
    public UserTinyDTO(String name, String image, String mail, String password) {
        this.name = name;
        this.image = image;
        this.mail = mail;
        this.password = password;
    }
}