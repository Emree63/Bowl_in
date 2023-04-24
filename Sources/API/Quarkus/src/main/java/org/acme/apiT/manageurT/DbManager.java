package org.acme.api.manager;

import javax.inject.Inject;
import javax.inject.Singleton;

import org.acme.api.BowlDbContext;

@Singleton
public class DbManager {

    public GameManager gameManager;

    @Inject
    BowlDbContext dbContext;

    public DbManager() {
        gameManager = new GameManager(this);
    }

}
