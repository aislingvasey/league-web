<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Team Changes</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body { color: #977038; background: #FFFFFF; }
        .heading { color: #ff6819; font-weight: bold; }
        .list { margin: 0; margin-bottom: 5px; margin-left: 15px;}
        .label { margin-right: 5px; font-weight: bold; }
        .count { font-weight: 100; }
        .message-box { padding-top: 5px; padding-bottom: 5px; }
        .message { color: #FC1108; font-weight: bold; padding: 1px; }
        .notification { color: #FFFFFF; background: #ff6819; font-weight: bold; padding: 1px; }
        .hint { font-size: smaller; }
    </style>
  </head>

  <body>  
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <span class="heading">Team Changes</span><br/><br/>

You can change your team as often as you like until you submit your team and they official join the league to play. 
Once you have submitted your team it is "locked" and can only be changed through making a Player Transfer or by a Substitution. 
Only submitted, complete teams are able to take part in the league and will be awared points each Playing Week. 
<br/><br/>

<b>Substitutions:</b><br/>
Substitution are free. A substition means to put one of your current 11 players on the bench and to select one of your substitutes to play instead. 
You can make as may swaps between your 11 players and your 4 substitutes as you like, even after your team is submitted and is gaining points each playing week.
If one or more of your chosen 11 players does not play during a playing week then a substitute will be used to fill their place.
The substituted player's points are added to your team's score when the current Playing Week ends. This ensures you have 11
players contributing to your score for that week, unless you have more players not playing than you have substitutes.
Substitutions do not become part of your starting 11 players unless you actually perform a Substitution.  
Only players that you move from the substitute bench to the playing team become active scoring members of the team.
In the event that more than one team plays twice in any Playing Week, if one of your chosen 11 players plays in both games they will score in both, 
with your captain scoring double points in both also. 
If one of your chosen 11 players does not play during either game then they are can hopefully be substituted by one of your substitute players.
<br/><br/>

<b>Team Captain:</b><br/>
Captain changes are free and unlimited.
The player selected as captain at the start of each Playing Week will score double points in any games taking place in that week.
If you transfer your captain to the bench as a substitute or drop them out of your squad as part of a Player Transfer, you must first select a new captain in order to do these changes.
<br/><br/>

<b>Player Transfers:</b><br/>
A Transfer means selecting a new player for the pool of available players and choosing an existing team member to be replaced
by the pool player. This means that you can only trade players in the same position (striker to striker) or as one of your substitutes.
You need to have enough available money to buy the new pool player. You will get back the money for the player you are dropping from
your team. If the pool player is more expensive, then you need to have enough left over money from the initial 
You get one free Player Transfer every 2nd playing week. 
Any unused transfers cannot be carried into subsequent weeks.
Once a transfer has been submitted, it cannot be reversed or changed under any circumstance.
<!-- You can make one transfer a week if you have paid the cost of 25 moola.  
If you pay 100 moola you may make an additional substitution once every fortnight.  -->
Transfers take effect immediately.
<br/>
 
    <p class="navigation">      
        <a href='${contextPath}/rules.jsp?userid=${param["userid"]}'>Back</a>
            |
        <a href='${contextPath}/team/list?userid=${param["userid"]}'>Home</a>
      </p>
    
  </body>

</html>