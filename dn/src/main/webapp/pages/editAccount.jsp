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
        <title>Изменение настроек аккаунта</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page="templates/header.jsp" />

        <c:url value="/account/edit" var="var"/>
        <form action="${var}" method="POST"><input type="hidden" name="id" value="${user.id}" />
            <c:if test="${!empty user.nameU}">
                <input type="hidden" name="id" value="${user.id}" />
            </c:if>
            <table>
                <tbody>
                    <tr>
                        <td style="vertical-align: top; width: 450px; padding-left: 10px;">
                            <h2>Настройки аккаунта</h2>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Имя пользователя:</td>
                                        <td><input maxlength="50" type="text" name="nameU" id="name" value="${user.nameU}" /></td>
                                    </tr>
                                    <tr>
                                        <td>Почта: </td>
                                        <td><input maxlength="100" type="text" name="mail" id="mail" value="${user.mail}" /></td>
                                    </tr>
                                    <tr>
                                        <td>Способ связи: </td>
                                        <td><input maxlength="100" type="text" name="phone" id="phone" value="${user.phone}" /></td>
                                    </tr>
                                    <tr>
                                        <td>Пароль:</td>
                                        <td><input maxlength="30" type="text" name="pass" id="pass" value="${user.pass}" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td class="propCol">
                            <h2>Настройки темы</h2>
                            <table border="0">
                                <tbody class='tr'>
                                    <tr>
                                        <td title="Наименование лица, оказывающего услугу.&#10Например, 'Тренер', 'Парикмахер', 'Репетитор'">🛈 Наименование мастера</td>
                                        <td><input maxlength="100" type="text" name="custom_master" id="masterName" value="${user.custom_master}"/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Наименование лица, получающего услугу.&#10Например, 'Ученик', 'Заказчик'">🛈 Наименование клиента</td>
                                        <td><input maxlength="100" type="text" name="custom_client" id="clientName" value="${user.custom_client}"/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Наименование места, связанного с оказанием услуги.&#10Например, 'Кабинет', 'Зал', 'Кресло'">🛈 Наименование места</td>
                                        <td><input maxlength="100" type="text" name="custom_location" id="locationName" value="${user.custom_location}"/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет основного фона блоков">🛈 Основной цвет</td>
                                        <td><input name="custom_colourPrimo" type="color" value='${user.custom_colourPrimo}'/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет второстепенных элементов (некоторых заголовков, кнопок)">🛈 Дополнительный цвет</td>
                                        <td><input name="custom_colourSecundo" type="color" value='${user.custom_colourSecundo}'/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет текста, отображаемого поверх основного цвета">🛈 Основной цвет текста</td>
                                        <td><input name="custom_colourTextPrimo" type="color" value='${user.custom_colourTextPrimo}'/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет текста, отображаемого поверх дополнительного цвета">🛈 Дополнительный цвет текста</td>
                                        <td><input name="custom_colourTextSecundo" type="color" value='${user.custom_colourTextSecundo}'/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет кнопки при наведении">🛈 Цвет кнопок при наведении</td>
                                        <td><input name="custom_colourHover" type="color" value='${user.custom_colourHover}'/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет ссылки">🛈 Цвет ссылок</td>
                                        <td><input name="custom_colourLink" type="color" value='${user.custom_colourLink}'/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td title="Цвет ссылки при наведении">🛈 Цвет ссылок при наведении</td>
                                        <td><input name="custom_colourLinkHover" type="color" value='${user.custom_colourLinkHover}'/></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td class="propCol">
                            <h2>Настройки занятий</h2>
                            <p class="litText">Некоторые базовые виды занятий. Необходимы для быстрого заполнения определённых полей при создании новой задачи.</p>
                            <div><br>
                                <h3>Добавление типа</h3>
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Наименование услуги:</td>
                                            <td><input type="text" id="nameDT"  maxlength="100"/></td>
                                        </tr>
                                        <tr>
                                            <td>Длительность:</td>
                                            <td><input type="number" id="hhDT" value="0"/>ч. <input type="number" id="mmDT" value="0"/> мин.</td>
                                        </tr>
                                        <tr>
                                            <td>Стоимость:</td>
                                            <td><input type="number" id="priceDT" value="0.0"/></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><a href="#" class="button" id="add" onclick="addTT()">Добавить</a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div><br>
                            <div>
                                <h3>Удаление типа</h3>
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Введите номер строки:</td>
                                            <td><input type="number" id="rem" value="1" min="1"/></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><a href="#" class="button" id="remBut" onclick="remTT()">Удалить</a></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                            <br>
                            <table id="DefT">
                                <tr><th>№</th><th>Наименование</th><th>Длительность</th><th>Цена</th></tr>
                            </table>
                            <input type="hidden" id="taskTypes" name="taskTypes" value='${user.getTaskTypes()}'/>
                        </td>
                    </tr>
                </tbody>
            </table>

            <input class="button" type="submit" value="Сохранить изменения" />
            <a class="button" href="/account/${userData.userID}">Отмена</a>

        </form>
        <jsp:include page="scripts/scr_editAccount.jsp" />
        <jsp:include page="templates/footer.jsp" />
    </body>
</html>
