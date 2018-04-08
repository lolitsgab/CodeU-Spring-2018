
package codeu.model.store.basic;

import codeu.model.data.Profile;
import codeu.model.store.persistence.PersistentStorageAgent;
import java.util.ArrayList;
import java.util.List;

/**
 * Store class that uses in-memory data structures to hold values and automatically loads from and
 * saves to PersistentStorageAgent. It's a singleton so all servlet classes can access the same
 * instance.
 */
public class ProfileStore{

  /** Singleton instance of ProfileStore. */
  private static ProfileStore instance;

  /**
   * Returns the singleton instance of ProfileStore that should be shared between all servlet
   * classes. Do not call this function from a test; use getTestInstance() instead.
   */
  public static ProfileStore getInstance() {
    if (instance == null) {
      instance = new ProfileStore(PersistentStorageAgent.getInstance());
    }
    return instance;
  }

  /**
   * Instance getter function used for testing. Supply a mock for PersistentStorageAgent.
   *
   * @param persistentStorageAgent a mock used for testing
   */
  public static ProfileStore getTestInstance(PersistentStorageAgent persistentStorageAgent) {
    return new ProfileStore(persistentStorageAgent);
  }

  /**
   * The PersistentStorageAgent responsible for loading Profile from and saving Profile to
   * Datastore.
   */
  private PersistentStorageAgent persistentStorageAgent;

  /** The in-memory list of Profiles. */
  private List<Profile> profiles;

  /** This class is a singleton, so its constructor is private. Call getInstance() instead. */
  private ProfileStore(PersistentStorageAgent persistentStorageAgent) {
    this.persistentStorageAgent = persistentStorageAgent;
    profiles = new ArrayList<>();
  }


  /** Add a newprofile to the current set of profiles */
  public void addProfile(Profile profile) {
    profiles.add(profile);
    persistentStorageAgent.writeThrough(profile);
  }

  /** Find and return the Profile with the given username. */
  public Profile getUserProfile(String username) {
    for (Profile profile : profiles) {
      if (profile.getUserName().equals(username)) {
        return profile;
      }
    }
    return null;
  }

 /** change the about_me in profile */
  public void changeProfile(String username, String newProfile){
    Profile profile = getUserProfile(username);
    profile.changeAboutMe(newProfile);
    persistentStorageAgent.writeThrough(profile);
  }

  /** Access the current set of profiles known to the application. */
  public List<Profile> getAllProfiles() {
    return profiles;
  }

  /** Sets the List of Profiles stored by this ProfileStore. */
  public void setProfiles(List<Profile> profiles) {
    this.profiles = profiles;
  }
}
