<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Team Players</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/main.css" />" />
  </head>

  <body>  
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <span class="heading">Your Players</span><br/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <span class="notification">${notification}</span><br/>
    </c:if>
    
    <c:if test="${not empty team}"> 
        
      <c:if test="${team.teamStatus == 'INCOMPLETE'}">  
      
        <c:if test="${team.complete}">
        <span class="hint">Your team are still in training, make sure to submit them so that they can start playing.</span><br/>
        </c:if>
             
        <b>Team Name:</b>&nbsp;${team.teamName}<br/>
        <c:if test="${empty team.captain && team.playersCount == 0}">
            <b>Captain:</b>&nbsp;None<br/>
        </c:if>
        <c:if test="${empty team.captain && team.playersCount > 0}">
            <b>Captain:</b>&nbsp; 
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=defender&poolplayerid=&captain=true">Select One</a>
            <br/>
        </c:if>
        <c:if test="${not empty team.captain}">
            <b>Captain:</b>&nbsp;<a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=defender&poolplayerid=${team.captainId}&captain=true">${team.captain}</a><br/>
        </c:if>
        <b>Team Format:</b>&nbsp;<a href="${contextPath}/team/changeFormat?userid=${team.userId}&teamid=${team.teamId}">${team.teamFormat.name}</a><br/>
        
        <c:if test="${team.playersCount < 15}">
            <b>Squad:</b>&nbsp;${team.playersCount} out of 15 players<br/> 
        </c:if>    
        <c:if test="${team.playersCount == 15}">
            <b>Squad:</b>&nbsp;${team.playersCount} out of 15 players<br/> 
        </c:if>
        
        <b>Available Money:</b>&nbsp;<fmt:formatNumber value="${team.availableMoney}" type="currency" currencySymbol="R" pattern="¤ #,##0"/><br/>
        
        <c:set var="count" value="1" scope="page" />
        
        <b>Defenders: ${team.defendersCount}/${team.teamFormat.defenderCount}</b>
        <c:if test="${team.requiresDefenders}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=Defender">Add Defender</a> 
        </c:if>              
        <c:forEach items="${team.defenders}" var="d">
        <br/>
          ${count}&nbsp;${d.firstName}&nbsp;${d.lastName}&nbsp;
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=Defender&poolplayerid=${d.poolPlayerId}">${d.status}</a>  
            <c:set var="count" value="${count + 1}" scope="page"/>                     
        </c:forEach>
        
        <br/>
        <b>Mid Fielders: ${team.midfieldersCount}/${team.teamFormat.midfielderCount}</b>
        <c:if test="${team.requiresMidFielders}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=Midfielder">Add Mid Fielder</a> 
        </c:if>      
        
        <c:set var="count" value="1" scope="page"/>
        <c:forEach items="${team.midfielders}" var="f">
                <br/>
            ${count}&nbsp;${f.firstName}&nbsp;${f.lastName}&nbsp;
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=Midfielder&poolplayerid=${f.poolPlayerId}">${f.status}</a>
            <c:set var="count" value="${count + 1}" scope="page"/>              
        </c:forEach>
                
        <br/>
        <b>Strikers: ${team.strikersCount}/${team.teamFormat.strikerCount}</b>  
        <c:if test="${team.requiresStrikers}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=Striker">Add Striker</a> 
        </c:if>  
        <c:set var="count" value="1" scope="page"/>
        <c:forEach items="${team.strikers}" var="s">
            <br/>
            ${count}&nbsp;${s.firstName}&nbsp;${s.lastName}&nbsp;
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=Striker&poolplayerid=${s.poolPlayerId}">${s.status}</a>
            <c:set var="count" value="${count + 1}" scope="page"/>                 
        </c:forEach>        
        
        <c:set var="count" value="1" scope="page"/>
        <br/>
        <c:if test="${not team.requiresGoalKeepers}">
            <b>Goal Keepers: 1/1</b>
        </c:if>     
        <c:if test="${team.requiresGoalKeepers}">
            <b>Goal Keepers: 0/1</b>
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=Goalkeeper">Add Goal Keeper</a> 
        </c:if>                   
        <c:forEach items="${team.goalKeepers}" var="g">
            <br/>
            ${count}&nbsp;${g.firstName}&nbsp;${g.lastName}&nbsp;
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=Goalkeeper&poolplayerid=${g.poolPlayerId}">${g.status}</a>
            <c:set var="count" value="${count + 1}" scope="page"/>                    
        </c:forEach>         
                
        <br/>
        <b>Substitutes: ${team.substitutesCount}/4</b>
        <c:if test="${team.requiresSubstitutes}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=Substitute">Add Substitute</a> 
        </c:if> 
        <c:set var="count" value="1" scope="page"/>
        <c:forEach items="${team.substitutes}" var="s">
            <br/>
            ${count}&nbsp;${s.firstName}&nbsp;${s.lastName}&nbsp;(${s.originalBlock})            
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=Substitute&poolplayerid=${s.poolPlayerId}">${s.status}</a>
            <c:set var="count" value="${count + 1}" scope="page"/>        
        </c:forEach>                                     
     </c:if>  
     
             
 <!-- Team is complete/locked -->    
     <c:if test="${team.teamStatus == 'COMPLETE'}">
        <b>Team Name:</b>&nbsp;${team.teamName}<br/>
        <b>Team Format:</b>&nbsp;${team.teamFormat.name}<br/>
        <b>Squad:</b>&nbsp;${team.playersCount} out of 15 players assigned<br/> 
        <b>Captain:</b>&nbsp;<a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${team.captainId}&captain=true">${team.captain}</a><br/>          
        
        <c:set var="count" value="1" scope="page" />        
        <b>Defenders: ${team.defendersCount}/${team.teamFormat.defenderCount}</b>             
        <c:forEach items="${team.defenders}" var="d">
        <br/>
            ${count}&nbsp;<a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${d.poolPlayerId}">
            ${d.firstName}&nbsp;${d.lastName}
            </a>
            <c:set var="count" value="${count + 1}" scope="page"/>                                    
        </c:forEach>

        <c:set var="count" value="1" scope="page"/>
        <br/>
        <b>Mid Fielders: ${team.midfieldersCount}/${team.teamFormat.midfielderCount}</b>     
        <c:forEach items="${team.midfielders}" var="f">
                <br/>
            ${count}&nbsp;<a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${f.poolPlayerId}">
            ${f.firstName}&nbsp;${f.lastName}</a>
            <c:set var="count" value="${count + 1}" scope="page"/>       
        </c:forEach>
                
        <c:set var="count" value="1" scope="page"/>        
        <br/>
        <b>Strikers: ${team.strikersCount}/${team.teamFormat.strikerCount}</b>   
        <c:forEach items="${team.strikers}" var="s">
            <br/>
            ${count}&nbsp;<a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${s.poolPlayerId}">
            ${s.firstName}&nbsp;${s.lastName}</a>
            <c:set var="count" value="${count + 1}" scope="page"/>          
        </c:forEach>        
        
        <c:set var="count" value="1" scope="page"/>
        <br/>
        <b>Goal Keepers: 1/1</b>  
        <c:forEach items="${team.goalKeepers}" var="g">
            <br/>
            ${count}&nbsp;<a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${g.poolPlayerId}">
            ${g.firstName}&nbsp;${g.lastName}</a>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>         
        
        <c:set var="count" value="1" scope="page"/>
        <br/>
        <b>Substitutes: ${team.substitutesCount}/4</b>
        <c:forEach items="${team.substitutes}" var="s">
            <br/>
            ${count}&nbsp;<a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${s.poolPlayerId}">
            ${s.firstName}&nbsp;${s.lastName}</a>
            &nbsp;(${s.originalBlock})&nbsp;            
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=substitute&poolplayerid=${s.poolPlayerId}&teamstatus=COMPLETE&captainid=${team.captainId}">
            ${s.block}
            </a>             
            <c:set var="count" value="${count + 1}" scope="page"/>                         
        </c:forEach>                  
     </c:if>       
    </c:if>
    
    <p class="navigation">
        <c:if test="${team.teamStatus == 'INCOMPLETE' && team.complete}">                                  
            <a href="${contextPath}/team/set?userid=${team.userId}&teamid=${team.teamId}">Submit Your Team</a>
            &nbsp;|&nbsp;            
        </c:if>   
        
        <c:if test="${team.teamStatus == 'COMPLETE' && team.canTrade}">       
            <a href="${contextPath}/team/startTrade?userid=${userid}&teamid=${team.teamId}">Trade a Player</a>
            &nbsp;|&nbsp;   
        </c:if>
        <c:if test="${team.teamStatus == 'COMPLETE' && not team.canTrade}">
            Trade a Player (Used)
            &nbsp;|&nbsp;   
        </c:if>
        
          <a href="${contextPath}/team/list?userid=${userid}">Back</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
      </p>
    
  </body>

</html>