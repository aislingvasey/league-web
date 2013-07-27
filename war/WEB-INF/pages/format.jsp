<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - Team Format</title>
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
           <span class="heading">Current Team Format: ${team.currentFormat.name}</span>           
           <br/>
           <span class="hint">
           ${team.currentFormat.defenderCount} Defenders - ${team.currentFormat.midfielderCount} Mid Fielders - ${team.currentFormat.strikerCount} Strikers</span> 
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
           | 
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
           | 
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
      </p>
  </body>

</html>