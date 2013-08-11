<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - Teams Players</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body { color: #977038; background: #FFFFFF; }
        .heading { color: #846231; font-weight: bold; }
        .list { margin: 0; margin-bottom: 5px; margin-left: 15px;}
        .label { margin-right: 5px; font-weight: bold; }
        .count { font-weight: 100; }
        .message-box { padding-top: 5px; padding-bottom: 5px; }
        .message { color: #FC1108; font-weight: bold; padding: 1px; }
        .notification { color: #FFFFFF; background: #977038; font-weight: bold; padding: 1px; }
        .hint { font-size: smaller; }
    </style>
  </head>

  <body>  
  
  <mxit:advert auid=""/> 
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <div class="logo">
        <img src="<c:url value="/resources/logo.png" />" />
    </div>
    
     <c:if test="${not empty teamLogo}">
        <img src="<c:url value="/resources/images/teams/${teamLogo}" />" /><br/>
    </c:if>
    
    <span class="heading">Select a ${type}</span><br/>
    
    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>
    
    <%-- Player Type: ${type}<br/> --%>
    <c:if test="${not empty availableMoney}">
        Your available money: <fmt:formatNumber value="${availableMoney}" type="currency" currencySymbol="R" pattern="¤ #,##0"/><br/>
    </c:if>
    <c:if test="${not empty players}">
        <c:forEach items="${players}" var="p">
            <a href="${contextPath}/team/addPlayer?userid=${userid}&teamid=${teamid}&type=${type}&team=${team}&poolplayerid=${p.poolPlayerId}">
            ${p.firstName} ${p.lastName}</a>  
            <c:if test="${type == 'Substitute'}">
                 (${p.block}) 
            </c:if>
             <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="R" pattern="¤ #,##0"/>                               
            <br/>
        </c:forEach>
    </c:if>
    
    <p class="navigation">
          <a href="${contextPath}/team/findPlayer?userid=${userid}&teamid=${teamid}&type=${type}">Back</a>
           | 
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
           | 
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
          |
              <a href="${contextPath}/terms.jsp?userid=${userid}">T&amp;C</a>
      </p>

  </body>

</html>