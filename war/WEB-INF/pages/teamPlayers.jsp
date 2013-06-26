<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Teams Players</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <b>Players</b><br/>
    
    <c:if test="${not empty message}">    
      <h3>${message}</h3>
    </c:if>
    Player Type:&nbsp;${type}<br/>
    <c:if test="${not empty players}">
        <c:forEach items="${players}" var="p">
            <a href="${contextPath}/team/addPlayer?userid=${userid}&teamid=${teamid}&type=${type}&team=${team}&poolplayerid=${p.poolPlayerId}">
            ${p.firstName}&nbsp;${p.lastName} - Price:&nbsp;${p.price}
            </a>                     
            <br/>
        </c:forEach>
    </c:if>

    <a href="${contextPath}/team/findPlayer?userid=${userid}&teamid=${teamid}&type=${type}">Back</a>

  </body>

</html>