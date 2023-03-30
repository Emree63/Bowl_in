package org.acme;

import io.quarkus.test.junit.QuarkusTest;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;

@QuarkusTest
public class UserControllerTest {

    // @Test
    // public void testUserEndpoint() {
    // given()
    // .when().get("/users/1")
    // .then()
    // .statusCode(200);
    // }

    // @Test
    // @DisplayName("Test GET /users/{id}")
    // @ParameterizedTest(name = "Test with user ID {0}")
    // @CsvSource({
    // "2, Bob",
    // "3, Charlie"
    // })
    // public void testGetUserById(Long id, String expectedName) {
    // given()
    // .when().get("/users/{id}", id)
    // .then()
    // .statusCode(200)
    // .body("name", equalTo(expectedName));
    // }

}