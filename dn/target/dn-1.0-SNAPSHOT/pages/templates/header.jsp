<%-- 
    Document   : header
    Created on : 24 апр. 2021 г., 18:15:50
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- WRAPPER beg -->
<div id="wrapper">
<div id="header">
    <div id="nav">
            <table border="0">
                <tbody>
                    <tr><c:if test="${userData.userID>0}">
                        <td class="nav_button" onclick="window.location.href = '/';">Список задач</td>
                        <td class="nav_button" onclick="window.location.href = '/account/${userData.userID}';">Настройки</td>
                        <td class="nav_button" onclick="window.location.href = '/all';">Все задачи</td>
                        <td class="nav_button" onclick="window.location.href = '/logout';" id="logout">Выход</td>
                        </c:if><c:if test="${userData.userID<1}">
                        <td class="nav_button" onclick="window.location.href = '/loginPage';" id="login">Вход</td>
                        <td class="nav_button" onclick="window.location.href = '/createAcc';">Регистрация</td>
                        </c:if>
                        <td id="gutenTag"></td>
                        <td>Текущая дата: <%= java.time.LocalDate.now()%></td>
                    </tr>
                </tbody>
            </table>
        </div>
</div>
    <!-- CONTENT beg -->
    <div id="content"><div id="cbd">
