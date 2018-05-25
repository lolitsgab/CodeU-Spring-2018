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
<%@ page import="codeu.model.data.User" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.ProfileStore" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%@ page import="codeu.model.store.basic.ConversationStore" %>
<%@ page import="codeu.model.store.basic.MessageStore" %>

<%
Profile profile = (Profile) request.getAttribute("profile");
String profileName = (String) request.getAttribute("profileName");
User profileUser = (User) request.getAttribute("profileUser");
ConversationStore convoStore = (ConversationStore) request.getAttribute("convoStore");
%>
<!DOCTYPE html>
<html >
<head>
  <!-- Site made with Mobirise Website Builder v4.7.1, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v4.7.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="/assets/images/logo2.png" type="image/x-icon">
  <meta name="description" content="Web Site Builder Description">
  <title>Profile </title>
  <link rel="stylesheet" href="/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
  <link rel="stylesheet" href="/assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="/assets/tether/tether.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="/assets/theme/css/style.css">
  <link rel="stylesheet" href="/assets/mobirise/css/mbr-additional.css" type="text/css">

  <script>
    // scroll the chat div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('messages');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    };
  </script>

</head>
<body onload="scrollChat()">
  <%@ include file = "header.jsp" %>

<section class="engine"><a href="https://mobirise.ws/i">build your own website</a></section><section class="cid-qPqDt9J72L mbr-fullscreen" data-bg-video="https://www.youtube.com/watch?v=Q7tGuUz8_0s" id="header15-k">



    <div class="mbr-overlay" style="opacity: 0.5; background-color: rgb(7, 59, 76);"></div>

    <div class="container align-center">
<div >
  <div class="mbr-white col-lg-8 col-md-7 container align-center" id="container">
  <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1"><%=profile.getUserName()%>'s Profile Page!</h1>
  <hr/>
  <p class="mbr-text pb-3 mbr-fonts-style display-5"><strong>
     About <%= profile.getUserName() %> </strong></p>

  <p class="mbr-text pb-3 mbr-fonts-style display-5" id = "profileInfo"> <%= profile.getAboutMe() %></p>

  <% if(request.getSession().getAttribute("user") != null && request.getSession().getAttribute("user").equals(profileName) ){ %>
      <br/>
      <form action="/users/<%= profile.getUserName() %>" method="POST">
      <p class="mbr-text pb-3 mbr-fonts-style display-5" ><strong>Edit your profile here! (only you can see this) </strong></p>
      <textarea rows="4" cols="100" id ="aboutMeText" name = "profileContent">
<%=profile.getAboutMe() %>
      </textarea>
      <br/>

      <button type="submit" name = "action" class="btn btn-sm btn-secondary display-4" value = "changeProfile" onclick= "newProfile()">Update</button>
      <p id = "test"> </p>
    </form>
    <script>
      function newProfile(){
      document.getElementById("profileInfo").innerHTML = document.getElementById("aboutMeText").value;
      }
    </script>
  <% } %>

  <hr/>


  <p class="mbr-text pb-3 mbr-fonts-style display-5"><strong> <%= profile.getUserName() %>'s Sent Messages</strong></p>
  <div id="messages" align="left" style="background: white; height: 62vh; border: 2px solid black; overflow-y: scroll">
    <ul>
    <%
    List<Message> messages = (List<Message>) request.getAttribute("messages");
    for(Message message : messages) {
      Instant instant = message.getCreationTime();
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E MMM dd HH:mm:ss zz y").withLocale(Locale.US).withZone(ZoneId.systemDefault());
      String time = formatter.format(instant);
    %>
    <li style="color: black"><strong><%= time %>: </strong><%= message.getContent() %> </li>
    <%
    }
    %>
    </ul>
  </div>
  <hr/>


    <% if(request.getSession().getAttribute("user") != null && !profile.getUserName().equals(request.getSession().getAttribute("user"))) { %>
    <form action="/users/<%= profile.getUserName() %>" method="POST">
      <button type = "submit" name = "action" class="btn btn-sm btn-secondary display-4"value = "directMessage" onclick = "directMessage()"> Message Me! </button>
      <script>
      function directMessage(){
        document.getElementById("demo").innerHTML = "direct message clicked";
      }
      </script>
    </form>
    <hr/>
    <% } else if(!profile.getUserName().equals(request.getSession().getAttribute("user"))) { %>
    <p><strong><a href="/login" style="color: white; font-weight: bold; text-decoration: underline">Login</a> to message <%= profile.getUserName() %></strong></p>
    <hr/>
    <% } %>

</div>
</section>


  <script src="/assets/web//assets/jquery/jquery.min.js"></script>
  <script src="/assets/tether/tether.min.js"></script>
  <script src="/assets/popper/popper.min.js"></script>
  <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="/assets/smoothscroll/smooth-scroll.js"></script>
  <script src="/assets/touchswipe/jquery.touch-swipe.min.js"></script>
  <script src="/assets/ytplayer/jquery.mb.ytplayer.min.js"></script>
  <script src="/assets/vimeoplayer/jquery.mb.vimeo_player.js"></script>
  <script src="/assets/dropdown/js/script.min.js"></script>
  <script src="/assets/theme/js/script.js"></script>


</body>
</html>
