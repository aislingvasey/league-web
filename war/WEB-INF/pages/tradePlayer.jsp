<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Trade a Player</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body {color: #ffffff; background-color: #202020; }
        a {color: #FF6600; }
        a:visited {color: #FF6600; }
        a:hover {color: #FF6600; }
        .message { color: #FF0000 ; font-weight: bold; }
        .message2 { color: #FF0000 ; font-size: small; }
        .notification { color: #00FF00; font-weight: bold; }
    </style>
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty teams}">
        <b>Find your new Player</b><br/>
         You can trade a player for free once every two weeks<br/>
        <c:forEach items="${teams}" var="team">
            <a href="${contextPath}/team/tradeTeamPlayers?userid=${userid}&teamid=${teamid}&team=${team.teamId}">${team.teamName}</a><br/>
        </c:forEach>
        <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
    </c:if>
    
    <c:if test="${not empty userTeam}">
        <b>Select the player to be replaced</b><br/>
    </c:if>
    
    <c:if test="${not empty players}">
        <b>Select your new Player</b><br/>
        The cost of the new player must be less than your available money plus the price of the player you are trading out.<br/> 
    </c:if>
    
    <c:if test="${not empty availableMoney}">
        <b>Available Money:</b> <fmt:formatNumber value="${availableMoney}" type="currency" currencySymbol="R" pattern="¤ #,##0"/><br/>
    </c:if>
    <c:if test="${not empty players}">
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
        ${poolPlayer.firstName}&nbsp;${poolPlayer.lastName}
        &nbsp;<fmt:formatNumber value="${poolPlayer.price}" type="currency" currencySymbol="R"/>
        &nbsp;Score: ${poolPlayer.currentScore}
        &nbsp;${poolPlayer.block}
        <br/>
    </c:if>
    
    <c:if test="${not empty userTeam}">     
     <c:if test="${userTeam.teamStatus == 'COMPLETE'}">    
     
        <c:if test="${poolPlayer.block == 'Defender'}">     
            <b>Defenders:</b>             
            <c:forEach items="${userTeam.defenders}" var="d">
            <br/>
                <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${d.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
                ${d.firstName}&nbsp;${d.lastName} - <fmt:formatNumber value="${d.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/>
                </a>                              
            </c:forEach>
        </c:if>
                
        <c:if test="${poolPlayer.block == 'Midfielder'}"> 
	        <b>Mid Fielders:</b>     
	        <c:forEach items="${userTeam.midfielders}" var="f">
	                <br/>
	            <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${f.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
	            ${f.firstName}&nbsp;${f.lastName} - <fmt:formatNumber value="${f.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></a>              
	        </c:forEach>
        </c:if>
                
        <c:if test="${poolPlayer.block == 'Striker'}"> 
        <b>Strikers:</b>   
            <c:forEach items="${userTeam.strikers}" var="s">
                <br/>
                <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${s.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
                ${s.firstName}&nbsp;${s.lastName} - <fmt:formatNumber value="${s.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></a>            
            </c:forEach>        
        </c:if>
        
        <c:if test="${poolPlayer.block == 'Goalkeeper'}"> 
        <b>Goal Keepers:</b>  
            <c:forEach items="${userTeam.goalKeepers}" var="g">
                <br/>
                <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${g.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
                ${g.firstName}&nbsp;${g.lastName} - <fmt:formatNumber value="${g.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></a>
            </c:forEach>         
        </c:if>
                       
        <br/>
        <b>Substitutes:</b>
        <c:forEach items="${userTeam.substitutes}" var="s">
            <br/>
            <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${s.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
            ${s.firstName}&nbsp;${s.lastName} - <fmt:formatNumber value="${s.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></a>                        
        </c:forEach>
                         
        <br/>        
        <a href="${contextPath}/team/startTrade?userid=${userTeam.userId}&teamid=${userTeam.teamId}">Back</a>                                                 
     </c:if> 
      
    </c:if>
        
  </body>

</html>