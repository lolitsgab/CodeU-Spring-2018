<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%
Conversation conversation = (Conversation) request.getAttribute("conversation");
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>
<!DOCTYPE html>
<html >
  <head>
    <!-- Site made with Mobirise Website Builder v4.7.1, https://mobirise.com -->
    <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="generator" content="Mobirise v4.7.1, mobirise.com">
          <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
            <link rel="shortcut icon" href="/assets/images/logo2.png" type="/image/x-icon">
              <meta name="description" content="">
                <title>Home</title>
                <link rel="stylesheet" href="/assets/web/assets/mobirise-icons/mobirise-icons.css">
                  <link rel="stylesheet" href="/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
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
                                    var chatDiv = document.getElementById('chat');
                                    chatDiv.scrollTop = chatDiv.scrollHeight;
                                  };
                                </script>

                                </head>
                                <body onload="scrollChat()">
                                  <%@ include file="header.jsp" %>
                                  <section class="engine"><a href="https://mobirise.ws/h">make your own website</a></section><section class="timeline2 cid-qRokDn3vyO" id="timeline2-1g">
                                  <div class="container align-center">
                                    <h2 class="mbr-section-title pb-3 mbr-fonts-style display-2">
                                      <%=conversation.getTitle()%>
                                    </h2>
                                    <h3 class="mbr-section-subtitle pb-5 mbr-fonts-style display-5">
                                      Write below!
                                    </h3>

                                    <div id="chat" align="left" style="background: white; height: 62vh; border: 2px solid black; overflow-y: scroll">
                                      <ul>
                                        <%
                                        for (Message message : messages) {
                                          String author = UserStore.getInstance()
                                          .getUser(message.getAuthorId()).getName();
                                          %>
                                          <li><strong><a href="/users/<%= author %>" style="color: black"><%= author %>:</a></strong> <%= message.getContent() %></li>
                                          <%
                                        }
                                        %>
                                      </ul>
                                    </div>

                                    <% if (request.getSession().getAttribute("user") != null) { %>
                                    <form action="/chat/<%= conversation.getTitle() %>" method="POST">
                                        <input type="text" name="message" style="width:100%; margin-top: 10px; overflow-y: scroll;">
                                        <br/>
                                        <a class="btn btn-sm btn-primary display-4" href="" style="
                                        margin-bottom: 3px;
                                        width: 100%;"><span></span>Send</a>
                                    </form>
                                    <% } else { %>
                                      <p><a href="/login">Login</a> to send a message.</p>
                                    <% } %>
                                  </div>

                                </section>



                                <script src="assets/web/assets/jquery/jquery.min.js"></script>
                                <script src="assets/popper/popper.min.js"></script>
                                <script src="assets/tether/tether.min.js"></script>
                                <script src="assets/bootstrap/js/bootstrap.min.js"></script>
                                <script src="assets/smoothscroll/smooth-scroll.js"></script>
                                <script src="assets/dropdown/js/script.min.js"></script>
                                <script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
                                <script src="assets/theme/js/script.js"></script>


                              </body>
                            </html>
