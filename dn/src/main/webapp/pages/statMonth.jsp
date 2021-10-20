<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file='styles/main.css' %>
            <%@include file='styles/stat.css' %>
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <jsp:include page="styles/userStyle.jsp" />
        <title>Статистика</title>
    </head>
    <body>
        <jsp:include page="templates/header.jsp" />


        <h2>Статистика за ${period}</h2>
        <table><tr>
                <td style="vertical-align: top; width: 200px;">
                    <h3>Выбор статистики</h3>
                    <div id="stats">
                        </br>
                        <div><a href="/statistics/year" id="statYear" class="button" style="width: 200px;">За последний год</a></div>
                        <div><a href="/statistics/month" id="statMonth" class="button" style="width: 200px;">За этот месяц</a></div>
                        <div><a href="/statistics/week" id="statWeek" class="button" style="width: 200px; display: none;">За последнюю неделю</a></div>

                    </div>

                </td>
                <td style="vertical-align: top; width: 800px; text-align: center;">
                    <div class="statBody">

                        <c:set var="TotalCount" value="${0}" />
                        <c:set var="MaxCount" value="${0}" />
                        <details class="tsk">
                            <summary>Подробнее</summary>
                            <table class="moreStat">
                                <thead>
                                <tr>
                                    <th rowspan="2">Рассматриваемые дни: ${daysList.size()}</th>
                                    <th rowspan="2">Число задач в месяц</th>
                                    <th colspan="4">Лучшие предложения</th>
                                </tr>
                                <tr>
                                    <th>Время</th>
                                    <th>${userData.custom.master}</th>
                                    <th>Услуга</th>
                                    <th>${userData.custom.location}</th>
                                </tr>
                                </thead>
                                <tbody><c:forEach var="day" items="${daysList}">
                                        <c:set var="TotalCount" value="${TotalCount + day.getTaskCount()}" />
                                        <c:if test="${day.getTaskCount()>MaxCount}">
                                            <c:set var="MaxCount" value="${day.getTaskCount()}" />
                                        </c:if>
                                    <tr>
                                        <td>${day.getToday()}</td>
                                        <td>${day.getTaskCount()}</td>
                                        <td>${day.printPopularTime()}</td>
                                        <td>${day.printMasters()}</td>
                                        <td>${day.printTypes()}</td>
                                        <td>${day.printLocations()}</td>
                                    </tr>
                                    </c:forEach></tbody>
                            </table>
                        </details>
                        <div id="statImg">
                            <c:if test="${MaxCount==0}">
                                <style>.item{bottom:-132px !important;}</style>
                            </c:if>
                            <div id="graph" class="graph vertical">
                                <c:forEach var="day" items="${daysList}">
                                    <div class="item" style="height: ${(day.getTaskCount()/MaxCount)*100+ifMaxZero}%; width: ${800/daysList.size()-15}px;" title="${day.printPopularTitle()}">
                                        ${day.getTaskCount()}
                                        <p class="inCol">${LocalDate.parse(day.getToday()).getDayOfMonth()}</br>
                                            <c:if test='${LocalDate.parse(day.getToday()).getDayOfWeek()=="MONDAY"}'>Пн</c:if>
                                            <c:if test='${LocalDate.parse(day.getToday()).getDayOfWeek()=="TUESDAY"}'>Вт</c:if>
                                            <c:if test='${LocalDate.parse(day.getToday()).getDayOfWeek()=="WEDNESDAY"}'>Ср</c:if>
                                            <c:if test='${LocalDate.parse(day.getToday()).getDayOfWeek()=="THURSDAY"}'>Чт</c:if>
                                            <c:if test='${LocalDate.parse(day.getToday()).getDayOfWeek()=="FRIDAY"}'>Пт</c:if>
                                            <c:if test='${LocalDate.parse(day.getToday()).getDayOfWeek()=="SATURDAY"}'>Сб</c:if>
                                            <c:if test='${LocalDate.parse(day.getToday()).getDayOfWeek()=="SUNDAY"}'>Вс</c:if>

                                            </p>
                                        </div>
                                </c:forEach>
                            </div></div>
                    </div>
                </td>
                <td style="vertical-align: top; padding-left: 10px;" class="rside">
                    <p>Всего задач за месяц: <b>${TotalCount}</b></p>
                    <p>Максимальное число задач в день: <b>${MaxCount}</b></p>
                    <p>Среднее число задач в день: <b>${String.format("%.3f", TotalCount/daysList.size())}</b></p>
                </td>
            </tr></table>
            <jsp:include page="templates/footer.jsp" />
    </body>
</html>
