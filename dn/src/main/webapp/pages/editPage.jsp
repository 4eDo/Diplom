<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file='styles/main.css' %>
            <%@include file='styles/editTask.css' %>
        </style>
        <jsp:include page="styles/userStyle.jsp" />
        <c:if test="${empty task.name}">
            <title>Добавить</title>
        </c:if>
        <c:if test="${!empty task.name}">
            <title>Изменить</title>
        </c:if>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page="templates/header.jsp" />
        <c:if test="${empty task.name}">
            <c:url value="/add" var="var"/>
        </c:if>
        <c:if test="${!empty task.name}">
            <c:url value="/editOne" var="var"/>
        </c:if>

        <form id="taskForm" action="${var}" method="POST">
            <c:if test="${!empty task.name}">
                <input type="hidden" name="task.id" value="${task.id}" />
            </c:if>
            <c:if test="${!empty task.name}">
                <input type="hidden" name="task.ownerId" id="ownerId" value="${task.ownerId}" />
            </c:if>
            <input type="hidden" id="startDate" name="startDate"/>
            <table border="0">
                <tbody>
                    <tr>
                        <td style="width: 150px;">Дата начала задачи</td>
                        <td><input type="date" id="startDate2" min="<%= java.time.LocalDate.now()%>" name="startDate2" onchange="updDate(event);"/></td>
                    </tr>
                    <tr>
                        <td><lable for="name">Наименование</lable></td>
                <td><input list="nameList" type="text" name="name" id="name" maxlength="100" value="${task.name}" />
                    <span onclick="resFields()" class="pointer" title="Сбросить">&#10006;</span>
                    <datalist id="nameList"></datalist></td>
                </tr>
                <tr>
                    <td><lable for="duration">Длительность</lable></td>
                <td><input type="number" step="1" name="duration_hh" min="0"  max="23" id="duration_hh" value="${task.duration_hh}" /> ч.
                    <input type="number" step="1" name="duration_mm" min="0"  max="1440" id="duration_mm" value="${task.duration_mm}" /> мин.
                </td>
                </tr>
                <tr>
                    <td><lable for="t_start">Начало</lable></td>
                <td><input type="number" step="1" name="t_start_hh" min="0" max="23" id="t_start_hh" value="${task.t_start_hh}" /> ч.
                    <input type="number" step="1" name="t_start_mm" min="0" max="1440"  id="t_start_mm" value="${task.t_start_mm}" /> мин.</br>
                </td>
                </tr>
                <tr>
                    <td><lable for="t_end">Конец</lable></td>
                <td><input type="number" name="t_end_hh" min="0" id="t_end_hh" value="${task.t_end_hh}" readonly /> ч.
                    <input type="number" name="t_end_mm" min="0" id="t_end_mm" value="${task.t_end_mm}" readonly /> мин.</br>
                </td>
                </tr>
                <tr>
                    <td><lable for="repeat">Повтор</lable></td>
                <td><table>
                        <tr>
                            <td><label><input class="isRep" type="checkbox" value="0" id="isRep0" /> Без повтора</label></td>
                            <td><label><input class="isRep" type="checkbox" value="1" id="isRep1" /> Пн</label></td>
                            <td><label><input class="isRep" type="checkbox" value="2" id="isRep2" /> Вт</label></td>
                            <td><label><input class="isRep" type="checkbox" value="3" id="isRep3" /> Ср</label></td>
                            <td><label><input class="isRep" type="checkbox" value="4" id="isRep4" /> Чт</label></td>
                            <td><label><input class="isRep" type="checkbox" value="5" id="isRep5" /> Пт</label></td>
                            <td><label><input class="isRep" type="checkbox" value="6" id="isRep6" /> Сб</label></td>
                            <td><label><input class="isRep" type="checkbox" value="7" id="isRep7" /> Вс</label></td>
                            <td><span id="goSubmRep" class="pointer button" style="font-weight: bold;">Подтвердить повтор</span></td>
                        </tr>
                        <tr>
                            <td colspan="8" id="repSubm"></td>
                        </tr>
                    </table>

                    <c:if test="${empty task.repeat}">
                        <input type="hidden" name="repeat" id="repeat" value="10000000" readonly/>
                    </c:if>
                    <c:if test="${!empty task.repeat}">
                        <input type="hidden" name="repeat" id="repeat" value="${task.repeat}" readonly/>
                    </c:if></td>
                </tr>
                <tr>
                    <td><lable for="master">${userData.custom.master}</lable></td>
                <td><input type="text" name="master" id="master" maxlength="50" value="${task.master}" /></td>
                </tr>
                <tr>
                    <td><lable for="client">${userData.custom.client}</lable></td>
                <td><input type="text" name="client" id="client" maxlength="50" value="${task.client}" /></td>
                </tr>
                <tr>
                    <td><lable for="location">${userData.custom.location}</lable></td>
                <td> <input type="text" maxlength="100" name="location" id="location" value="${task.location}" /></td>
                </tr>
                <tr>
                    <td><lable for="price">Стоимость</lable></td>
                <td><input type="number" name="price" step="0.5" min="0" id="price" value="${task.price}" /></td>
                </tr>
                <tr>
                    <td><lable for="description">Описание</lable></td>
                <td><textarea name="description" id="description" maxlength="500" rows="4" cols="20">${task.description}</textarea></td>
                </tr>
                </tbody>
            </table>



            </br>


            </br>
            <c:if test="${empty task.name}">
                <input type="submit" value="Добавить" class="button"/>
            </c:if>
            <c:if test="${!empty task.name}">
                <input id="editOne" type="submit" value="Сохранить изменения только одной задачи" class="button"/>
                <input id="editAfter" type="submit" value="Сохранить изменения этой и следующих задач" class="button"/>
            </c:if>
            <a href="/" class="button">Отмена</a>
            <c:if test="${!empty task.name}">
                <script>document.getElementById("startDate2").defaultValue = "${task.startDate}";
                    document.getElementById("startDate").value = "${task.startDate}";</script>
                </c:if>
                <c:if test="${empty task.name&&empty TaskDate}">
                <script>
                    document.getElementById("startDate2").defaultValue = "${LocalDate.now()}";
                    document.getElementById("startDate").value = "${LocalDate.now()}";
                </script>
            </c:if>
            <c:if test="${!empty TaskDate}">
                <script>
                    document.getElementById("startDate2").value = "${TaskDate}";
                    document.getElementById("startDate").value = "${TaskDate}";</script>
                </c:if>
        </form>
        <jsp:include page="scripts/scr_editPage.jsp" />
        <jsp:include page="templates/footer.jsp" />
    </body>
</html>
