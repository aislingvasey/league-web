<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Team Format</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/main.css" />" />
  </head>

  <body>  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
        
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>

      <c:if test="${not empty team}">  
           <span class="heading">Current Team Format:&nbsp;${team.currentFormat.name}</span>           
           <br/>
           <span class="hint">
           ${team.currentFormat.defenderCount}&nbsp;Defenders - ${team.currentFormat.midfielderCount}&nbsp;Mid Fielders - ${team.currentFormat.strikerCount}&nbsp;Strikers</span> 
           <br/>
           
           <c:if test="${not empty formats}">
               Select a new team format:<br/>     
               <c:forEach items="${formats}" var="format">
                    <a href="${contextPath}/team/setFormat?teamid=${team.id}&userid=${userid}&formatid=${format.id}">${format.name}</a><br/>                               
                </c:forEach>
           </c:if>                         
      </c:if>      
      
      <p class="navigation">
          <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
      </p>
  </body>

</html>