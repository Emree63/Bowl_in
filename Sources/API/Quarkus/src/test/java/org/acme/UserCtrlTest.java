// package org.acme;

// import java.util.List;

// import org.acme.Api.controllers.UserController;
// import org.acme.Api.service.UserService;
// import org.acme.Hibernates.entities.UserEntity;

// @ExtendWith(MockitoExtension.class)
// public class UserCtrlTest {
// @Mock
// private UserService userService;

// @InjectMocks
// private UserController userController;

// @TestFactory
// Stream<DynamicTest> shouldReturnUserById() {
// List<UserEntity> users = Arrays.asList(
// new UserEntity(1L, "John", "password"),
// new UserEntity(2L, "Jane", "password"));

// return DynamicTest.stream(
// users.iterator(),
// user -> "should return user with id " + user.getId(),
// user -> {
// // Given
// Mockito.when(userService.findByBowlinId(user.getId()))
// .thenReturn(CompletableFuture.completedFuture(user));

// // When
// Uni<Response> response = userController.getUserById(user.getId());

// // Then
// response.subscribe().with(result -> {
// assertEquals(Response.Status.OK.getStatusCode(), result.getStatus());
// assertEquals(user, result.getEntity());
// });
// });
// }

// @Test
// void shouldReturn404IfUserNotFound() {
// // Given
// Long id = 1L;
// Mockito.when(userService.findByBowlinId(id)).thenReturn(CompletableFuture.completedFuture(null));

// // When
// Uni<Response> response = userController.getUserById(id);

// // Then
// response.subscribe().with(result -> {
// assertEquals(Response.Status.NOT_FOUND.getStatusCode(), result.getStatus());
// });
// }
// }
