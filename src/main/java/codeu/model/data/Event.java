package codeu.mode.data;

import java.time.Instant;
import java.util.UUID;

/** Class representing an activity feed event. */
public class Event {
  private final UUID id;
  private final UUID eventUser;
  private final String eventType; /** Later make into subclass if we want */
  private final Instant creation;

  /**
   * Constructs a new Event.
   *
   * @param id the ID of this Event
   * @param eventUser the ID of the User associated with this Event
   * @param eventType the type of this Event
   * @param creation the creation time of this Event
   */
  public Event(UUID id, UUID eventUser, String eventType, Instant creation) {
    this.id = id;
    this.eventUser = eventUser;
    this.eventType = eventType;
    this.creation = creation;
  }

  /** Returns the ID of this Event. */
  public UUID getId() {
    return id;
  }

  /** Returns the ID of the User associated with this Event. */
  public UUID getEventUserId() {
    return eventUser;
  }

  /** Returns the type of this Event. */
  public String getEventType() {
    return eventType;
  }

  /** Returns the creation time of this Event. */
  public Instant getCreationTime() {
    return creation;
  }

}
