<%--
Copyright 2017 Google Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--%>
<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Event" %>
<%
List<Event> eventList = (List<Event>) request.getAttribute("feed");
%>

<!DOCTYPE html>
<html>
  <head>
    <title>"Feed"</title>
    <link rel="stylesheet" href="/css/main.css" type="text/css">
      <style>
      #feedDiv {
        width: 800px
        margin: 0px auto;
      }
      </style>
      <script>
      var currPos = 0;
      function moreFeed()
      {
        var i = 0;
        for(i = currPos; (i < eventList.size()) && (i <= (currPos + 10)); i++)
        {
          Event curEvent = eventList.get(i);
          switch(curEvent)
          {
            case "new_msg":
            String author = curEvent.getEventUserid();
            String content = curEvent.getMsgContent();
            //Instant timeStamp = curEvent.getCreationtTime()
            %>
            <li><strong><%= author %>:</strong> <%= content %></li>
            <%
            break;
            case "new_reg":
            String author = curEvent.getEventUserid();
            author += " just registered! Say hello!"
            //Instant timeStamp = curEvent.getCreationtTime()
            %>
            <li><strong><%= author %>:</strong></li>
            <%
            break;
            case "new_conv":
            String author = curEvent.getEventUserid();
            String content = curEvent.getConvTitle();
            //Instant timeStamp = curEvent.getCreationtTime()
            %>
            <li><strong><%= author %>:</strong> <%= content %></li>
            <%
            break;
            /*case "new_like":
            break;*/
          }

        }
        currPos = i;
      }
      function scrollFeed()
      {
        var feedDiv = document.getElementById('feedDiv');
        var contentHeight = feedDiv.offsetHeight;
        var yOffset =  window.pageYOffset;
        var y = yOffset + window.innerHeight;
        var
        if(y >= contentHeight)
        {
          moreFeed();
        }
      };
      window.onscroll = scrollFeed;
      </script>
      <%@ include file = "header.jsp" %>
      <div id="feedDiv">
        <h1>Feed<hr/>
        <%
        moreFeed()
        %>


      </div>

    </body>
  </html>
