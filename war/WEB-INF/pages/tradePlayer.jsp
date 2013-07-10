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
    
    <b>Trade a Player</b><br/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty team}">     
     <c:if test="${team.teamStatus == 'COMPLETE'}">
        <b>Defenders:</b>             
        <c:forEach items="${team.defenders}" var="d">
        <br/>
            <a href="${contextPath}/team/trade?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${d.poolPlayerId}">
            ${d.firstName}&nbsp;${d.lastName}
            </a>                              
        </c:forEach>

        <br/>
        <b>Mid Fielders:</b>     
        <c:forEach items="${team.midfielders}" var="f">
                <br/>
            <a href="${contextPath}/team/tradePlayer?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${f.poolPlayerId}">
            ${f.firstName}&nbsp;${f.lastName}</a>              
        </c:forEach>
                
        <br/>
        <b>Strikers:</b>   
        <c:forEach items="${team.strikers}" var="s">
            <br/>
            <a href="${contextPath}/team/tradePlayer?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${s.poolPlayerId}">
            ${s.firstName}&nbsp;${s.lastName}</a>            
        </c:forEach>        
        
        <br/>
        <b>Goal Keepers:</b>  
        <c:forEach items="${team.goalKeepers}" var="g">
            <br/>
            <a href="${contextPath}/team/tradePlayer?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${g.poolPlayerId}">
            ${g.firstName}&nbsp;${g.lastName}</a>
        </c:forEach>         
        
        <br/>
        <b>Substitutes:</b>
        <c:forEach items="${team.substitutes}" var="s">
            <br/>
            <a href="${contextPath}/team/tradePlayer?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${s.poolPlayerId}">
            ${s.firstName}&nbsp;${s.lastName}</a>                        
        </c:forEach>                 
     </c:if> 
      
    </c:if>
    
    <br/>
     <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
    
  </body>

</html>