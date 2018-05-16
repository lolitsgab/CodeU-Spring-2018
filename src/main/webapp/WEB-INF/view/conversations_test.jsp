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
              <meta name="description" content="">
                <title>Home</title>
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
                                  <section class="engine"><a href="https://mobirise.ws/h">make your own website</a></section><section class="timeline2 cid-qRokDn3vyO" id="timeline2-1g">
                                  <div class="container align-center">
                                    <h2 class="mbr-section-title pb-3 mbr-fonts-style display-2">
                                      Conversations
                                    </h2>

                                    <div class="form-container">
                                        <div class="media-container-column" data-form-type="formoid">
                                          <% if(request.getSession().getAttribute("user") != null){ %>
                                          <h2 class="mbr-section-title pb-3 mbr-fonts-style display-5">
                                            Create a new Conversation
                                          </h2>
                                            <form class="mbr-form" action="/conversations" method="POST">

                                                    <div class="form-group">
                                                        <input type="text" class="form-control px-3" name="conversationTitle" placeholder="" required="" id="conversationTitle">
                                                    </div>
                                                    <span class="input-group-btn"><button href="" type="submit" class="btn btn-secondary btn-form display-4">Create</button></span>
                                            </form>
                                        </div>
                                      <% } %>

                                    <h3 class="mbr-section-subtitle pb-5 mbr-fonts-style display-5">
                                      Here are all the convesations including you.
                                    </h3>

                                    <div class="container timelines-container" mbri-timelines="">
                                      <% int i = 0;
                                      List<Conversation> conversations = (List<Conversation>) request.getAttribute("conversations");

                                      if(conversations == null || conversations.isEmpty()){
                                        %>
                                        <p>Create a conversation to get started.</p>
                                        <%
                                      }
                                      else{

                                        for(int j = conversations.size()-1; j >= 0; --j){
                                          Conversation conversation = conversations.get(j);
                                          if(i%2 == 0)
                                          {%>
                                          <div class="row timeline-element reverse separline">
                                            <span class="iconsBackground">
                                              <span class="mbri-pages mbr-iconfont"></span>
                                            </span>
                                            <div class="col-xs-12 col-md-6 align-left">
                                              <div class="timeline-text-content">
                                                <h4 class="mbr-timeline-title pb-3 mbr-fonts-style display-5">
                                                  <a href="/chat/<%= conversation.getTitle() %>">
                                                    <%= conversation.getTitle() %></a>
                                                </h4>
                                                <p class="mbr-timeline-text mbr-fonts-style display-7">
                                                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam erat libero, bibendum in libero tempor, luctus volutpat ligula. Integer fringilla porttitor pretium. Nam erat felis, iaculis id justo ut, ullamcorper feugiat elit. Proin vel lectus auctor, porttitor ligula vitae, convallis leo. In eget massa elit.
                                                </p>
                                              </div>
                                            </div>
                                          </div>
                                          <%}else{%>

                                          <div class="row timeline-element  separline">
                                            <span class="iconsBackground">
                                              <span class="mbri-responsive mbr-iconfont"></span>
                                            </span>
                                            <div class="col-xs-12 col-md-6 align-left ">
                                              <div class="timeline-text-content">
                                                <h4 class="mbr-timeline-title pb-3 mbr-fonts-style display-5">
                                                  <a href="/chat/<%= conversation.getTitle() %>">
                                                    <%= conversation.getTitle() %></a>
                                                </h4>
                                                <p class="mbr-timeline-text mbr-fonts-style display-7">
                                                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam erat libero, bibendum in libero tempor, luctus volutpat ligula. Integer fringilla porttitor pretium. Nam erat felis, iaculis id justo ut, ullamcorper feugiat elit. Proin vel lectus auctor, porttitor ligula vitae, convallis leo. In eget massa elit.
                                                </p>
                                              </div>
                                            </div>
                                          </div>
                                          <%}%>
                                          <%i = i+1;}}%>

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
