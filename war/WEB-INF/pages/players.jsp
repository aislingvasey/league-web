<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - Team Players</title>
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
    
    <div class="logo">
        <img src="<c:url value="/resources/soccer-logo-small.png" />" />
    </div>
    
    <span class="heading">Your Players</span><br/>
    
    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>
    
    <c:if test="${not empty team}"> 
        
      <c:if test="${team.teamStatus == 'INCOMPLETE'}">  
      
        <c:if test="${team.complete}">
        <span class="hint">Your team are still in training, make sure to submit them so that they can start playing.</span><br/>
        </c:if>
             
        <b>Team Name:</b> ${team.teamName}<br/>
        <c:if test="${empty team.captain && team.playersCount == 0}">
            <b>Captain:</b> None<br/>
        </c:if>
        <c:if test="${empty team.captain && team.playersCount > 0}">
            <b>Captain:</b>  
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=defender&poolplayerid=&captain=true">Select One</a>
            <br/>
        </c:if>
        <c:if test="${not empty team.captain}">
            <b>Captain:</b> <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=defender&poolplayerid=${team.captainId}&captain=true">${team.captain}</a><br/>
        </c:if>
        <b>Team Format:</b> <a href="${contextPath}/team/changeFormat?userid=${team.userId}&teamid=${team.teamId}">${team.teamFormat.name}</a><br/>
        
        <c:if test="${team.playersCount < 15}">
            <b>Squad:</b> ${team.playersCount} out of 15 players<br/> 
        </c:if>    
        <c:if test="${team.playersCount == 15}">
            <b>Squad:</b> ${team.playersCount} out of 15 players<br/> 
        </c:if>
        
        <b>Available Money:</b> <fmt:formatNumber value="${team.availableMoney}" type="currency" currencySymbol="R" pattern="¤ #,##0"/><br/>
        
        <c:set var="count" value="1" scope="page" />              
        
        <b>Defenders: ${team.defendersCount}/${team.teamFormat.defenderCount}</b>
        <c:if test="${team.requiresDefenders}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=Defender">Add Defender</a> 
        </c:if>              
        <div class="list">
        <c:forEach items="${team.defenders}" var="d">                                    
            ${count} 
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=Defender&poolplayerid=${d.poolPlayerId}">            
            ${d.firstName} ${d.lastName}
            </a>            
             (<fmt:formatNumber value="${d.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/>)            
            <c:if test="${team.defendersCount > count}">
                <br/>
            </c:if>    
            <c:set var="count" value="${count + 1}" scope="page"/>                                           
        </c:forEach>
        </div>
                
        <b>Mid Fielders: ${team.midfieldersCount}/${team.teamFormat.midfielderCount}</b>
        <c:if test="${team.requiresMidFielders}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=Midfielder">Add Mid Fielder</a> 
        </c:if>              
        <c:set var="count" value="1" scope="page"/>
        <div class="list">
        <c:forEach items="${team.midfielders}" var="f">
            ${count} 
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=Midfielder&poolplayerid=${f.poolPlayerId}">
            ${f.firstName} ${f.lastName} 
            </a>
             (<fmt:formatNumber value="${f.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/>)            
            <c:if test="${team.midfieldersCount > count}">
                <br/>
            </c:if>
            <c:set var="count" value="${count + 1}" scope="page"/>              
        </c:forEach>
        </div>        
        
        <b>Strikers: ${team.strikersCount}/${team.teamFormat.strikerCount}</b>  
        <c:if test="${team.requiresStrikers}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=Striker">Add Striker</a> 
        </c:if>  
        <c:set var="count" value="1" scope="page"/>
        <div class="list">
        <c:forEach items="${team.strikers}" var="s">
            ${count} 
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=Striker&poolplayerid=${s.poolPlayerId}">
              ${s.firstName} ${s.lastName}
            </a>
             (<fmt:formatNumber value="${s.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/>)            
            <c:if test="${team.strikersCount > count}">
                <br/>
            </c:if>
            <c:set var="count" value="${count + 1}" scope="page"/>                 
        </c:forEach>        
        </div>
        
        <c:set var="count" value="1" scope="page"/>        
        <c:if test="${not team.requiresGoalKeepers}">
            <b>Goal Keepers: 1/1</b>
        </c:if>     
        <c:if test="${team.requiresGoalKeepers}">
            <b>Goal Keepers: 0/1</b>
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=Goalkeeper">Add Goal Keeper</a> 
        </c:if>                   
        <div class="list">
        <c:forEach items="${team.goalKeepers}" var="g">
            ${count} 
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=Goalkeeper&poolplayerid=${g.poolPlayerId}">
              ${g.firstName} ${g.lastName}
            </a>
             (<fmt:formatNumber value="${g.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/>)            
            <c:if test="${1 > count}">
                <br/>
            </c:if>
            <c:set var="count" value="${count + 1}" scope="page"/>                    
        </c:forEach>      
        </div>   
                
        <b>Substitutes: ${team.substitutesCount}/4</b>
        <c:if test="${team.requiresSubstitutes}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=Substitute">Add Substitute</a> 
        </c:if> 
        <c:set var="count" value="1" scope="page"/>
        <div class="list">
        <c:forEach items="${team.substitutes}" var="s">
            ${count}
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=Substitute&poolplayerid=${s.poolPlayerId}">
             ${s.firstName} ${s.lastName}
            </a>
             (${s.originalBlock})
             (<fmt:formatNumber value="${s.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/>)                        
            <c:if test="${team.substitutesCount > count}">
                <br/>
            </c:if>
            <c:set var="count" value="${count + 1}" scope="page"/>        
        </c:forEach>      
        </div>                               
     </c:if>  
     
             
 <!-- Team is complete/locked -->    
     <c:if test="${team.teamStatus == 'COMPLETE'}">
        <b>Team Name:</b> ${team.teamName}<br/>
        <b>Team Format:</b> ${team.teamFormat.name}<br/>
        <b>Squad:</b> ${team.playersCount} out of 15 players assigned<br/> 
        <b>Captain:</b> <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${team.captainId}&captain=true">${team.captain}</a><br/>          
        
        <c:set var="count" value="1" scope="page" />        
        <b>Defenders: ${team.defendersCount}/${team.teamFormat.defenderCount}</b>
        <div class="list">             
        <c:forEach items="${team.defenders}" var="d">            
            ${count} <a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${d.poolPlayerId}">
            ${d.firstName} ${d.lastName}
            </a>
            <c:if test="${team.defendersCount > count}">
                <br/>
            </c:if>
            <c:set var="count" value="${count + 1}" scope="page"/>                                    
        </c:forEach>
        </div>

        <c:set var="count" value="1" scope="page"/>
        <b>Mid Fielders: ${team.midfieldersCount}/${team.teamFormat.midfielderCount}</b>
        <div class="list">     
        <c:forEach items="${team.midfielders}" var="f">
            ${count} <a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${f.poolPlayerId}">
            ${f.firstName} ${f.lastName}</a>
            <c:if test="${team.midfieldersCount > count}">
                <br/>
            </c:if>
            <c:set var="count" value="${count + 1}" scope="page"/>       
        </c:forEach>
        </div>
                
        <c:set var="count" value="1" scope="page"/>        
        <b>Strikers: ${team.strikersCount}/${team.teamFormat.strikerCount}</b>
        <div class="list">   
        <c:forEach items="${team.strikers}" var="s">
            ${count} <a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${s.poolPlayerId}">
            ${s.firstName} ${s.lastName}</a>
            <c:if test="${team.strikersCount > count}">
                <br/>
            </c:if>
            <c:set var="count" value="${count + 1}" scope="page"/>          
        </c:forEach>        
        </div>
        
        <c:set var="count" value="1" scope="page"/>
        <b>Goal Keepers: 1/1</b>
        <div class="list">  
        <c:forEach items="${team.goalKeepers}" var="g">
            ${count} <a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${g.poolPlayerId}">
            ${g.firstName} ${g.lastName}</a>
            <c:if test="${1 > count}">
                <br/>
            </c:if>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>
        </div>         
        
        <c:set var="count" value="1" scope="page"/>
        <b>Substitutes: ${team.substitutesCount}/4</b>
        <div class="list">
        <c:forEach items="${team.substitutes}" var="s">
            ${count} <a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${s.poolPlayerId}">
            ${s.firstName} ${s.lastName}</a>
             (${s.originalBlock})             
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=substitute&poolplayerid=${s.poolPlayerId}&teamstatus=COMPLETE&captainid=${team.captainId}">            
            ${s.block}
            </a>             
            <c:if test="${team.substitutesCount > count}">
                <br/>
            </c:if>
            <c:set var="count" value="${count + 1}" scope="page"/>                         
        </c:forEach>      
        </div>            
     </c:if>       
    </c:if>
    
    <p class="navigation">
        <c:if test="${team.teamStatus == 'INCOMPLETE' && team.complete}">                                  
            <a href="${contextPath}/team/set?userid=${team.userId}&teamid=${team.teamId}">Submit Your Team</a>
             |             
        </c:if>   
        
        <c:if test="${team.teamStatus == 'COMPLETE' && team.canTrade}">       
            <a href="${contextPath}/team/startTrade?userid=${userid}&teamid=${team.teamId}">Trade a Player</a>
             |    
        </c:if>
        <c:if test="${team.teamStatus == 'COMPLETE' && not team.canTrade}">
            Trade a Player (Used)
             |    
        </c:if>
        
          <a href="${contextPath}/team/list?userid=${userid}">Back</a>
           | 
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
           | 
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
      </p>
    
  </body>

</html>