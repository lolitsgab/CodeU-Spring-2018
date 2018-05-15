/*
Profile servlet
*/
package codeu.controller;

import codeu.model.data.User;
import codeu.model.data.Profile;
import codeu.model.data.Message;
import codeu.model.store.basic.ProfileStore;
import codeu.model.store.basic.UserStore;
import codeu.model.store.basic.MessageStore;
import java.util.List;
import java.io.IOException;
import java.time.Instant;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

public class ProfileServlet extends HttpServlet {

  /** Store class that gives access to Users. */
  private UserStore userStore;

  /** Store class that gives access to Profiles. */
  private ProfileStore profileStore;

  /** Store class that gives access to Messages. */
  private MessageStore messageStore;

  /**
   * Set up state for handling login-related requests. This method is only called when running in a
   * server, not when running in a test.
   */
  @Override
  public void init() throws ServletException {
    super.init();
    setUserStore(UserStore.getInstance());
    setProfileStore(ProfileStore.getInstance());
    setMessageStore(MessageStore.getInstance());
  }

  /**
   * Sets the UserStore used by this servlet. This function provides a common setup method for use
   * by the test framework or the servlet's init() function.
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
  /**
   * Sets the MessageStore used by this servlet. This function provides a common setup method
   * for use by the test framework or the servlet's init() function.
   */
  void setMessageStore(MessageStore messageStore) {
    this.messageStore = messageStore;
  }


  @Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    String requestUrl = request.getRequestURI();
    String userProfile = requestUrl.substring("/users/".length());

    Profile profile = profileStore.getUserProfile(userProfile);
    if (profile == null) {
      // couldn't find profile, redirect to login (Idk where it should go)
      System.out.println("Profile was null in doGEt: " + profile);
      response.sendRedirect("/login");
      return;
    }
    
    // Retrieve all the messages by the user
    User user = userStore.getUser(userProfile);
    UUID authorId = user.getId();
    List<Message> messages = messageStore.getMessagesByUser(authorId);
    request.setAttribute("messages", messages);
    
    request.setAttribute("profile", profile);
    request.setAttribute("profileName", profile.getUserName());
    request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request,response);
  }


  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

        String requestUrl = request.getRequestURI();
        String userProfile = requestUrl.substring("/users/".length());
        System.out.println("Profile Find: " + userProfile);

        Profile profile = profileStore.getUserProfile(userProfile);

        if (profile == null) {
          // couldn't find profile, redirect to login (Idk where it should go)
          System.out.println("Profile was null in doPost: " + profile);
          response.sendRedirect("/login"); // not sure if we want this to to display error message
          return;
        }
        else{
        String profileContent = request.getParameter("profileContent");

        // this removes any HTML from the message content
        String cleanedProfileContent = Jsoup.clean(profileContent, Whitelist.none());

        profileStore.changeProfile(profile.getUserName(), cleanedProfileContent);

       }
       response.sendRedirect("/users/" + profile.getUserName());
  }
}
