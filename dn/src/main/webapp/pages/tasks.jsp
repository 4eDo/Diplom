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
        <jsp:include page="styles/userStyle.jsp" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <title>Задачи</title>
    </head>
    <body>
        <jsp:include page="templates/header.jsp" />
        <h2>Задачи на <span id="taskDateSpan"></span></h2>
        <table><tr>
                <td style="vertical-align: top; width: 200px;">
                    <h3>Дата</h3>
                    <div id="days">

                    </div>
                    <h4>Другой день</h4>
                    <div>
                        <input type="date" id="otherDate" min='<%= java.time.LocalDate.now().minusYears(1)%>'  onchange="updDate(event);"/>
                        <a href="#" id="dtest" class="button">Перейти</a>
                    </div>
                        <div style="bottom:50px;"><a href="/statistics/year" id="stat" class="button">Статистика</a></div>

                </td>
                <td style="vertical-align: top; width: 800px;">
                    <table id="tasksTable">
                        <c:forEach var="task" items="${tasksList}"><c:if test="${userData.userID == task.ownerId}">
                                <tr>
                                    <td hidden>${task.t_start.convTimeToMin()}</td>
                                    <td>
                                        <div class='tsk'>
                                            <details>
                                                <summary><div style="padding: 5px;">
                                                        <div class="tsk_time" title='${task.duration.convTimeToMin()} минут'>
                                                            <c:if test="${task.t_start.hh<10}">0</c:if>${task.t_start.hh}:<c:if test="${task.t_start.mm<10}">0</c:if>${task.t_start.mm} - <c:if test="${task.t_end.hh<10}">0</c:if>${task.t_end.hh}:<c:if test="${task.t_end.mm<10}">0</c:if>${task.t_end.mm}
                                                            </div>
                                                                        <span class="ttime">${task.t_start.hh*60+task.t_start.mm}</span>
                                                        <div class="tsk_name">${task.name}</div>
                                                        <div class="tsk_mas"><span class="descr_bef">${userData.custom.master}: </span>${task.getMaster()}</div>
                                                        <div class="tsk_cli"><span class="descr_bef">${userData.custom.client}: </span>${task.getClient()}</div>
                                                        <div class="tsk_loc"><span class="descr_bef">${userData.custom.location}: </span>${task.getLocation()}</div>
                                                    </div></summary>
                                                <div style="column-count: 2;"><div><div class="descr_bef">Стоимость:   </div><div class="tsk_price">${task.getPrice()}</div></div>

                                                    <div><span class="descr_bef">Повтор:</span>
                                                        <div class="tsk_repeat" data-id="${task.getRepeat()}"></div></div></div>
                                                <div style="display:block;"><div class="descr_bef">Описание</div>
                                                    <div class="tsk_descr">${task.getDescription()}</div>
                                                </div>
                                                <span class="descr_bef">Действия:</span>
                                                <div class="tsk_act">

                                                    <a class="button" href="/deleteOne/${task.id}/${TaskDate}">Отменить одну</a>
                                                    <a class="button" href="/edit/${task.id}/${TaskDate}">Изменить</a>
                                                    <a class="button" href="/deleteAfter/${task.id}/${TaskDate}">Удалить эту и следующие</a>
                                                </div>
                                            </details>
                                        </div></td></tr>
                                    </c:if></c:forEach>
                            <tr style="width:800px;"></tr>
                        <c:if test="${tasksList.size()<1}">
                            <tr><td>Задач на этот день нет</td></tr>
                        </c:if>
                        </table>

                    </td>
                    <td style="vertical-align: top;" class="rside">
                    <c:url value="/add" var="add"/>
                    <a href="#" id="OpCl" class="button" onclick="openSp()" data-operation="open">Развернуть детали</a>
                    <br><br>
                    <a href="/download/7" id="dwnWeek" class="button">Скачать расписание на ближайшие 7 дней</a>
                    <a href="/download/30" id="dwnWeek" class="button">Скачать расписание на ближайшие 30 дней</a>
                    <br><br>
                    <a href="${add}" class="button">Добавить новую</a>
                    <a href="${add}/${TaskDate}" class="button">Добавить на этот день</a>
                </td>
            </tr></table>

        <jsp:include page="scripts/scr_tasks.jsp" />
        <jsp:include page="templates/footer.jsp" />
    </body>
</html>
