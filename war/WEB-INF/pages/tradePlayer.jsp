<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Trade a Player</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/main.css" />" />
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty teams}">
        <span class="heading">Find your new Player</span><br/>
        <c:forEach items="${teams}" var="team">
            <a href="${contextPath}/team/tradeTeamPlayers?userid=${userid}&teamid=${teamid}&team=${team.teamId}">${team.teamName}</a><br/>
        </c:forEach>
                
        <p class="navigation">
<a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
        </p> 
        
    </c:if>
    
    <c:if test="${not empty userTeam}">
        <span class="heading">Select the player to be replaced</span><br/>
    </c:if>
    
    <c:if test="${not empty players}">
        <span class="heading">Select your new Player</span><br/>
        <span class="hint">Cost of the new player &lt; (your available money + the price of the player you are trading out)</span><br/> 
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
        
        <p class="navigation">
            <a href="${contextPath}/team/startTrade?userid=${userid}&teamid=${teamid}&team=${team}">Back</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
        </p> 
    </c:if>
    
    <c:if test="${not empty poolPlayer}">            
        <b>Incoming Player:</b>
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
                ${d.firstName}&nbsp;${d.lastName} <fmt:formatNumber value="${d.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/>
                </a>                              
            </c:forEach>
        </c:if>
                
        <c:if test="${poolPlayer.block == 'Midfielder'}"> 
	        <b>Mid Fielders:</b>     
	        <c:forEach items="${userTeam.midfielders}" var="f">
	                <br/>
	            <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${f.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
	            ${f.firstName}&nbsp;${f.lastName} <fmt:formatNumber value="${f.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></a>              
	        </c:forEach>
        </c:if>
                
        <c:if test="${poolPlayer.block == 'Striker'}"> 
        <b>Strikers:</b>   
            <c:forEach items="${userTeam.strikers}" var="s">
                <br/>
                <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${s.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
                ${s.firstName}&nbsp;${s.lastName} <fmt:formatNumber value="${s.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></a>            
            </c:forEach>        
        </c:if>
        
        <c:if test="${poolPlayer.block == 'Goalkeeper'}"> 
        <b>Goal Keepers:</b>  
            <c:forEach items="${userTeam.goalKeepers}" var="g">
                <br/>
                <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${g.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
                ${g.firstName}&nbsp;${g.lastName} <fmt:formatNumber value="${g.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></a>
            </c:forEach>         
        </c:if>
                       
        <br/>
        <b>${poolPlayer.block}&nbsp;Substitutes:</b>
        <c:forEach items="${userTeam.substitutes}" var="s">        
            <c:if test="${poolPlayer.block == s.originalBlock}">        
                <br/>
                <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${s.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
                ${s.firstName}&nbsp;${s.lastName} <fmt:formatNumber value="${s.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></a>
            </c:if>                        
        </c:forEach>
                         
                <p class="navigation">
<a href="${contextPath}/team/startTrade?userid=${userTeam.userId}&teamid=${userTeam.teamId}">Back</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
        </p>                                                
     </c:if> 
      
    </c:if>
        
  </body>

</html>