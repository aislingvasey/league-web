<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Team Format</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        .message { color: #FF0000 ; font-weight: bold; }
    </style>
  </head>

  <body>  
      <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
        
      <b>Team Format</b><br/>  
        
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>

      <c:if test="${not empty team}">  
           Current Team Format:&nbsp;${team.currentFormat.name}
           <br/>
           <c:if test="${not empty formats}">
               Select new team format:<br/>     
               <c:forEach items="${formats}" var="format">
                    <a href="${contextPath}/team/setFormat?teamid=${team.id}&userid=${userid}&formatid=${format.id}">${format.name}</a><br/>                               
                </c:forEach>
           </c:if>                         
      </c:if>      
      
      <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
  </body>

</html>