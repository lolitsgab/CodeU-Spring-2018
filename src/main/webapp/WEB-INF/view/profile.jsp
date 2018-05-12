<%--
Profile page
--%>

<%@ page import="java.util.List" %>
<%@ page import="java.time.Instant" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.format.FormatStyle" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.util.Locale" %>
<%@ page import="codeu.model.data.Profile" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.ProfileStore" %>
<%
Profile profile = (Profile) request.getAttribute("profile");
String profileName = (String) request.getAttribute("profileName");
%>
<!DOCTYPE html>
<html>
<head>
  <title><%=profile.getUserName()%></title>
  <link rel="stylesheet" href="/css/main.css">
    <style>
      label {
        display: inline-block;
        width: 100px;
      }
      #messages {
        background-color: white;
	height: 500px;
	overflow-y: scroll;
      }
    </style>
</head>

<body>
  <%@ include file = "header.jsp" %>
  <div id="container">
  <h1><%=profile.getUserName()%>'s Profile Page</h1>
  <hr/>
  <a><strong> About <%= profile.getUserName() %> </strong></a>
  <p id = "profileInfo"> <%= profile.getAboutMe() %></p>
  <br/>

  <% if(request.getSession().getAttribute("user") != null && request.getSession().getAttribute("user").equals(profileName) ){ %>
      <form action="/users/<%= profile.getUserName() %>" method="POST">
      <p><strong>Edit your profile here! (only you can see this) </strong></p>
      <textarea rows="4" cols="100" id ="aboutMeText" name = "profileContent">
<%=profile.getAboutMe() %>
    </textarea>
    <br/>
    <button type="submit" onclick= "newProfile()">Update</button>
    <p id = "test"> </p>
 </form>

 <script>
  function newProfile(){
   document.getElementById("profileInfo").innerHTML = document.getElementById("aboutMeText").value;
 }
 </script>
  <% } %>
  <hr/>

  <a><strong> <%= profile.getUserName() %>'s Sent Messages</strong></a>
  <div id="messages">
    <ul>
    <%
    List<Message> messages = (List<Message>) request.getAttribute("messages");
    for(Message message : messages) {
      Instant instant = message.getCreationTime();
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E MMM dd HH:mm:ss zz y").withLocale(Locale.US).withZone(ZoneId.systemDefault());
      String time = formatter.format(instant);
    %>
    <li><strong><%= time %>: </strong><%= message.getContent() %> </li>
    <%
    }
    %>
    </ul>
  </div>
  <hr/>
</div>
</body>
</html>
