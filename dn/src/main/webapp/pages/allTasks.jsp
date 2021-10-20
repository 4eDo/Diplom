<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        <%@include file='styles/main.css' %>
        <%@include file="styles/allTasks.css"%>
    </style>
    <jsp:include page="styles/userStyle.jsp"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <c:if test='${type.equals("cur")}'><title>Задачи</title></c:if>
    <c:if test='${type.equals("arc")}'><title>Задачи (Архив)</title></c:if>

</head>
<body>
<jsp:include page="templates/header.jsp"/>

<c:if test='${type.equals("cur")}'><h1>Актуальные задачи</h1></c:if>
<c:if test='${type.equals("arc")}'><h1>Архив задач</h1></c:if>

<p class="litText">Нажмите на заголовок столбца, чтобы отсортировать записи в таблице</p>
<div id="topbar">
    <div id="seInp">
        <p>&#128270;<input ENGINE="text" class="searchKey" placeholder="Поиск по таблице" id="SearchString">
            <button title="Все варианты" onclick="addParam('__AND__')" class="button"> И</button>
            <button title="Хотя бы один" onclick="addParam('__OR__')" class="button"> Или</button>
        </p>
    </div>
    <div id="archLink">

        <c:if test='${type.equals("cur")}'> <a href="/all/archive" class="button">Архив задач</a> </c:if>
        <c:if test='${type.equals("arc")}'> <a href="/all" class="button">Актуальные задачи</a> </c:if>

    </div>
</div>
<br>&nbsp;<span class="searchCount"></span>
<table border="1" id="tasksTable" class="table_sort">
    <thead>
    <tr>
        <th>Даты начала</br>и окончания</th>
        <th>Наименование</th>
        <th>Время</th>
        <th>Повтор</th>
        <th>${userData.custom.master}</th>
        <th>${userData.custom.client}</th>
        <th>${userData.custom.location}</th>
        <th>Стоимость</th>
        <th>Действие</th>
    </tr>
    </thead>
    <tbody>
    <tr class="no-result">
        <td colspan="9">Совпадения не найдены</td>
    </tr>
    <c:forEach var="task" items="${tasksList}">
        <tr class="owId-${task.getOwnerId()}">
            <td>${task.startDate} - <c:if test='${task.endDate.equals("0")}'>...</c:if><c:if
                    test='${!task.endDate.equals("0")}'>${task.endDate}</c:if></td>
            <td>${task.name}</td>
            <td><c:if test="${task.t_start.hh<10}">0</c:if>${task.t_start.hh}:<c:if
                    test="${task.t_start.mm<10}">0</c:if>${task.t_start.mm} - <c:if test="${task.t_end.hh<10}">0</c:if>${task.t_end.hh}
                :<c:if test="${task.t_end.mm<10}">0</c:if>${task.t_end.mm}
            </td>
            <td>
                <div class="tsk_repeat" data-id="${task.getRepeat()}"></div>
            </td>
            <td>${task.getMaster()}</td>
            <td>${task.getClient()}</td>
            <td>${task.getLocation()}</td>
            <td>${task.getPrice()}</td>
            <td>

                <c:if test='${type.equals("cur")}'>
                <a class="button" href="/edit/${task.id}/${TaskDate}">Изменить</a>
                <a class="button" href="/deleteAfter/${task.id}/${TaskDate}">Удалить</a></td>
            </c:if>
            <c:if test='${type.equals("arc")}'>
                <a class="button" href="/edit/${task.id}/${TaskDate}">Восстановить</a>
            </c:if>


        </tr>
    </c:forEach>

    </tbody>
</table>

<jsp:include page="templates/footer.jsp"/>
<jsp:include page="scripts/scr_allTasks.jsp"/>
</body>
</html>
