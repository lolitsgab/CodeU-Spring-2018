// Copyright 2017 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package codeu.model.data;

import java.time.Instant;
import java.util.UUID;
import java.util.List;
import java.util.ArrayList;

/** Class representing a registered user. */
public class User {
  private final UUID id;
  private final String name, password;
  private final Instant creation;
  private List<String> myConversations = new ArrayList<>();

  /**
   * Constructs a new User.
   *
   * @param id the ID of this User
   * @param name the username of this User
   * @param creation the creation time of this User
   * @param password password for the user
   * @param myConversations list of titles for conversations User is in
   */
  public User(UUID id, String name, String password, Instant creation, List<String> myConversation) {
    this.id = id;
    this.name = name;
    this.creation = creation;
    this.password = password;
    this.myConversations = new ArrayList<>(myConversation);
  }
  /** Returns the password of this User. */
  public String getPassword(){
    return password;
  }
  /** Returns the ID of this User. */
  public UUID getId() {
    return id;
  }

  /** Returns the username of this User. */
  public String getName() {
    return name;
  }

  /** Returns the creation time of this User. */
  public Instant getCreationTime() {
    return creation;
  }

  /** Returns the conversations the User is in. */
  public List<String> getMyConversations(){
    //System.out.println("conversations" + myConversations);
    return myConversations;
  }

  public void addConversation(String convoTitle){
    myConversations.add(convoTitle);
  //  System.out.println("Adding to convo"+ convoTitle);
    System.out.println(myConversations);

  }
}
