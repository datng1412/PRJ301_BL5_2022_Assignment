<%-- 
    Document   : report
    Created on : Aug 16, 2022, 19:42:31 PM
    Author     : Tom
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/normalize.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>           
        <jsp:useBean id="dth" class="Helper.DateTimeHelper" />
        <table border="1px">
            <tr>
                <td>Employee Name</td>
                <td>Contract Type</td>
                <td>Departments</td>
                <c:forEach items="${requestScope.dates}" var="d">                   
                    <td
                        <c:if test="${dth.getDayOfWeek(d) eq 1}">
                            style="background-color: yellow" 
                        </c:if>
                        >
                        <fmt:formatDate pattern = "dd" 
                                        value = "${d}" /> <br/>
                        <fmt:formatDate pattern = "EEE" 
                                        value = "${d}" />
                    </td>
                </c:forEach>
                <td>RequestLeave</td>
                <td>StartDate</td>
                <td>Hours</td>
                <td>Days</td>
                <td>Annual Leave 1</td>
                <td>Annual Leave 2</td>
            </tr> 
            <c:forEach items="${requestScope.emps}" var="e">
                <tr>
                    <td>${e.name}</td>                    
                    <td>${e.getContractType()}</td>
                    <td>${e.getDeptName()}</td>

                    <c:forEach items="${requestScope.dates}" var="d">
                        <td 
                            <c:if test="${dth.getDayOfWeek(d) eq 1 or dth.getDayOfWeek(d) eq 7}">
                                style="background-color: yellow" 
                            </c:if>
                            >

                            <c:forEach items="${e.timesheets}" var="t">

                                <c:choose>
                                    <c:when test = "${d eq t.cidate}">
                                        ${t.getWorkingHours()}
                                    </c:when>
                                </c:choose>
                            </c:forEach>                                                     

                            <c:forEach items="${e.reqToLeaves}" var="r">
                                <c:if test="${d >= r.fromRemove and d <= r.toRemove}">
                                    <c:if test="${r.accept eq true}">
                                        <c:if test="${dth.getDayOfWeek(d) ne 7 and dth.getDayOfWeek(d) ne 1 }">
                                            <c:choose>
                                                <c:when test = "${r.type eq 2}">
                                                    ${r.getSymbolAll()}                                     
                                                </c:when>                                           
                                                <c:when test = "${r.type eq 3}">
                                                    ${r.getSymbolAll()}                                     
                                                </c:when>                                           
                                                <c:when test = "${r.type eq 4}">
                                                    ${r.getSymbolAll()}                                     
                                                </c:when>                                           
                                                <c:when test = "${r.type eq 5}">
                                                    ${r.getSymbolAll()}                                     
                                                </c:when>                                           
                                            </c:choose>
                                        </c:if>
                                        <c:if test="${dth.getDayOfWeek(d) eq 7}">
                                            <c:choose>
                                                <c:when test = "${r.type eq 2}">
                                                    ${r.getSymbolSat()}                                     
                                                </c:when>                                           
                                                <c:when test = "${r.type eq 3}">
                                                    ${r.getSymbolSat()}                                     
                                                </c:when>                                           
                                                <c:when test = "${r.type eq 4}">
                                                    ${r.getSymbolSat()}                                     
                                                </c:when>                                           
                                                <c:when test = "${r.type eq 5}">
                                                    ${r.getSymbolSat()}                                     
                                                </c:when>                                           
                                            </c:choose>
                                        </c:if>
                                    </c:if>
                                </c:if>
                            </c:forEach>

                        </td>
                    </c:forEach>
                    <td>${e.getTotalLeaves()}</td>
                    <td><fmt:formatDate pattern = "dd/MM/yyyy" 
                                    value = "${e.getStartDate()}" /></td>
                    <td>${e.getWorkingHours()}</td>
                    <td>${e.getWorkingDays()}</td>
                    <c:forEach items="${e.annualLeaves}" var="a">
                        <td>${a.getAnnualLeave1()}</td>
                        <td>${a.getAnnualLeave2()}</td>
                    </c:forEach>
                </tr>
            </c:forEach>

            <table border="1px">
                <tr>
                    <td>Symbol</td>
                    <td>Full Day</td>
                    <td>Half Day</td>
                    <td>Saturday</td>
                    <c:forEach items="${requestScope.symbols}" var="s">  
                    <tr>
                        <td>${s.sname}</td>                    
                        <td>${s.allday}</td>                    
                        <td>${s.halfday}</td>                      
                        <td>${s.saturday}</td>   
                    </tr>
                </c:forEach>
                </tr>
            </table>

    </body>
</html>
