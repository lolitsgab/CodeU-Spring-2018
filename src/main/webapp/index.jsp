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
  <link rel="stylesheet" href="assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
  <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="assets/tether/tether.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="assets/socicon/css/styles.css">
  <link rel="stylesheet" href="assets/dropdown/css/style.css">
  <link rel="stylesheet" href="assets/theme/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">



</head>
<body>
  <section class="menu cid-qPqsYB3Xju" once="menu" id="menu1-m">



    <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </button
        <div class="menu-logo">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="team-abc.appspot/about.jsp">
                         <img src="assets/images/logo2.png" alt="Mobirise" style="height: 3.8rem;">
                    </a>
                </span>
                <span class="navbar-caption-wrap"><a class="navbar-caption text-white display-4" href="https://mobirise.com">
                        ABChat</a></span>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
          <% if(request.getSession().getAttribute("user") != null){ %>
            <li class="nav-item"><a class="nav-link link text-white display-4" href="/conversations"><span class="mbrib-chat mbr-iconfont mbr-iconfont-btn"></span>
                        Conversations</a></li>
          <li class="nav-item"><a class="nav-link link text-white display-4" href="/feed"><span class="mbrib-chat mbr-iconfont mbr-iconfont-btn"></span>
                        Feed</a></li>

          <li class="nav-item"><a class="nav-link link text-white display-4" href="/users/<%=  request.getSession().getAttribute("user")%> "><span class="mbrib-chat mbr-iconfont mbr-iconfont-btn"></span>
                          Profile </a></li>

                        <% } %>
                <li class="nav-item">
                    <a class="nav-link link text-white display-4" href="/about.jsp">
                        <span class="mbri-search mbr-iconfont mbr-iconfont-btn"></span>
                        About Us
                    </a>
                </li></ul>
         <% if(request.getSession().getAttribute("user") == null){ %>
            <div class="navbar-buttons mbr-section-btn"><a class="btn btn-sm btn-primary display-4" href="/login"><span class="mbri-user mbr-iconfont mbr-iconfont-btn"></span>Sign in</a> <a class="btn btn-sm btn-primary display-4" href="/register"><span class="mbri-login mbr-iconfont mbr-iconfont-btn"></span>Register</a></div>
            <% } %>
        </div>
    </nav>
  </section>
<section class="engine"><a href="/login">free website builder app</a></section><section class="cid-qPqsYBHTzP mbr-fullscreen mbr-parallax-background" id="header2-f">





    <div class="container align-center">
        <div class="row justify-content-md-center">
            <div class="mbr-white col-md-10">
                <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1">
                    Welcome to ABChat</h1>

                <p class="mbr-text pb-3 mbr-fonts-style display-5">finally, a simple chat service</p>
                <div class="mbr-section-btn"><a class="btn btn-md btn-secondary display-4" href="https://mobirise.com">LEARN MORE</a></div>
            </div>
        </div>
    </div>

</section>

</body>
</html>
