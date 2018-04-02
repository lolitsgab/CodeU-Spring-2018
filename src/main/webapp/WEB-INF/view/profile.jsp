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

  <% if(request.getSession().getAttribute("user") != null && request.getSession().getAttribute("user").equals(profileName) ){ %>
    <form action="/users/<%= profile.getUserName() %>" method="POST">
      <a><strong> About  <%= profileName %> </strong></a>
      <hr/>
      <li> <strong>Edit your profile here! </strong></li>
      <textarea rows="4" cols="100">
Edit Profile information would go here
    </textarea>
    <br/>
    <button type="submit">Submit</button>
    <hr/>
    <%-- when you hit the sumbit button goes into Get method not Post and thinks that the profiles are no longer similar --%>
 </form>

  <% }
  else{ %>
  <a><strong> About <%= profile.getUserName() %> </strong></a>
  <a> Session User: <%= request.getSession().getAttribute("user") %></a>
  <a> Profile: <%=  profileName %> </a>
  <hr/>
  <% } %>
</div>
</body>
</html>
