<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Team Players</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        .message { color: #FF0000 ; font-weight: bold; }
    </style>
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <b>Your Players</b><br/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty team}"> 
        
      <c:if test="${team.teamStatus == 'INCOMPLETE'}">         
        Team Name:&nbsp;${team.teamName}<br/>

        <c:if test="${team.complete}">            
            <a href="${contextPath}/team/set?userid=${team.userId}&teamid=${team.teamId}">Submit Your Team</a>
            <br/>
        </c:if>

        <c:if test="${empty team.captain}">
            <b>Captain:</b> <span class="message">None yet</span><br/>
        </c:if>
        <c:if test="${not empty team.captain}">
            <b>Captain:</b> ${team.captain}<br/>
        </c:if>
        <b>Team Format:</b>&nbsp;<a href="${contextPath}/team/changeFormat?userid=${team.userId}&teamid=${team.teamId}">${team.teamFormat.name}</a><br/>
        
        <c:if test="${team.playersCount < 15}">
            <b>Squad Count:</b>&nbsp;<span class="message">${team.playersCount} out of 15 players</span><br/> 
        </c:if>    
        <c:if test="${team.playersCount == 15}">
            <b>Squad Count:</b>&nbsp;${team.playersCount} / 15<br/> 
        </c:if>
        
        <b>Available Money:</b>&nbsp;<fmt:formatNumber value="${team.availableMoney}" type="currency" currencySymbol="R"/><br/>
        <c:set var="count" value="1" scope="page" />
        
        <b>Defenders: ${team.defendersCount}/${team.teamFormat.defenderCount}</b>
        <c:if test="${team.requiresDefenders}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=defender">Add Defender</a> 
        </c:if>              
        <c:forEach items="${team.defenders}" var="d">
        <br/>
          ${count}&nbsp;${d.firstName}&nbsp;${d.lastName}&nbsp;
            Status:&nbsp;
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=defender&poolplayerid=${d.poolPlayerId}">
            ${d.status}</a>&nbsp;  
            <c:set var="count" value="${count + 1}" scope="page"/>                     
        </c:forEach>
        
        <br/>
        <b>Mid Fielders: ${team.midfieldersCount}/${team.teamFormat.midfielderCount}</b>
        <c:if test="${team.requiresMidFielders}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=midfielder">Add Mid Fielder</a> 
        </c:if>      
        
        <c:set var="count" value="1" scope="page"/>
        <c:forEach items="${team.midfielders}" var="f">
                <br/>
            ${count}&nbsp;${f.firstName}&nbsp;${f.lastName}&nbsp;
            Status:&nbsp;
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=midfielder&poolplayerid=${f.poolPlayerId}">
            ${f.status}</a>&nbsp;
            <c:set var="count" value="${count + 1}" scope="page"/>              
        </c:forEach>
                
        <br/>
        <b>Strikers: ${team.strikersCount}/${team.teamFormat.strikerCount}</b>  
        <c:if test="${team.requiresStrikers}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=striker">Add Striker</a> 
        </c:if>  
        <c:set var="count" value="1" scope="page"/>
        <c:forEach items="${team.strikers}" var="s">
            <br/>
            ${count}&nbsp;${s.firstName}&nbsp;${s.lastName}&nbsp;
            Status:&nbsp;<a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=striker&poolplayerid=${s.poolPlayerId}">
            ${s.status}</a>&nbsp;   
            <c:set var="count" value="${count + 1}" scope="page"/>                 
        </c:forEach>        
        
        <c:set var="count" value="1" scope="page"/>
        <br/>
        <c:if test="${not team.requiresGoalKeepers}">
            <b>Goal Keepers: 1/1</b>
        </c:if>     
        <c:if test="${team.requiresGoalKeepers}">
            <b>Goal Keepers: 0/1</b>
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=goalkeeper">Add Goal Keeper</a> 
        </c:if>                   
        <c:forEach items="${team.goalKeepers}" var="g">
            <br/>
            ${count}&nbsp;${g.firstName}&nbsp;${g.lastName}&nbsp;
            Status:&nbsp;<a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=goalkeeper&poolplayerid=${g.poolPlayerId}">
            ${g.status}</a>&nbsp;            
            <c:set var="count" value="${count + 1}" scope="page"/>                    
        </c:forEach>         
                
        <br/>
        <b>Substitutes: ${team.substitutesCount}/4</b>
        <c:if test="${team.requiresSubstitutes}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=substitute">Add Substitute</a> 
        </c:if> 
        <c:set var="count" value="1" scope="page"/>
        <c:forEach items="${team.substitutes}" var="s">
            <br/>
            ${count}&nbsp;${s.firstName}&nbsp;${s.lastName}&nbsp;
            Status:&nbsp;<a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=substitute&poolplayerid=${s.poolPlayerId}">
            ${s.status}</a>&nbsp;                    
            <c:set var="count" value="${count + 1}" scope="page"/>        
        </c:forEach>                                
     </c:if>  
     
             
 <!-- Team is complete/locked -->    
     <c:if test="${team.teamStatus == 'COMPLETE'}">
        Team Name:&nbsp;${team.teamName}<br/>
        Team Format:&nbsp;${team.teamFormat.name}<br/>
        Squad Count:&nbsp;${team.playersCount} out of 15 players assigned<br/> 
        Captain: ${team.captain}       
        <br/>        
        <a href="${contextPath}/team/startTrade?userid=${userid}&teamid=${team.teamId}">Trade a Player</a>
        <br/>
        
        <c:set var="count" value="1" scope="page" />
        
        <b>Defenders: ${team.defendersCount}/${team.teamFormat.defenderCount}</b>             
        <c:forEach items="${team.defenders}" var="d">
        <br/>
            ${count}&nbsp;<a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${d.poolPlayerId}">
            ${d.firstName}&nbsp;${d.lastName}
            </a>
            Status:&nbsp;${d.status}&nbsp;  
            <c:set var="count" value="${count + 1}" scope="page"/>                                    
        </c:forEach>

        <c:set var="count" value="1" scope="page"/>
        <br/>
        <b>Mid Fielders: ${team.midfieldersCount}/${team.teamFormat.midfielderCount}</b>     
        <c:forEach items="${team.midfielders}" var="f">
                <br/>
            ${count}&nbsp;<a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${f.poolPlayerId}">
            ${f.firstName}&nbsp;${f.lastName}</a>
            Status:&nbsp;${f.status}&nbsp;        
            <c:set var="count" value="${count + 1}" scope="page"/>       
        </c:forEach>
                
        <c:set var="count" value="1" scope="page"/>        
        <br/>
        <b>Strikers: ${team.strikersCount}/${team.teamFormat.strikerCount}</b>   
        <c:forEach items="${team.strikers}" var="s">
            <br/>
            ${count}&nbsp;<a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${s.poolPlayerId}">
            ${s.firstName}&nbsp;${s.lastName}</a>
            Status:&nbsp;${s.status}&nbsp;   
            <c:set var="count" value="${count + 1}" scope="page"/>          
        </c:forEach>        
        
        <c:set var="count" value="1" scope="page"/>
        <br/>
        <b>Goal Keepers: 1/1</b>  
        <c:forEach items="${team.goalKeepers}" var="g">
            <br/>
            ${count}&nbsp;<a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${g.poolPlayerId}">
            ${g.firstName}&nbsp;${g.lastName}</a>
            Status:&nbsp;${g.status}&nbsp;
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>         
        
        <c:set var="count" value="1" scope="page"/>
        <br/>
        <b>Substitutes: ${team.substitutesCount}/4</b>
        <c:forEach items="${team.substitutes}" var="s">
            <br/>
            ${count}&nbsp;<a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${s.poolPlayerId}">
            ${s.firstName}&nbsp;${s.lastName}</a>
            Status:&nbsp;${s.status}&nbsp; 
            <c:set var="count" value="${count + 1}" scope="page"/>                         
        </c:forEach>  
     </c:if>       
    </c:if>
    
    <br/>
    <a href="${contextPath}/team/list?userid=${userid}">Back</a>
    
  </body>

</html>