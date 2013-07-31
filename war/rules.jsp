<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - How to Play</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body { color: #D3CBBD; background: #1C1919; }
        .heading { color: #FF0000; font-weight: bold; }
        a { color: #70BDC6;  }
        a:hover { color: #A4E9F0; }
        .list { margin: 0; margin-bottom: 5px; margin-left: 15px;}
        .label { margin-right: 5px; font-weight: bold; }
        .count { font-weight: 100; }
        .message-box { padding-top: 5px; padding-bottom: 5px; }
        .message { background: #FF0000; color:#1C1919;  font-weight: bold; padding: 2px; }
        .notification { background: #D3CBBD; color: #1C1919; font-weight: bold; padding: 2px; }
    </style>
  </head>

  <body>  
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <span class="heading">How to Play</span><br/><br/>
    
<b>Creating Your Squad:</b><br/>
Choose 15 players to form your team's squad. Of these, 11 player are on the team currently and 4 players are on the bench as substitutes. 
One player must be nominated as your captain. You have R5 million to spend to buy all your players.
<br/><br/> 

<b>League:</b><br/>
All teams are, by default, put into the General League. For a cost of z moola, you can set up a private league and invite
specific users to take take in it.
<br/><br/>

<b>Team Format:</b><br/>
You can choose from any of the following team formations: 4-4-2, 3-4-3, 4-3-3, 3-5-2, or 4-5-1.
For example: 3-5-2 would be 3 defenders - 5 midfielders - 2 strickers.
Your team always need 1 goalkeeper. You need to select enough players of each type to complete your chosen team format.
<br/><br/>

<b>Playing Week:</b><br/>
Each week that the Fantasy Football game runs is called a Playing Week. 
A playing week typically runs from Saturday to Friday. 
You gain bonus points for taking part in each playing week. 
You also get the points for each of your players for each match that takes place during the playing week. 
Player points are calculated after each match and are added to your team's points. 
Substitutes points are only added at the end of each playing week (see below).   
<br/><br/>

<b>Team Changes:</b><br/>
You can make as many team changes as you like until you Submit your Team. Once you have submitted your team
it is "locked" and can only be changed through making a Player Transfer (see below). 
Only submitted or complete teams are able to take part in the game and are awared points each playing week. 
<br/><br/>

<b>Substitutions:</b><br/>
Substitution are free. You can make as may swaps between your 11 players and your 4 substitutes as you like, even after your team is submitted
and is gaining points each week.
If one or more of your chosen 11 players does not play during a playing week then a substitute will be used to fill their place.
Automatically substituted player's points are added to a team's score when the current Playing Week ends. This ensures you have 11
players contributing to your score for that week, unless you have more players not playing than you have substitutes.
Automatic substitutions do not become part of your starting 11 players. 
Only players that you move from the substitute bench to the playing team become active scoring members of the team.
In the event that more than one team plays twice in any Playing Week, if one of your chosen 11 players plays in both games they will score in both, 
with your captain scoring double points in both also. 
If one of your chosen 11 players does not play during either game then they are eligible to be substituted.
<br/><br/>

<b>Team Captain:</b><br/>
Captain changes are free and unlimited.
The player selected as captain at the start of each playing week will score double points in games taking place in that week.
If you transfer your captain to the bench as a substitute or drop them out of your squad as part of a Player Transfer, you must first select a new captain in order to do these changes.
<br/><br/>

<b>Making Transfers:</b><br/>
You get one free Player Transfer every 2nd playing week.
Any unused transfers cannot be carried into subsequent weeks.
Once a transfer has been submitted, it cannot be reversed or changed under any circumstance.
You can make one transfer a week if you have paid the weekly subscription of x moola.  If you pay y moola you may make an additional substitution once every fortnight. 
Transfers take effect immediately.
<br/>
 
    <p class="navigation">          
          <a href='${contextPath}/team/list?userid=${param["userid"]}'>Home</a>
      </p>
    
  </body>

</html>