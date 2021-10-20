<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file='styles/main.css' %>
            <%@include file='styles/editAcc.css' %>
        </style>
        <jsp:include page="styles/userStyle.jsp" />
        <title>Аккаунт</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page="templates/header.jsp" />
        <c:if test="${userData.userID == user.id}">
            <table>
                <tbody>
                    <tr>
                        <td style="vertical-align: top; width: 450px; padding-left: 10px;">
                            <h2>Настройки аккаунта</h2>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Имя пользователя:</td>
                                        <td>${user.nameU}</td>
                                    </tr>
                                    <tr>
                                        <td>Почта: </td>
                                        <td>${user.mail}</td>
                                    </tr>
                                    <tr>
                                        <td>Способ связи: </td>
                                        <td>${user.phone}</td>
                                    </tr>
                                    <tr>
                                        <td>Пароль:</td>
                                        <td>******</td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td class="propCol">
                            <h2>Настройки темы</h2>
                            <p class="litText">Отвечает за внешний вид приложения после авторизации</p>
                            <table border="0">
                                <tbody class='tr'>
                                    <tr>
                                        <td title="Наименование лица, оказывающего услугу.&#10Например, 'Тренер', 'Парикмахер', 'Репетитор'">🛈 Наименование мастера</td>
                                        <td>${user.custom_master}</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Наименование лица, получающего услугу.&#10Например, 'Ученик', 'Заказчик'">🛈 Наименование клиента</td>
                                        <td>${user.custom_client}</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Наименование места, связанного с оказанием услуги.&#10Например, 'Кабинет', 'Зал', 'Кресло'">🛈 Наименование места</td>
                                        <td>${user.custom_location}</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет основного фона блоков">🛈 Основной цвет</td>
                                        <td><input disabled name="user.custom_colourPrimo" type="color" value='${user.custom_colourPrimo}'/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет второстепенных элементов (некоторых заголовков, кнопок)">🛈 Дополнительный цвет</td>
                                        <td><input disabled name="user.custom_colourSecundo" type="color" value='${user.custom_colourSecundo}'/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет текста, отображаемого поверх основного цвета">🛈 Основной цвет текста</td>
                                        <td><input disabled name="user.custom_colourTextPrimo" type="color" value='${user.custom_colourTextPrimo}'/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет текста, отображаемого поверх дополнительного цвета">🛈 Дополнительный цвет текста</td>
                                        <td><input disabled name="user.custom_colourTextSecundo" type="color" value='${user.custom_colourTextSecundo}'/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет кнопки при наведении">🛈 Цвет кнопок при наведении</td>
                                        <td><input disabled name="user.custom_colourHover" type="color" value='${user.custom_colourHover}'/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет ссылки">🛈 Цвет ссылок</td>
                                        <td><input disabled name="user.custom_colourLink" type="color" value='${user.custom_colourLink}'/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет ссылки при наведении">🛈 Цвет ссылок при наведении</td>
                                        <td><input disabled name="user.custom_colourLinkHover" type="color" value='${user.custom_colourLinkHover}'/></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td class="propCol">
                            <h2>Настройки занятий</h2>
                            <p class="litText">Некоторые базовые виды занятий. Необходимы для быстрого заполнения определённых полей при создании новой задачи.</p>
                            <table id="DefT">
                                <tr><th>№</th><th>Наименование</th><th>Длительность</th><th>Цена</th></tr>
                            </table>
                            <div id="taskTypes" style="display:none;">${user.taskTypes}</div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <a class="button" href="/account/edit/${user.id}">Изменить</a>
        </c:if>
        <jsp:include page="scripts/scr_Account.jsp" />
        <jsp:include page="templates/footer.jsp" />
    </body>
</html>
