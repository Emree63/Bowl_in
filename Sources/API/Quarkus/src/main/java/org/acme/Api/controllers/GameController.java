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
import org.acme.Api.DTO.UserTinyDTO;
import org.acme.Api.Manager.DbManager;
import org.acme.Api.Manager.GameManager;
import org.acme.Api.service.GameRepository;
import org.acme.Hibernates.entities.GameEntity;
import org.acme.Hibernates.entities.UserEntity;
import org.jboss.logging.Logger;

import io.quarkus.panache.common.Sort;
import io.smallrye.mutiny.Uni;

@ApplicationScoped
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Path("/games")
public class GameController {
    private static final Logger LOGGER = Logger.getLogger(GameController.class.getName());
    @Inject
    DbManager dbManager;

    @GET
    public List<GameDto> getUsers() {
        LOGGER.info("Getting all game");
        List<GameDto> allGames = dbManager.gameManager.getAllGames();

        return allGames;
    }

    @GET
    @Path("/{id}")
    public Response getGameById(@PathParam("id") Long id) {
        LOGGER.info("Get game with id : " + id);
        GameDto entity = dbManager.gameManager.getDetailsGameById(id);
        if (entity == null) {
            Response.status(Status.NOT_FOUND);
        }

        return Response.ok(entity).status(200).build();

    }

    @POST
    @Transactional
    public Response createGame(GameDto game) {
        if (game == null) {
            throw new WebApplicationException("user was invalidly set on request.", 422);
        }
        GameDto entity = dbManager.gameManager.saveGame(game);
        if (entity == null) {
            return Response.status(Status.BAD_REQUEST).build();
        }
        LOGGER.info("creating game: ");
        return Response.created(URI.create("/game/" + game.id)).build();

    }

    // @DELETE
    // @Path("/{id}")
    // @ReactiveTransactional
    // public Uni<Response> delete(@PathParam("id") Long id) {
    // return service.deleteById(id)
    // .onItem().transform(entity -> !entity ?
    // Response.status(Status.NOT_FOUND).build()
    // : Response.ok().status(200).build());
    // }

    @GET
    @Path("/count")
    public Long count() {
        return dbManager.gameManager.countGame();
    }
}
