<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - Trade a Player</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
body { color: #005A31; background: #A8CD1B; }
a { color: #F3FAB6;  }
a:hover { color: #005A31; }
.heading { color: #005A31; font-weight: bold; font-size: large; }
.hint { color: #005A31; font-size: smaller; }
.list { margin: 0; margin-left: 15px;}
.message { background: #FF6423; color: #FFFFFF; font-weight: bold; padding: 2px; }
.marginSpacer { margin-top: 2px; margin-bottom: 2px; }
.notification { background: #005A31; color: #A8CD1B; padding: 2px; font-weight: bold; }
.navigation { }
.button-box { margin-top: 5px; margin-bottom: 7px; }
.button { color: #F3FAB6; background: #005A31; padding: 5px;}
a:hover.button { color: #F3FAB6; background: #327a5a; text-decoration: none; }
.logo { margin-top: 2px; margin-bottom: 2px; }
    </style>
  </head>

  <body>  
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  
    <div class="logo">
        <img src="<c:url value="/resources/soccer-logo-small.png" />" />
    </div>
    
    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>

    <c:if test="${not empty teams}">
        <span class="heading">Find your new Player</span><br/>
        <c:forEach items="${teams}" var="team">
            <a href="${contextPath}/team/tradeTeamPlayers?userid=${userid}&teamid=${teamid}&team=${team.teamId}">${team.teamName}</a><br/>
        </c:forEach>
                
        <p class="navigation">
<a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
           | 
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
           | 
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
	            ${p.firstName} ${p.lastName}</a>
	            </td> 
	            <td><fmt:formatNumber value="${p.price}" type="currency" currencySymbol="R" pattern="¤ #,##0" /></td>
	            <td>${p.block}</td>
            </tr>                                 
        </c:forEach>        
        </table>
        
        <p class="navigation">
            <a href="${contextPath}/team/startTrade?userid=${userid}&teamid=${teamid}&team=${team}">Back</a>
           | 
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
           | 
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
        </p> 
    </c:if>
    
    <c:if test="${not empty poolPlayer}">            
        <b>Incoming Player:</b>
        ${poolPlayer.firstName} ${poolPlayer.lastName}
         <fmt:formatNumber value="${poolPlayer.price}" type="currency" currencySymbol="R"/>
         Score: ${poolPlayer.currentScore}
         ${poolPlayer.block}
        <br/>
    </c:if>
    
    <c:if test="${not empty userTeam}">     
     <c:if test="${userTeam.teamStatus == 'COMPLETE'}">    
     
        <c:if test="${poolPlayer.block == 'Defender'}">     
            <b>Defenders:</b>             
            <c:forEach items="${userTeam.defenders}" var="d">
            <br/>
                <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${d.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
                ${d.firstName} ${d.lastName} <fmt:formatNumber value="${d.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/>
                </a>                              
            </c:forEach>
        </c:if>
                
        <c:if test="${poolPlayer.block == 'Midfielder'}"> 
	        <b>Mid Fielders:</b>     
	        <c:forEach items="${userTeam.midfielders}" var="f">
	                <br/>
	            <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${f.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
	            ${f.firstName} ${f.lastName} <fmt:formatNumber value="${f.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></a>              
	        </c:forEach>
        </c:if>
                
        <c:if test="${poolPlayer.block == 'Striker'}"> 
        <b>Strikers:</b>   
            <c:forEach items="${userTeam.strikers}" var="s">
                <br/>
                <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${s.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
                ${s.firstName} ${s.lastName} <fmt:formatNumber value="${s.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></a>            
            </c:forEach>        
        </c:if>
        
        <c:if test="${poolPlayer.block == 'Goalkeeper'}"> 
        <b>Goal Keepers:</b>  
            <c:forEach items="${userTeam.goalKeepers}" var="g">
                <br/>
                <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${g.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
                ${g.firstName} ${g.lastName} <fmt:formatNumber value="${g.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></a>
            </c:forEach>         
        </c:if>
                       
        <br/>
        <b>${poolPlayer.block} Substitutes:</b>
        <c:forEach items="${userTeam.substitutes}" var="s">        
            <c:if test="${poolPlayer.block == s.originalBlock}">        
                <br/>
                <a href="${contextPath}/team/tradePlayer?userid=${userTeam.userId}&teamid=${userTeam.teamId}&selectedid=${s.poolPlayerId}&poolplayerid=${poolPlayer.poolPlayerId}">
                ${s.firstName} ${s.lastName} <fmt:formatNumber value="${s.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></a>
            </c:if>                        
        </c:forEach>
                         
                <p class="navigation">
<a href="${contextPath}/team/startTrade?userid=${userTeam.userId}&teamid=${userTeam.teamId}">Back</a>
           | 
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
           | 
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
        </p>                                                
     </c:if> 
      
    </c:if>
        
  </body>

</html>