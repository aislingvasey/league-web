<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - User League</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        /* body {color: #ffffff; background-color: #202020; }
        a {color: #FF6600; }
        a:visited {color: #FF6600; }
        a:hover {color: #FF6600; }
        a.message2:active { color: #FF0000 ; }
        a.message2:hover { color: #FF0000 ; }
        a.message2:visited { color: #FF0000 ; }
        .message { color: #FF0000 ; font-weight: bold; }
        .message2 { color: #FF0000 ; }
        .notification { color: #00FF00; font-weight: bold; } */
        body { color: #005A31; background: #A8CD1B; }
        h1 { color:  #F3FAB6; font-family: Verdana, sans-serif; text-transform: uppercase; font-size: 22px;}
        h2 { font-family: Verdana, sans-serif; font-size: 20px; margin: 0;}
        h3 { font-family: Verdana, sans-serif; font-size: 16px; margin: 0;}
        p, li { font-family: Georgia, serif; font-size: 16px; margin: 0;  }
        ol { margin: 0; margin-bottom: 2px;}
        a { text-decoration: none; color: #F3FAB6;  }
        a:hover { text-decoration: underline; color: #005A31; }
        .label { font-family: Verdana, sans-serif; font-weight: bold; margin-right: 5px; }
        .count { font-weight: 100; font-size: 16px; }
                .message { font-family: Verdana, sans-serif; color: #FF6423 ; font-weight: bold; padding: 2px; }
        .button-box { margin-top: 5px; margin-bottom: 7px; }
        .button { color: #F3FAB6; background: #005A31; padding: 5px;}
        a:hover.button { color: #F3FAB6; background: #327a5a; text-decoration: none; }
    </style>
  </head>

  <body>  
	  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	    	    
	  <c:if test="${not empty league}">
	      <b>${league.leagueName}</b><br/>
	  </c:if>
	  <c:if test="${empty league}">
	      <br/><span class="message">No League specified</span><br/>
	  </c:if>    
	  <c:if test="${not empty message}">    
        <span class="message">${message}</span><br/>
      </c:if>
    
	  <c:if test="${not empty league}">  
	       <c:set var="count" value="${league.teamCount}"/>  
	       Competing Teams:&nbsp;${count}
	       <br/>
	        
	       <c:if test="${not empty league.leagueTeamSummary}">
               <b>Top <%-- ${league.currentCount} --%> Teams in the League:</b><br/>
               <table>
               <tr>
                <td><b>Owner</b></td>
                <td><b>Name</b></td>
                <td><b>Score</b></td>
                <td><b>Position</b></td>
               </tr>
               <c:forEach items="${league.leagueTeamSummary}" var="team">
                    <tr>
                    <td>${team.username}</td>
                    <td>${team.teamName}</td>
                    <td align="right">${team.currentScore}</td>
                    <td align="right">${team.positionInLeague} / ${league.teamCount}</td>                    
                    </tr>                               
                </c:forEach>
                </table>
           </c:if>                 
	  </c:if>
	  <a href="${contextPath}/team/list?userid=${userid}">Back</a>
  </body>

</html>