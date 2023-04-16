package org.acme.model;

import java.util.Date;
import java.util.List;
import java.util.UUID;

public class Game {
    private UUID id;
    private Date time;
    private UUID winner;
    private int nbPoints;
    private Boolean isFinished;
}
