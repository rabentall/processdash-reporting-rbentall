<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
<head>
<title>Activity Tracker</title>
<!--
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />  
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
<script>

$(document).ready( function () {
    $('#myTable').DataTable();
} );

</script>
-->

<script src="script/activityTracker.js" ></script>

</head>

<jsp:useBean id="planDates" class="java.util.HashMap" scope="request"/>
<c:forEach var="row" items="${pdash.query['select tdf.planItem.id, tdf.taskDate from TaskDateFact as tdf where tdf.measurementType.name=? ']['Plan']}">
<c:set target="${planDates}" property="${row[0]}" value="${row[1]}"/>
</c:forEach>

<jsp:useBean id="replanDates" class="java.util.HashMap" scope="request"/>
<c:forEach var="row" items="${pdash.query['select tdf.planItem.id, tdf.taskDate from TaskDateFact as tdf where tdf.measurementType.name=? ']['Replan']}">
<c:set target="${replanDates}" property="${row[0]}" value="${row[1]}"/>
</c:forEach>

<jsp:useBean id="forecastDates" class="java.util.HashMap" scope="request"/>
<c:forEach var="row" items="${pdash.query['select tdf.planItem.id, tdf.taskDate from TaskDateFact as tdf where tdf.measurementType.name=? ']['Forecast']}">
<c:set target="${forecastDates}" property="${row[0]}" value="${row[1]}"/>
</c:forEach>

<body onload="onload()">

<h2>Activity Tracker</h2>
<table border>
<thead>
<tr>
<th>Timer</th>
<th>Project/Task</th>
<th>Plan Time</th>
<th>Actual Time</th>
<th>Percent Spent</th>
<th>Plan Date</th>
<th>Replan Date</th>
<th>Forecast Date</th>
</tr>
</thead>
<tbody >

<c:forEach var="task" items="${pdash.query['from TaskStatusFact as t where t.actualCompletionDate = null']}">

<tr>
    <c:set var="planItem">${task.planItem}</c:set> 
    <c:set var="planItemId">${task.planItem.key}</c:set>
    <td><A HREF= "javascript:javascript:void(0)" onClick="javascript:toggleTimer('${planItem}')"><img border="0" title="Start timing" src="/control/startTiming.png"></A></td>
    <td><c:out value="${task.planItem}" /></td>
    <td><fmt:formatNumber value="${task.planTimeMin}"/></td>
    <td><fmt:formatNumber value="${task.actualTimeMin}"/></td>
    <td><c:if test="${task.planTimeMin > 0}"><fmt:formatNumber type="percent"
        value="${task.actualTimeMin / task.planTimeMin}"/></c:if></td>
    <td><c:out value="${planDates[planItemId]}"/></td>     
    <td><c:out value="${replanDates[planItemId]}"/></td>
    <td>
        <c:if test="${forecastDates[planItemId] != 'Cannot calculate'}">
            <c:out value="${forecastDates[planItemId]}"/>
        </c:if>
    </td>

</tr>

</c:forEach>
</tbody>
</table>
</body>
</html>