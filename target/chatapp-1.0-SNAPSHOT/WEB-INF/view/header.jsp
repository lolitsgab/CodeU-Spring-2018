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
                   <a href="/">
                        <img src="/assets/images/logo2.png" alt="Mobirise" style="height: 3.8rem;">
                   </a>
               </span>
               <span class="navbar-caption-wrap"><a class="navbar-caption text-white display-4" href="/">
                       ABChat</a></span>
           </div>
       </div>
       <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
         <% if(request.getSession().getAttribute("user") != null){ %>
           <li class="nav-item"><a class="nav-link link text-white display-4" href="/conversations"><span class="mbrib-chat mbr-iconfont mbr-iconfont-btn"></span>
                       Conversations</a></li>
                       <% } %>
               <li class="nav-item">
                   <a class="nav-link link text-white display-4" href="/about.jsp">
                       <span class="mbri-search mbr-iconfont mbr-iconfont-btn"></span>
                       About Us
                   </a>
               </li></ul>
        <% if(request.getSession().getAttribute("user") == null){ %>
           <div class="navbar-buttons mbr-section-btn"><a class="btn btn-sm btn-primary display-4" href="/login"><span class="mbri-user mbr-iconfont mbr-iconfont-btn"></span>Sign in</a> <a class="btn btn-sm btn-primary display-4" href="/register"><span class="mbri-login mbr-iconfont mbr-iconfont-btn"></span>RegisterI</a></div>
           <% } %>
       </div>
   </nav>
 </section>
