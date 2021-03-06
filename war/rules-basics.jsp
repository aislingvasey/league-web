<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Basics</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body { color: #977038; background: #FFFFFF; }
        .heading { color: #ff6819; font-weight: bold; }
        .list { margin: 0; margin-bottom: 5px; margin-left: 15px;}
        .label { margin-right: 5px; font-weight: bold; }
        .count { font-weight: 100; }
        .message-box { padding-top: 5px; padding-bottom: 5px; }
        .message { color: #FC1108; font-weight: bold; padding: 1px; }
        .notification { color: #FFFFFF; background: #977038; font-weight: bold; padding: 1px; }
        .hint { font-size: smaller; }
    </style>
  </head>

  <body>  
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <span class="heading">The Basics</span><br/><br/>
    
<b>Creating Your Squad:</b><br/>
You need to choose 15 players to form your team's squad. Of these 15 players, 11 players are playing on the team and 4 players are on the bench as substitutes. 
One of the 15 active players must be nominated as your team captain. 
<br/>You have <b>R5 million</b> to spend to buy all your players. Any money you have left over can be used
later as part of Player Trades.
<br/><br/> 

<b>General League:</b><br/>
By default all PFL teams are put into the <b>General League</b>. All teams are ranked with this league. 
<br/><br/>

<b>Team Format:</b><br/>
You can choose from any of the following team formations: 4-4-2, 3-4-3, 4-3-3, 3-5-2, or 4-5-1.
For example: the format 3-5-2 would be 3 defenders - 5 midfielders - 2 strickers. Your team always need at least 1 goalkeeper.<br/> 
You need to select enough players of each type to complete your chosen team format. 
When you chose your players for your team, you will be prompted to choose enough players of each type to complete your selected team format.
<br/>

    <p class="navigation">          
        <a href='${contextPath}/rules.jsp?userid=${param["userid"]}'>Back</a>
        |
        <a href='${contextPath}/team/list?userid=${param["userid"]}'>Home</a>
      </p>
    
  </body>

</html>