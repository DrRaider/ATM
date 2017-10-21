package raider.project.EfreiCine.service;

import java.util.List;
import java.net.URI;
import javax.ws.rs.core.Response;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
//import javax.ws.rs.PUT;
//import javax.ws.rs.DELETE;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.glassfish.jersey.server.mvc.Viewable;
import org.glassfish.jersey.server.mvc.Template;

import raider.project.EfreiCine.model.User;
import raider.project.EfreiCine.dao.UserDAO;

@Component
@Path("/users")
public class UserService {

    @Autowired
    private UserDAO userDAO;

    // Basic CRUD operations for User service

    // http://localhost:8080/rest/users/
    @GET
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_HTML)
    @Template(name="/users")
    public List<User> getAllUsers() {
        return userDAO.getAll();
    }

    // http://localhost:8080/rest/users/showForm
    @GET
    @Path("showForm")
    @Produces(MediaType.TEXT_HTML)
    public Viewable showForm() {
        return new Viewable("/userForm");
    }

    // http://localhost:8080/rest/users/get/1
    @GET
    @Path("get/{id}")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_HTML)
    @Template(name="/userForm")
    public User getUser(@PathParam("id") int userId) {
        return userDAO.get(userId);
    }

    // http://localhost:8080/rest/users/add
    @POST
    @Path("add")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_HTML)
    @Template(name="/users")
    public List<User> createUser(@FormParam("username") String username,
                                 @FormParam("password") String password) {
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        userDAO.insertNew(newUser);
        return getAllUsers();
    }

    // http://localhost:8080/rest/users/update
    @POST // should use @PUT
    @Path("update")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_HTML)
    @Template(name="/users")
    public List<User> updateUser(@FormParam("id") String userId,
                                 @FormParam("username") String username,
                                 @FormParam("password") String password) {
        User user = new User();
        user.setId(userId);
        user.setUsername(username);
        user.setPassword(password);
        userDAO.update(user);
        return getAllUsers();
    }

    // http://localhost:8080/rest/users/delete/1
    @GET // should use @DELETE
    @Path("delete/{id}")
    public Response deleteUser(@PathParam("id") String userId) throws Exception {
        User user = new User();
        user.setId(userId);
        userDAO.remove(user);
        return Response.temporaryRedirect(new URI("/EfreiCine/rest/users")).build();
    }
}