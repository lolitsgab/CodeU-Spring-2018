<%--
Profile page
--%>

<%@ page import="codeu.model.data.Profile" %>
<%@ page import="codeu.model.store.basic.ProfileStore" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%@ page import="codeu.model.data.User" %>
<%@ page import="codeu.model.store.basic.ConversationStore" %>

<%
Profile profile = (Profile) request.getAttribute("profile");
String profileName = (String) request.getAttribute("profileName");
User profileUser = (User) request.getAttribute("profileUser");
ConversationStore convoStore = (ConversationStore) request.getAttribute("convoStore");
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
      <button type="submit" name = "action" value = "changeProfile" onclick= "newProfile()">Update</button>
      <p id = "test"> </p>
    </form>
    <script>
      function newProfile(){
      document.getElementById("profileInfo").innerHTML = document.getElementById("aboutMeText").value;
      }
    </script>
  <% } %>

  <hr/>
  <% if(request.getSession().getAttribute("user") != null) { %>
    <form action="/users/<%= profile.getUserName() %>" method="POST">
      <button type = "submit" name = "action" value = "directMessage" onclick = "directMessage()"> Message Me! </button>
      <script>
      function directMessage(){
        document.getElementById("demo").innerHTML = "direct message clicked";
      }
      </script>
    </form>
    <% } %>



  <% for(int i = 0; i < profileUser.getMyConversations().size(); i+= 1 ) { %>
      <p><%= profileUser.getMyConversations().get(i)%> </p>
  <%}%>

  </div>

</body>
</html>
