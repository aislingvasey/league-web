<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - Select a Player</title>
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
  
  <mxit:advert auid=""/> 
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  
    <div class="logo">
        <img src="<c:url value="/resources/soccer-logo-small.png" />" />
    </div>
    
    <span class="heading">Select a Player to be Substituted</span><br/>
    <span class="hint">Your substitute can only be allocated to the correct player position, for example: striker must substitute another striker.<br/>
    The captain can't be substituted. Make someone else the captain first.</span><br/> 
    
    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>
    
    <c:if test="${not empty team}"> 
               
        <c:set var="count" value="1" scope="page" />       
        
        <c:if test="${not empty team.defenders}"><br/><b>Defenders</b></c:if>                      
        <c:forEach items="${team.defenders}" var="d">
          <br/>${count} 
            <c:if test="${captainid != d.poolPlayerId}">                
                <a href="${contextPath}/team/swapPlayers?userid=${userid}&teamid=${teamid}&poolplayerid=${d.poolPlayerId}&substituteid=${substituteid}">
                ${d.firstName} ${d.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainid == d.poolPlayerId}">
                ${d.firstName} ${d.lastName} (Captain)
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>                     
        </c:forEach>     
        
        <c:if test="${not empty team.midfielders}"><br/><b>Mid Fielders</b></c:if> 
        <c:forEach items="${team.midfielders}" var="f">
            <br/>${count} 
            <c:if test="${captainid != f.poolPlayerId}">                
                <a href="${contextPath}/team/swapPlayers?userid=${userid}&teamid=${teamid}&poolplayerid=${f.poolPlayerId}&substituteid=${substituteid}">
                ${f.firstName} ${f.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainid == f.poolPlayerId}">
                ${f.firstName} ${f.lastName} (Captain)
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>          
        </c:forEach>
                
        <c:if test="${not empty team.strikers}"><br/><b>Strikers</b></c:if>         
        <c:forEach items="${team.strikers}" var="s">
            <br/>${count} 
            <c:if test="${captainid != s.poolPlayerId}">                
                <a href="${contextPath}/team/swapPlayers?userid=${userid}&teamid=${teamid}&poolplayerid=${s.poolPlayerId}&substituteid=${substituteid}">
                ${s.firstName} ${s.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainid == s.poolPlayerId}">
                ${s.firstName} ${s.lastName} (Captain)
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>                  
        </c:forEach>        
        
        <c:if test="${not empty team.goalKeepers}"><br/><b>Goal Keepers</b></c:if> 
        <c:forEach items="${team.goalKeepers}" var="g">
            <br/>${count} 
            <c:if test="${captainid != g.poolPlayerId}">                
                <a href="${contextPath}/team/swapPlayers?userid=${userid}&teamid=${teamid}&poolplayerid=${g.poolPlayerId}&substituteid=${substituteid}">
                ${g.firstName} ${g.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainid == g.poolPlayerId}">
                ${g.firstName} ${g.lastName} (Captain)
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>                      
        </c:forEach>                       
                                        
     </c:if>  
    
     
    <p class="navigation">
          <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
           | 
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
           | 
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
          |
              <a href="${contextPath}/terms.jsp?userid=${userid}">T&amp;C</a>
      </p>
  </body>

</html>