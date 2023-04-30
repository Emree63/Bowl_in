package org.acme.api.controllers;

import java.util.List;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import org.acme.api.BowlDbContext;
import org.acme.api.dto.UserDTO;
import org.acme.api.dto.UserTinyDTO;
import org.acme.api.mapper.UserMapper;
import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.jboss.logging.Logger;

import io.quarkus.hibernate.reactive.panache.common.runtime.ReactiveTransactional;
import io.smallrye.mutiny.Uni;

@ApplicationScoped
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Path("/users")
public class UserController {

    private static final Logger LOGGER = Logger.getLogger(UserController.class.getName());

    @Inject
    BowlDbContext service;

    @GET
    @Operation(summary = "Get all users")
    @Produces(MediaType.APPLICATION_JSON)
    public Uni<List<UserDTO>> getUsers() {
        LOGGER.info("Get all users");
        return service.userRepository.findAll().list()
                .map(entities -> entities.stream().map(UserMapper::toDto).collect(Collectors.toList()));
    }

    @GET
    @Operation(summary = "Get a user by ID")
    @APIResponse(responseCode = "200", description = "OK")
    @APIResponse(responseCode = "404", description = "User not found")
    @Path("/{id}")
    public Uni<Response> getUserById(@PathParam("id") Long id) {
        LOGGER.info("Get user with id : " + id);
        return service.userRepository.getUserById(id)
                .map(user -> user == null ? Response.status(Status.NOT_FOUND) : Response.ok(user).status(200))
                .map(Response.ResponseBuilder::build);
    }

    @GET
    @Operation(summary = "Get a user by name")
    @APIResponse(responseCode = "200", description = "OK")
    @APIResponse(responseCode = "404", description = "User not found")
    @Path("/name/{name}")
    public Uni<Response> getUserByName(@PathParam("name") String name) {
        LOGGER.info("Get user with name : " + name);

        return service.userRepository.verifiedName(name)
                .flatMap(exist -> {
                    if (exist) {
                        return service.userRepository.findWithName(name)
                                .map(user -> Response.ok(user).build());
                    } else {
                        throw new NotFoundException("User not found");
                    }
                });

    }

    @GET
    @Operation(summary = "Get a user by mail")
    @APIResponse(responseCode = "200", description = "OK")
    @APIResponse(responseCode = "404", description = "User not found")
    @Path("/mail/{mail}")
    public Uni<Response> getUserByMail(@PathParam("mail") String mail) {
        LOGGER.info("Get user with mail : " + mail);

        return service.userRepository.verifiedMail(mail)
                .flatMap(exist -> {
                    if (exist) {
                        return service.userRepository.findWithMail(mail)
                                .map(user -> Response.ok(user).build());
                    } else {
                        throw new NotFoundException("User not found");
                    }
                });
    }

    @POST
    @Operation(summary = "Create a new user")
    @APIResponse(responseCode = "201", description = "User successfully created")
    @APIResponse(responseCode = "422", description = "User invalidly set on request")
    @ReactiveTransactional
    public Uni<Response> createUser(UserTinyDTO user) {
        if (user == null) {
            throw new WebApplicationException("user was invalidly set on request.", 422);
        }
        LOGGER.info("creating user: " + user);
        return Uni.combine().all().unis(
                        service.userRepository.verifiedName(user.name),
                        service.userRepository.verifiedMail(user.mail))
                .asTuple()
                .flatMap(tuple -> {
                    boolean nameExists = tuple.getItem1();
                    boolean mailExists = tuple.getItem2();
                    if (nameExists) {
                        throw new WebApplicationException("Name already exists", Status.BAD_REQUEST);
                    }
                    if (mailExists) {
                        throw new WebApplicationException("Mail already exists", Status.BAD_REQUEST);
                    }
                    return service.userRepository.addUser(user)
                            .map(createdUser -> Response.status(Response.Status.CREATED).entity(createdUser).build());
                })
                .onFailure().recoverWithItem(Response.status(Status.BAD_REQUEST).build());
    }


    @PUT
    @Operation(summary = "Update a user")
    @APIResponse(responseCode = "200", description = "OK")
    @APIResponse(responseCode = "400", description = "Bad Request")
    @APIResponse(responseCode = "404", description = "User not found")
    @Path("/{id}")
    @ReactiveTransactional
    public Uni<Response> updateUser(@PathParam("id") Long id, UserTinyDTO newUser) {
        LOGGER.info("Update user with id : " + id);
        return service.userRepository.findById(id)
                .onItem().ifNull().failWith(() -> new WebApplicationException("User not found", Status.NOT_FOUND))
                .onItem().ifNotNull().transformToUni(oldUser ->
                        Uni.combine().all().unis(
                                        service.userRepository.verifiedName(newUser.name),
                                        service.userRepository.verifiedMail(newUser.mail))
                                .asTuple()
                                .flatMap(tuple -> {
                                    boolean nameExists = tuple.getItem1();
                                    boolean mailExists = tuple.getItem2();
                                    if (nameExists && !oldUser.getName().equalsIgnoreCase(newUser.name)) {
                                        throw new WebApplicationException("Name already exists", Status.BAD_REQUEST);
                                    }
                                    if (mailExists && !oldUser.getMail().equalsIgnoreCase(newUser.mail)) {
                                        throw new WebApplicationException("Mail already exists", Status.BAD_REQUEST);
                                    }
                                    oldUser.setName(newUser.name);
                                    oldUser.setMail(newUser.mail);
                                    oldUser.setImage(newUser.image);
                                    return service.userRepository.persistAndFlush(oldUser)
                                            .map(entity -> Response.ok(UserMapper.toDto(entity)).build());
                                })
                );
    }



    @DELETE
    @Operation(summary = "Delete a user")
    @APIResponse(responseCode = "204")
    @APIResponse(responseCode = "404", description = "User not found")
    @Path("/{id}")
    @ReactiveTransactional
    public Uni<Response> delete(@PathParam("id") Long id) {
        LOGGER.info("Delete user with id : " + id);
        return service.userRepository.deleteById(id)
                .onItem().transform(entity -> !entity ? Response.status(Status.NOT_FOUND).build()
                        : Response.noContent().build());
    }

    @GET
    @Operation(summary = "Get the number of users")
    @Path("/count")
    public Uni<Long> count() {
        LOGGER.info("Get user count");
        return service.userRepository.count();
    }
}