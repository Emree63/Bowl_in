package org.acme.Api.Manager;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.inject.Singleton;

import org.acme.Api.BowlDbContext;

@Singleton
public class DbManager {

    public GameManager gameManager;

    @Inject
    BowlDbContext dbContext;

    public DbManager() {
        gameManager = new GameManager(this);
    }

}
