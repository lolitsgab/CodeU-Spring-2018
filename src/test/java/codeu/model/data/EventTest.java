package codeu.model.data;

import java.time.Instant;
import java.util.UUID;
import org.junit.Assert;
import org.junit.Test;

public class EventTest {

  @Test
  public void testCreate() {
    UUID id = UUID.randomUUID();
    UUID eventUser = UUID.randomUUID();
    String eventType = "new_msg";
    Instant creation = Instant.now();
    String convTitle = "Conversation_42";
    String msgContent = "hello world";

    Event event = new Event(id, eventUser, eventType, creation, convTitle, msgContent);

    Assert.assertEquals(id, event.getId());
    Assert.assertEquals(eventUser, event.getEventUserId());
    Assert.assertEquals(eventType, event.getEventType());
    Assert.assertEquals(creation, event.getCreationTime());
    Assert.assertEquals(convTitle, event.getConvTitle());
    Assert.assertEquals(msgContent, event.getMsgContent());
  }
}
