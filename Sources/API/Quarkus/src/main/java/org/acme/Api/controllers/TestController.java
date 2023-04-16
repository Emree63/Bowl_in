package org.acme.Api.controllers;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;
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

@ApplicationScoped
@Path("/test")
public class TestController {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    @Path("/po")
    public String hello() {
        return "Hello from RESTEasy Reactive";
    }

}