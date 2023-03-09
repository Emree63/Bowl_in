package org.acme.Api.controllers;

import java.net.URI;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.NotFoundException;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import io.quarkus.hibernate.reactive.panache.PanacheQuery;
import org.acme.Api.DTO.UserDTO;
import org.acme.Api.DTO.UserTinyDTO;
import org.acme.Api.service.UserService;
import org.acme.Hibernates.entities.UserEntity;
import org.jboss.logging.Logger;

import io.quarkus.hibernate.reactive.panache.common.runtime.ReactiveTransactional;
import io.quarkus.panache.common.Sort;
import io.smallrye.mutiny.Uni;

@ApplicationScoped
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Path("/users")
public class UserController {
    private static final Logger LOGGER = Logger.getLogger(UserController.class.getName());

    @Inject
    UserService service;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Uni<List<UserTinyDTO>> getUsers() {
        LOGGER.info("Getting all users and ordering it by name");
        return service.findAll().project(UserTinyDTO.class).list();
    }

    // @GET
    // @Path("/{pseudo}")
    // public Uni<UserEntity> getUser(@PathParam("pseudo") String pseudo) {
    // Uni<UserEntity> user = service.getUserByName(pseudo);
    // return user;
    // }

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    @Path("/po")
    public String hello() {
        return "Hello from RESTEasy Reactive";
    }

    @GET
    @Path("/{id}")
    public Uni<Response> getUserById(@PathParam("id") Long id) {
        LOGGER.info("Get user with id : " + id);
        return service.findByBowlinId(id)
                .onItem()
                .transform(
                        entity -> entity == null ? Response.status(Status.NOT_FOUND) : Response.ok(entity).status(200))
                .onItem().transform(Response.ResponseBuilder::build);

    }

    @POST
    @ReactiveTransactional
    public Uni<Response> createUser(UserEntity user) {
        if (user == null) {
            throw new WebApplicationException("user was invalidly set on request.", 422);
        }
        LOGGER.info("creating user: " + user.getName());
        return service.persist(user)
                .map(persistedUser -> Response
                        .created(URI.create("/users/" + user.id))
                        .entity(persistedUser)
                        .build())
                .onFailure().recoverWithItem(Response.status(Status.BAD_REQUEST).build());
    }

    // @POST
    // @ReactiveTransactional
    // public Uni<Response> createUser(UserEntity user) {
    // if (user == null) {
    // throw new WebApplicationException("user was invalidly set on request.", 422);
    // }
    // LOGGER.info("creating user: " + user.getName());
    // return service.persist(user)
    // .map(persistedUser -> Response
    // .status(Status.CREATED)
    // .entity(persistedUser)
    // .build())
    // .onFailure().recoverWithItem(Response.status(Status.BAD_REQUEST).build());
    // }

    // @PUT
    // @Path("/{id}")
    // @ReactiveTransactional
    // public Response updateUser(@PathParam("id") String id, User newUser) throws
    // Exception {
    // Uni<UserEntity> oldUser = service.findById(Long.valueOf(id));
    // if (oldUser == null)
    // throw new Exception("user not found");
    // service.update(id, newUser);
    // return Response.status(Status.OK).build();
    // }

    @PUT
    @Path("/{id}")
    @ReactiveTransactional
    public Uni<Response> updateUser(@PathParam("id") Long id, UserEntity newUser) {
        return service.findById(id)
                .onItem().ifNull().failWith(() -> new WebApplicationException("User not found", Status.NOT_FOUND))
                .onItem().ifNotNull().invoke(oldUser -> {
                    oldUser.setName(newUser.getName());
                })
                .onItem().ifNotNull().transform(entity -> Response.ok(entity).build());
    }

    @DELETE
    @Path("/{id}")
    @ReactiveTransactional
    public Uni<Response> delete(@PathParam("id") Long id) {
        return service.deleteById(id)
                .onItem().transform(entity -> !entity ? Response.status(Status.NOT_FOUND).build()
                        : Response.ok().status(200).build());
    }

    @GET
    @Path("/count")
    public Uni<Long> count() {
        return service.count();
    }
}