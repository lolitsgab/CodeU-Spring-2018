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
<html >
<head>

  <!-- Site made with Mobirise Website Builder v4.7.1, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v4.7.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="assets/images/logo2.png" type="image/x-icon">
  <meta name="description" content="Web Site Maker Description">
    <title><%=profile.getUserName()%></title>
  <link rel="stylesheet" href="assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
  <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
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
<section class="engine"><a href="https://mobirise.ws/g">create your own website</a></section><section class="carousel slide testimonials-slider cid-qRpq5GfGFi" id="testimonials-slider1-1k">





    <div class="container text-center">
        <h2 class="pb-5 mbr-fonts-style display-2">
            <%=profile.getUserName()%></h2>

        <div class="carousel slide" data-ride="carousel" role="listbox">
            <div class="carousel-inner">


            <div class="carousel-item">
                    <div class="user col-md-8">
                        <div class="user_image">
                            <img src="assets/images/face3.jpg">
                        </div>
                        <div class="user_text pb-3">
                            <p class="mbr-fonts-style display-7">
                                <%=profile.getAboutMe() %></p>
                        </div>
                        <div class="user_name mbr-bold pb-2 mbr-fonts-style display-7">
                            NAME_PLACE_HOLDER</div>
                        <div class="user_desk mbr-light mbr-fonts-style display-7">Founding Member</div>
                        <%--  --%>
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
                        <%--  --%>
                    </div>
                </div></div>
                </a>
            </div>
        </div>
    </div>
</section>

<section class="mbr-section info2 cid-qRprox4ki5" id="info2-1m">




<%-- 
  <% if(request.getSession().getAttribute("user") != null) { %>
    <form action="/users/<%= profile.getUserName() %>" method="POST">
      <button type = "submit" name = "action" value = "directMessage" onclick = "directMessage()"> Message Me! </button>
      <script>
      function directMessage(){
        document.getElementById("demo").innerHTML = "direct message clicked";
      }
      </script>
    </form>
    <% } %> --%>





    <div class="container">
        <div class="row main justify-content-center">
            <div class="media-container-column col-12 col-lg-3 col-md-4">
              <% if(request.getSession().getAttribute("user") != null) { %>
                <div class="mbr-section-btn align-left py-4"><a class="btn btn-primary display-4" name = "action" value = "directMessage" onclick = "directMessage()">
                    <span class="mbri-preview mbr-iconfont"></span>Send Private Message</a></div>
                    <script>
                    function directMessage(){
                      document.getElementById("demo").innerHTML = "direct message clicked";
                    }
                    </script>
              <% } %>
            </div>
            <div class="media-container-column title col-12 col-lg-7 col-md-6">
                <h2 class="align-right mbr-bold mbr-white pb-3 mbr-fonts-style display-2">Want to contact me?</h2>
                <h3 class="mbr-section-subtitle align-right mbr-light mbr-white mbr-fonts-style display-5">Press the button besides me!</h3>
            </div>
        </div>
    </div>
</section>


  <script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/tether/tether.min.js"></script>
  <script src="assets/popper/popper.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/smoothscroll/smooth-scroll.js"></script>
  <script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
  <script src="assets/bootstrapcarouselswipe/bootstrap-carousel-swipe.js"></script>
  <script src="assets/mbr-testimonials-slider/mbr-testimonials-slider.js"></script>
  <script src="assets/dropdown/js/script.min.js"></script>
  <script src="assets/theme/js/script.js"></script>


</body>
</html>
