<%--
Profile page
--%>

<!DOCTYPE html>
<html>
<head>
  <title>Profile Page</title>
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
  <h1>Test Profile Page</h1>
<%-- This will change currently just testing out to see if the users is logged
in what a sample profile page might look like but I know this part isn't correct yet

  <%if ( request.getAttribute("current_user")  == request.getSession().getAttribute("user")){ %>
  <li> I am the current user </li>
  <a> Session User: <%= request.getSession().getAttribute("user") %></a>
  <a> Current User: <%=  request.getAttribute("current_user") %> </a>
  <%}
  else{ %>
  <li> I am not the current user </li>
  <a> Session User: <%= request.getSession().getAttribute("user") %></a>
  <a> Current User: <%=  request.getAttribute("current_user") %> </a>
  <%} %>
--%>
  <% if(request.getSession().getAttribute("user") != null){ %>
    <a><strong> About <%= request.getSession().getAttribute("user") %> </strong></a>
    <hr/>
    <li> <strong>Edit your profile here! </strong></li>
    <textarea rows="4" cols="100">
Edit Profile information would go here
  </textarea>
  <br/>
  <button type="submit">Submit</button>
  <hr/>

  <% }
  else{ %>
    <li> This is a test profile page not linked to anyone specific please log in and come back to see what page might look like. </li>
    <a href="/login">Login</a>
    <a href="/register">Register</a>
  <% } %>
</div>
</body>
</html>
