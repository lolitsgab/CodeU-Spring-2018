package codeu.controller;

import codeu.model.data.User;
import codeu.model.data.Profile;
import codeu.model.store.basic.UserStore;
import codeu.model.store.basic.ProfileStore;
import java.io.IOException;
import java.time.Instant;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;
import java.util.List;
import java.util.ArrayList;

/**
* Servlet class responsible for user registration.
*/
public class RegisterServlet extends HttpServlet {

  /**
   * Store class that gives access to Users.
   */
  private UserStore userStore;

  /**
  * Store class that gives access to Profiles.
  */
  private ProfileStore profileStore;

  /**
   * Set up state for handling registration-related requests. This method is only called when
   * running in a server, not when running in a test.
   */
  @Override
  public void init() throws ServletException {
    super.init();
    setUserStore(UserStore.getInstance());
    setProfileStore(ProfileStore.getInstance());
  }

  /**
   * Sets the UserStore used by this servlet. This function provides a common setup method
   * for use by the test framework or the servlet's init() function.
   */
  void setUserStore(UserStore userStore) {
    this.userStore = userStore;
  }

  /**
   * Sets the ProfileStore used by this servlet. This function provides a common setup method
   * for use by the test framework or the servlet's init() function.
   */
  void setProfileStore(ProfileStore profileStore) {
    this.profileStore = profileStore;
  }


  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
     throws IOException, ServletException {

   request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
  }

  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
     throws IOException, ServletException {

   String username = request.getParameter("username");
   String password = request.getParameter("password");
   String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());

   if (!username.matches("[\\w*\\s*]*")) {
     request.setAttribute("error", "Please enter only letters, numbers, and spaces.");
     request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
     return;
   }

   if (userStore.isUserRegistered(username)) {
     request.setAttribute("error", "That username is already taken.");
     request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
     return;
   }

   if (password.length() < 6) {
     request.setAttribute("error", "The password must be at least 6 characters long.");
     request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
     return;
   }

   List<String> myConversations = new ArrayList<>();

   User user = new User(UUID.randomUUID(), username, passwordHash, Instant.now(), myConversations);
   userStore.addUser(user);

   /*
   Adds the user to the profileStore
   */
   Profile profile = new Profile( user.getId(), user.getName(), "");
   profileStore.addProfile(profile);

   response.sendRedirect("/login");
  }
}
