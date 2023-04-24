package org.acme.api;

import javax.inject.Inject;
import javax.inject.Singleton;

import org.acme.api.service.*;

@Singleton
public class BowlDbContext {
    @Inject
    public GameRepository gameRepository;
    @Inject
    public RoundRepository roundRepository;
    @Inject
    public UserRepository userRepository;
    @Inject
    public ParticipeRepository participeRepository;
    @Inject
    public ThrowRepository throwRepository;
}
