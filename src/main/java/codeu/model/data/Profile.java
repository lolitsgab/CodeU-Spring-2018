package codeu.model.data;

import java.util.UUID;

/*
class representing a profile for a user
Profiles contain the user name and an about me blurb
*/

public class Profile{

  public final UUID id;
  public final String name;
  public String about_me;

  /**
   * Constructs a new Message.
   *
   * @param id the ID of this Message
   * @param name the username of this user
   * @param about_me the text content of the about_me blurb
   */
  public Profile(UUID id, String name, String about_me) {
    this.id = id;
    this.name = name;
    this.about_me = about_me;
  }

  /** Returns the ID of this Message. */
  public UUID getId() {
    return id;
  }

  /** Returns the name of the user*/
  public String getUserName(){
    return name;
  }
  /** Returns the text content of this Message. */
  public String getAboutMe() {
    return about_me;
  }
  public void changeAboutMe(String newAbout)
  {
    about_me = newAbout;
  }
}
