package org.acme;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import io.smallrye.mutiny.Uni;

@Path("/users")
public class UserController {

    @Inject
    UserService service;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Uni<List<UserEntity>> getUsers() {
        Uni<List<UserEntity>> allUsers = service.listAll();
        return allUsers;
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/{pseudo}")
    public Uni<UserEntity> getUser(@PathParam("pseudo") String pseudo) {
        Uni<UserEntity> user = service.getUserByName(pseudo);
        return user;

    }

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    @Path("/po")
    public String hello() {
        return "Hello from RESTEasy Reactive";
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/{id}")
    public Uni<UserEntity> getUserById(@PathParam("id") String id) {
        Uni<UserEntity> user = service.findById(Long.valueOf(id));
        return user;
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    // body
    public Response createUser(UserEntity user) {
        service.persist(user);
        return Response.status(Status.CREATED).entity(user).build();
    }

    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateUser(@PathParam("id") String id, User newUser) throws Exception {
        Uni<UserEntity> oldUser = service.findById(Long.valueOf(id));
        if (oldUser == null)
            throw new Exception("user not found");
        service.update(id, newUser);
        return Response.status(Status.OK).build();
    }

    @DELETE
    @Produces(MediaType.APPLICATION_JSON)
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