package benchmark;

import static io.gatling.javaapi.core.CoreDsl.*;
import static io.gatling.javaapi.http.HttpDsl.*;

import io.gatling.javaapi.core.*;
import io.gatling.javaapi.http.*;

import java.util.concurrent.ThreadLocalRandom;

public class UserSimulation extends Simulation{
    HttpProtocolBuilder httpProtocol = http.baseUrl("https://localhost:8080");
    ChainBuilder crud =
            tryMax(2)
                .on(
                    exec(http("Get All Users").get("/users"))
                    .pause(1)
                    .exec(http("Get User").get("/users/1"))
                    .pause(1)
                    .exec(http("Create User").post("/users")
                            .formParam("username", "John Doe")
                            .formParam("password", "POST PASS")
                            .check(
                                    status().is(
                                            session -> 200 + ThreadLocalRandom.current().nextInt(2)
                                    )
                            ))
                    .pause(1)
                    .exec(http("Update User").put("/users/2")
                            .formParam("username", "John Doe")
                            .formParam("password", "POST UPDATE")
                            .check(
                                    status().is(
                                            session -> 200 + ThreadLocalRandom.current().nextInt(2)
                                    )
                            ))
                    .pause(1)
                    .exec(http("Delete User").delete("/users/3"))
                )
                .exitHereIfFailed();
    ScenarioBuilder users = scenario("Users").exec(crud);

    {
        setUp(users.injectOpen(rampUsers(10).during(10))).protocols(httpProtocol);
    }


}
