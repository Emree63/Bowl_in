package org.acme;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;

@QuarkusTest
public class UserControllerTest {

    @Test
    public void testUserEndpoint() {
        given()
                .when().get("/users/1")
                .then()
                .statusCode(200);
    }

}