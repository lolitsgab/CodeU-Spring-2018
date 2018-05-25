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
  <title>Register</title>
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


<section class="engine"><a href="https://mobirise.ws/m">drag and drop website maker</a></section><section class="cid-qPrDNGpZsa mbr-fullscreen" data-bg-video="https://www.youtube.com/watch?v=VsGH577CGDc" id="header15-11">



    <div class="mbr-overlay" style="opacity: 0.5; background-color: rgb(7, 59, 76);"></div>

    <div class="container align-right">
<div class="row">
    <div class="mbr-white col-lg-8 col-md-7 content-container">
        <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1">Join the family!</h1>
        <p class="mbr-text pb-3 mbr-fonts-style display-5">
            Once you register, you'll be able to connect with anyone you want! Finally, an app for you to chat and nothing more!</p>
    </div>
    <div class="col-lg-4 col-md-5">

    <div class="form-container">
        <div class="media-container-column" data-form-type="formoid">
	  <% if(request.getAttribute("error") != null){ %>
	    <h2 style="color:red"><%= request.getAttribute("error") %></h2>
	  <% } %>

            <form class="mbr-form" action="/register" method="POST">

                    <div class="form-group">
                        <input type="username" class="form-control px-3" name="username" data-form-field="username" placeholder="Username" required="" id="username">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control px-3" name="password" data-form-field="password" placeholder="Password" id="password">
                    </div>

                <span class="input-group-btn"><button href="" type="submit" class="btn btn-secondary btn-form display-4">Register</button></span>
            </form>
        </div>
    </div>
    </div>
</div>
    </div>
</section>


  <script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/popper/popper.min.js"></script>
  <script src="assets/tether/tether.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
  <script src="assets/ytplayer/jquery.mb.ytplayer.min.js"></script>
  <script src="assets/vimeoplayer/jquery.mb.vimeo_player.js"></script>
  <script src="assets/smoothscroll/smooth-scroll.js"></script>
  <script src="assets/dropdown/js/script.min.js"></script>
  <script src="assets/theme/js/script.js"></script>


</body>
</html>
