package codeu.mode.data;

import java.time.Instant;
import java.util.UUID;

/** Class representing an activity feed event. */
public class Event {
  private final UUID id;
  private final UUID eventUser;
  private final String eventType; /** Later make into subclass if we want */
  private final Instant creation;
  private final String convTitle;
  private final String msgContent;

  /**
   * Constructs a new Event.
   *
   * @param id the ID of this Event
   * @param eventUser the ID of the User associated with this Event
   * @param eventType the type of this Event
   * @param creation the creation time of this Event
   * @param convTitle the title of the conversation created (null if not needed)
   * @param msgContent the text content of the message sent (null if not needed)
   */
  public Event(UUID id, UUID eventUser, String eventType, Instant creation,
      String convTitle, String msgContent) {
    this.id = id;
    this.eventUser = eventUser;
    this.eventType = eventType;
    this.creation = creation;
    this.convTitle = convTitle;
    this.msgContent = msgContent;
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

  /** Returns the title of the conversation created (null if not needed). */
  public String getConvTitle() {
    return convTitle;
  }

  /** Returns the text content of the message sent (null if not needed). */
  public String getMsgContent() {
    return msgContent;
  }

}
