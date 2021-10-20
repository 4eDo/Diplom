<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file='styles/main.css' %>
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <jsp:include page="styles/userStyle.jsp" />
        <title>Скачать расписание</title>
    </head>
    <body>
        <jsp:include page="templates/header.jsp" />
        <h2>Задачи c <%= java.time.LocalDate.now().toString()%> по ${endW}</h2>
        <br><center><a style="width:60vh;" class="button" onclick="tableToExcel('testTable', 'W3C Example Table')">Скачать таблицу для печати</a></center>
        <br><br><table border="1" id="testTable">
            <thead>
                <tr>
                    <th colspan="7">С <%= java.time.LocalDate.now().toString()%> по ${endW}</th>
                </tr>
                <tr>
                    <th>Время</th>
                    <th>Наименование</th>
                    <th>${userData.custom.master}</th>
                    <th>${userData.custom.client}</th>
                    <th>${userData.custom.location}</th>
                    <th>Стоимость</th>
                    <th>Описание</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="day" items="${weekList}">
                    <tr>
                        <td colspan="7"><center><br><b>${day.date}</b></center></td>
                    </tr>
                    ${day.emptyDay}
                    <c:forEach var="task" items="${day.tasks}">
                        <tr>
                            <td><c:if test="${task.t_start.hh<10}">0</c:if>${task.t_start.hh}:<c:if test="${task.t_start.mm<10}">0</c:if>${task.t_start.mm} - <c:if test="${task.t_end.hh<10}">0</c:if>${task.t_end.hh}:<c:if test="${task.t_end.mm<10}">0</c:if>${task.t_end.mm}</td>
                            <td>${task.name}</td>
                            <td>${task.getMaster()}</td>
                            <td>${task.getClient()}</td>
                            <td>${task.getLocation()}</td>
                            <td>${task.getPrice()}</td>
                            <td>${task.getDescription()}</td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </tbody>
        </table><br>

    <center><a style="width:60vh;" class="button" onclick="tableToExcel('testTable', 'W3C Example Table')">Скачать таблицу для печати</a></center>

        <jsp:include page="scripts/scr_download.jsp" />
        <jsp:include page="templates/footer.jsp" />
    </body>
</html>