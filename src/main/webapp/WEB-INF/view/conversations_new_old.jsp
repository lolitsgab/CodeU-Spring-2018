<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Conversation" %>

<!DOCTYPE html>
<html >
<head>
  <!-- Site made with Mobirise Website Builder v4.7.1, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v4.7.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="assets/images/logo2.png" type="image/x-icon">
  <meta name="description" content="Web Site Builder Description">
  <title>Conversations</title>
  <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
  <link rel="stylesheet" href="assets/tether/tether.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="assets/dropdown/css/style.css">
  <link rel="stylesheet" href="assets/theme/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">



</head>
<body>
<%@ include file = "header.jsp" %>
<section class="engine"><a href="https://mobirise.ws">Mobirise</a></section><section class="timeline1 cid-qPqNkSUr4F" id="timeline1-n">
<aside id="sidebar" class="column-left">


    <div class="container align-center">
        <h2 class="mbr-section-title pb-3 mbr-fonts-style display-2">Conversation Timeline</h2>
        <h3 class="mbr-section-subtitle pb-5 mbr-fonts-style display-5">
            These are all your conversations in chronological order</h3>
            <% if(request.getAttribute("error") != null){ %>
                <h2 style="color:red"><%= request.getAttribute("error") %></h2>
            <% } %>

            <% if(request.getSession().getAttribute("user") != null){ %>
              <h1>New Conversation</h1>
              <form action="/conversations" method="POST">
                  <div class="form-group">
                    <label class="form-control-label">Title:</label>
                  <input type="text" name="conversationTitle">
                </div>

                <button type="submit">Create</button>
              </form>

              <hr/>
            <% } %>

        <div class="container timelines-container" mbri-timelines="">

          <%
          List<Conversation> conversations = (List<Conversation>) request.getAttribute("conversations");
          if(conversations == null || conversations.isEmpty()){
          %>
            <p>Create a conversation to get started.</p>
          <%
          }
          else{

            for(Conversation conversation : conversations){
          %>
          <%--  --%>
          <div class="row timeline-element  separline">
              <div class="timeline-date-panel col-xs-12 col-md-6 align-right">
                  <div class="time-line-date-content">
                      <p class="mbr-timeline-date mbr-fonts-style display-5">
                          Saturday, April 17th</p>
                  </div>
              </div>
              <span class="iconBackground"></span>
              <div class="col-xs-12 col-md-6 align-left ">
                  <div class="timeline-text-content">
                      <h4 class="mbr-timeline-title pb-3 mbr-fonts-style display-5"><%= conversation.getTitle() %></h4>
                      <p class="mbr-timeline-text mbr-fonts-style display-7">Alison at 2:34 PM:<br>Yup!</p>
                  </div>
              </div>
          </div>
          <%--  --%>
          <%
            }
          %>
            </ul>
          <%
          }
          %>

        </div>
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
