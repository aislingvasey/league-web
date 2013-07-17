<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Your Team</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/main.css" />" />
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty notification}">    
      <span class="notification">${notification}</span><br/>
    </c:if>
    
    <c:if test="${not empty team}">
            <span class="heading">Team: ${team.name}!</span><br/>                        
            <c:if test="${team.status == 'INCOMPLETE'}">            
                Before your team can compete, you need to set up your team and choose your players.<br/><br/> 
                You're playing in the <b>${team.userLeague.name}</b>. 
                You have a <b><fmt:formatNumber value="${team.availableMoney}" type="currency" currencySymbol="R" pattern="¤ # ##0"/></b> 
                budget to get the right players for your team.<br/>
                Be smart, you can only get one free player trade every two weeks. You can however buy more player trades if necessary.<br/><br/>
                You get 4 substitutes that can be swapped with your current players. Your substitute can only be allocated to the correct player position, for example: a striker must substitute another striker.<br/> 
                <br/>
                <a href="${contextPath}/team/players?userid=${userid}&teamid=${team.id}">Choose your Players</a>
            </c:if>   
    </c:if>

  </body>

</html>