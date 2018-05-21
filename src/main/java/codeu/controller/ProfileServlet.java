/*
Profile servlet
*/
package codeu.controller;

import codeu.model.data.User;
import codeu.model.data.Profile;
import codeu.model.data.Conversation;
import codeu.model.store.basic.ProfileStore;
import codeu.model.store.basic.UserStore;
import codeu.model.store.basic.ConversationStore;
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

  /** Store calls that gives access to Profiles.*/
  private ProfileStore profileStore;

  /** Store calls that gives access to Conversations.*/
  private ConversationStore conversationStore;

  /**
   * Set up state for handling login-related requests. This method is only called when running in a
   * server, not when running in a test.
   */
  @Override
  public void init() throws ServletException {
    super.init();
    setUserStore(UserStore.getInstance());
    setProfileStore(ProfileStore.getInstance());
    setConversationStore(ConversationStore.getInstance());
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
   * Sets the ConversationStore used by this servlet. This function provides a common setup method
   * for use by the test framework or the servlet's init() function.
   */
  void setConversationStore(ConversationStore conversationStore) {
    this.conversationStore = conversationStore;
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

    User profileUser = userStore.getUser(profile.getUserName());

    request.setAttribute("profile", profile);
    request.setAttribute("profileName", profile.getUserName());
    request.setAttribute("profileUser", profileUser);
    request.setAttribute("convStore", conversationStore);

		request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request,response);
  }


  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

        String requestUrl = request.getRequestURI();
        String userProfile = (String) requestUrl.substring("/users/".length());
        //System.out.println("Profile Find: " + userProfile);
        Profile profile = profileStore.getUserProfile(userProfile);

        User profileUser = userStore.getUser(profile.getUserName());

        String action = request.getParameter("action");

        // if the user is logged in on thier own profile when they click update profile this if will execute
        if ("changeProfile".equals(action)) {
          System.out.println("changing profile");

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
       // if the user is logged in as a different user this if statement will execute
       else if ("directMessage".equals(action)){
        // System.out.println("direct messsage");
         String username = (String) request.getSession().getAttribute("user");
         if (username == null) {
           // user is not logged in, don't let them create a conversation
           response.sendRedirect("/users/" + profile.getUserName());
           return;
         }

         User user = userStore.getUser(username);
         if (user == null) {
           // user was not found, don't let them create a conversation
           System.out.println("User not found: " + username);
            response.sendRedirect("/users/" + profile.getUserName());
           return;
         }


         String conversationTitle = username + "-" + profile.getUserName();
         String reverseTitle = profile.getUserName() + "-" + username;

         if (conversationStore.isTitleTaken(conversationTitle)) {
           // conversation title is already taken, just go into that conversation instead of creating a new one
           response.sendRedirect("/chat/" + conversationTitle);
           return;
         }
         else if (conversationStore.isTitleTaken(reverseTitle)) {
           // the reverse of the conversation title is already taken, just go into that conversation instead of creating new one
           response.sendRedirect("/chat/" + reverseTitle);
           return;
         }

         Conversation conversation =
             new Conversation(UUID.randomUUID(), user.getId(), conversationTitle, Instant.now(),true);


         //System.out.print("adding Conversation" );
         conversationStore.addConversation(conversation);

         user.addConversation(conversation.getTitle());
         profileUser.addConversation(conversation.getTitle());

         response.sendRedirect("/chat/" + conversationTitle);

       }
       else {
         System.out.println("neither button was clicked");
         response.sendRedirect("/users/" + profile.getUserName());
       }
  }
}
