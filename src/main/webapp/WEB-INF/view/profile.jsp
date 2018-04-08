<%--
Profile page
--%>

<%@ page import="codeu.model.data.Profile" %>
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
Edit Profile information would go here
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
  <% }
  else{ %>
    <a> Session User: <%= request.getSession().getAttribute("user") %></a>
    <a> Profile: <%=  profileName %> </a>
  <% } %>
  <hr/>
</div>
</body>
</html>
