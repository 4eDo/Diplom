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
        <title>Аккаунт</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page="templates/header.jsp" />
        <h1>Список пользователей</h1>

        <table>
            <tbody>
                <c:forEach var="user" items="${usersList}">

                    <tr>
                        <td>${user.id}</td>
                        <td>${user.nameU}</td>
                        <td>${user.mail}</td>
                        <td>${user.phone}</td>
                        <td>${user.CustToString()}</td>
                    </tr>   

                </c:forEach>
            </tbody>
        </table>

        <jsp:include page="templates/footer.jsp" />
    </body>
</html>
