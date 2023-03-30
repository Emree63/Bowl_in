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

import org.acme.Api.DTO.GameDto;
import org.acme.Api.service.GameService;
import org.acme.Hibernates.entities.GameEntity;
import org.acme.Hibernates.entities.UserEntity;
import org.jboss.logging.Logger;

import io.quarkus.hibernate.reactive.panache.common.runtime.ReactiveTransactional;
import io.quarkus.panache.common.Sort;
import io.smallrye.mutiny.Uni;

@ApplicationScoped
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Path("/games")
public class GameController {
    private static final Logger LOGGER = Logger.getLogger(GameController.class.getName());

    @Inject
    GameService service;

    @GET
    public Uni<List<GameDto>> getUsers() {
        LOGGER.info("Getting all game");
        Uni<List<GameDto>> allGames = service.findAll().project(GameDto.class).list();
        return allGames;
    }

    @GET
    @Path("/{id}")
    public Uni<Response> getGameById(@PathParam("/{id}") Long id) {
        LOGGER.info("Get game with id : " + id);
        return service.find("id", id).project(GameDto.class).list()
                .onItem()
                .transform(
                        entity -> entity == null ? Response.status(Status.NOT_FOUND) : Response.ok(entity).status(200))
                .onItem().transform(Response.ResponseBuilder::build);

    }

    @POST
    @ReactiveTransactional
    public Uni<Response> createGame(GameEntity game) {
        if (game == null) {
            throw new WebApplicationException("user was invalidly set on request.", 422);
        }
        LOGGER.info("creating game: " + game.getId());
        return service.persist(game)
                .map(persistedGame -> Response
                        .created(URI.create("/game/" + game.id))
                        .entity(persistedGame)
                        .build())
                .onFailure().recoverWithItem(Response.status(Status.BAD_REQUEST).build());
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
