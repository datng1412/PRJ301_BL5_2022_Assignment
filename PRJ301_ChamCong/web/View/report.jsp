<%-- 
    Document   : report
    Created on : Aug 16, 2022, 9:46:36 AM
    Author     : Ngo Tung Son
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
        <div>
        <table border="1px" width="1400px">
            <tr>
                <td>Employee Name</td>
                <td>Contract Type</td>
                <td>Departments</td>
                <c:forEach items="${requestScope.dates}" var="d">                   
                    <td
                        <c:if test="${d.dow eq 1}">
                            style="background-color: yellow" 
                        </c:if>
                        >
                        <fmt:formatDate pattern = "dd" 
                                        value = "${d.value}" /> <br/>
                        <fmt:formatDate pattern = "EEE" 
                                        value = "${d.value}" />
                    </td>
                </c:forEach>
                <td>StartDate</td>
                <td>Hours</td>
                <td>Days</td>
            </tr> 
            <c:forEach items="${requestScope.emps}" var="e">
                <tr>
                    <td>${e.name}</td>                    
                    <td>${e.getContractType()}</td>
                    <td>${e.getDeptName()}</td>

                    <c:forEach items="${requestScope.dates}" var="d">
                        <td 
                            <c:if test="${d.dow eq 1 or d.dow eq 7}">
                                style="background-color: yellow" 
                            </c:if>
                            >
                            <c:forEach items="${e.timesheets}" var="t">
                                <c:if test="${d.value eq t.cidate}">
                                    ${t.getWorkingHours()}
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                    <td><fmt:formatDate pattern = "dd/MM/yyyy" 
                                    value = "${e.getStartDate()}" /></td>
                    <td>${e.getWorkingHours()}</td>
                    <td>${e.getWorkingDays()}</td>
                <tr>
                </c:forEach>
        </table>
            </div>
        <div>
        <table border="1px">
            <tr>
                <td>Employee Name</td>
                <td>AnnualLeave</td>
                <c:forEach items="${requestScope.emps2}" var="e2">  
                <tr>
                                            <td>${e2.name}</td>                    
                    <c:forEach items="${e2.annualLeaves}" var="a">
                        <td>${a.getAnnualLeave()}</td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </tr>
    </table>
        </div>
</body>
</html>
