<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - Teams Players</title>
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
    
    <span class="heading">Players</span><br/>
    
    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>
    
    Player Type: ${type}<br/>
    <c:if test="${not empty availableMoney}">
        Available Money: <fmt:formatNumber value="${availableMoney}" type="currency" currencySymbol="R" pattern="¤ #,##0"/><br/>
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
      </p>

  </body>

</html>