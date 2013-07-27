<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - Your Team</title>
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
    
    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>
    
    <c:if test="${not empty team}">
            <span class="heading">Team: ${team.name}</span><br/>                        
            <c:if test="${team.status == 'INCOMPLETE'}">            
                Before your team can take part in the PFL, you need to set up your team and choose your players.<br/><br/> 
                You're playing in the <b>${team.userLeague.name}</b>. 
                You have a <b><fmt:formatNumber value="${team.availableMoney}" type="currency" currencySymbol="R" pattern="¤ #,##0"/></b> 
                budget to get the right players for your team.<br/>
                Be smart, you only get 1 free player trade every 2 weeks. You can however buy more player trades if necessary.<br/><br/>
                You get 4 substitutes that can be swapped with your current players. Each substitute can only be allocated to the correct position, eg: a striker must substitute another striker.<br/> 
                <br/>
                <a href="${contextPath}/team/players?userid=${userid}&teamid=${team.id}">Choose your Players</a>
            </c:if>   
    </c:if>

  </body>

</html>