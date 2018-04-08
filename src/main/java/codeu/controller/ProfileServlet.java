/*
Profile servlet
*/
package codeu.controller;

import codeu.model.data.User;
import codeu.model.data.Profile;
import codeu.model.store.basic.ProfileStore;
import codeu.model.store.basic.UserStore;
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

  /**
   * Set up state for handling login-related requests. This method is only called when running in a
   * server, not when running in a test.
   */
  @Override
  public void init() throws ServletException {
    super.init();
    setUserStore(UserStore.getInstance());
    setProfileStore(ProfileStore.getInstance());
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



  @Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {
    String requestUrl = request.getRequestURI();
    String userProfile = requestUrl.substring("/users/".length());
    /*
    System.out.println("Profile Find doGet: " + userProfile);

    List<Profile> profiles = profileStore.getAllProfiles();
    request.setAttribute("profiless", profiles);

    System.out.println("All profiles: ");
    for (Profile p : profiles)
    {
      System.out.println(p.getUserName());
    }
    */
    Profile profile = profileStore.getUserProfile(userProfile);
    if (profile == null) {
      // couldn't find profile, redirect to home page (Idk where it should go)
      System.out.println("Profile was null in doGEt: " + profile);
      //response.sendRedirect("/login");
      return;
    }
    System.out.println("About Me GET=" + profile.getAboutMe());
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
/*
        List<Profile> profiles = profileStore.getAllProfiles();
        request.setAttribute("profiless", profiles);

        System.out.println("All profiles: ");
        for (Profile p : profiles)
        {
          System.out.println(p.getUserName());
        }

        System.out.println("HERE?" + userProfile);
        */
        if (profile == null) {
          // couldn't find profile, redirect to home page (Idk where it should go)
          System.out.println("Profile was null in doPost: " + profile);
          //response.sendRedirect("/users");
          return;
        }
        else{
        String profileContent = request.getParameter("profileContent");

        // this removes any HTML from the message content
        String cleanedProfileContent = Jsoup.clean(profileContent, Whitelist.none());
        System.out.println("Profile content = " + cleanedProfileContent);
        //profile.changeAboutMe(cleanedProfileContent);

        profileStore.changeProfile(profile.getUserName(), cleanedProfileContent);

        System.out.println("About Me in POST=" + profile.getAboutMe());
       }
       response.sendRedirect("/users/" + profile.getUserName());
  }
}
