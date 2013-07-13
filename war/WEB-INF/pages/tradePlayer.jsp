<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Trade a Player</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        .message { color: #FF0000 ; font-weight: bold; }
    </style>
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty teams}">
        <b>Find your new Player</b><br/>
        <c:forEach items="${teams}" var="team">
            <a href="${contextPath}/team/tradeTeamPlayers?userid=${userid}&teamid=${teamid}&team=${team.teamId}">${team.teamName}</a><br/>
        </c:forEach>
        <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
    </c:if>
    
    <c:if test="${not empty availableMoney}">
        <b>Available Money:</b> <fmt:formatNumber value="${availableMoney}" type="currency" currencySymbol="R"/><br/>
    </c:if>
    <c:if test="${not empty players}">
        <b>Select your new Player</b><br/>
        <table>
        <c:forEach items="${players}" var="p">
            <tr>
	            <td>
	            <a href="${contextPath}/team/selectTradePoolPlayer?userid=${userid}&teamid=${teamid}&team=${team}&poolplayerid=${p.poolPlayerId}">
	            ${p.firstName}&nbsp;${p.lastName}</a>
	            </td> 
	            <td><fmt:formatNumber value="${p.price}" type="currency" currencySymbol="R"/></td>
	            <td>${p.block}</td>
            </tr>                                 
        </c:forEach>        
        </table>
        <a href="${contextPath}/team/startTrade?userid=${userid}&teamid=${teamid}&team=${team}">Back</a>
    </c:if>
    
    <c:if test="${not empty poolPlayer}">
        <b>Selected Pool Player:</b>
        ${poolPlayer.player.firstName}&nbsp;${poolPlayer.player.lastName}
        &nbsp;Price: <fmt:formatNumber value="${poolPlayer.playerPrice}" type="currency" currencySymbol="R"/>
        &nbsp;Current Score: ${poolPlayer.playerCurrentScore}
        &nbsp;${poolPlayer.player.block}
        <br/>
    </c:if>
    
    <c:if test="${not empty userTeam}">     
     <c:if test="${userTeam.teamStatus == 'COMPLETE'}">
     Select the team player to be replaced<br/>
        <b>Defenders:</b>             
        <c:forEach items="${userTeam.defenders}" var="d">
        <br/>
            <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&poolplayerid=${d.poolPlayerId}&selectedid=${poolPlayer.id}">
            ${d.firstName}&nbsp;${d.lastName} - <fmt:formatNumber value="${d.price}" type="currency" currencySymbol="R"/>
            </a>                              
        </c:forEach>

        <br/>
        <b>Mid Fielders:</b>     
        <c:forEach items="${userTeam.midfielders}" var="f">
                <br/>
            <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&poolplayerid=${f.poolPlayerId}&selectedid=${poolPlayer.id}">
            ${f.firstName}&nbsp;${f.lastName} - <fmt:formatNumber value="${f.price}" type="currency" currencySymbol="R"/></a>              
        </c:forEach>
                
        <br/>
        <b>Strikers:</b>   
        <c:forEach items="${userTeam.strikers}" var="s">
            <br/>
            <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&poolplayerid=${s.poolPlayerId}&selectedid=${poolPlayer.id}">
            ${s.firstName}&nbsp;${s.lastName} - <fmt:formatNumber value="${s.price}" type="currency" currencySymbol="R"/></a>            
        </c:forEach>        
        
        <br/>
        <b>Goal Keepers:</b>  
        <c:forEach items="${userTeam.goalKeepers}" var="g">
            <br/>
            <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&poolplayerid=${g.poolPlayerId}&selectedid=${poolPlayer.id}">
            ${g.firstName}&nbsp;${g.lastName} - <fmt:formatNumber value="${g.price}" type="currency" currencySymbol="R"/></a>
        </c:forEach>         
        
        <br/>
        <b>Substitutes:</b>
        <c:forEach items="${userTeam.substitutes}" var="s">
            <br/>
            <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&poolplayerid=${s.poolPlayerId}&selectedid=${poolPlayer.id}">
            ${s.firstName}&nbsp;${s.lastName} - <fmt:formatNumber value="${s.price}" type="currency" currencySymbol="R"/></a>                        
        </c:forEach>                 
     </c:if> 
      
    </c:if>
        
  </body>

</html>