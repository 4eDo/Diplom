<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file='styles/main.css' %>
            <%@include file='styles/registration.css' %>
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <title>Регистрация</title>
    </head>
    <body>
        <jsp:include page="templates/header.jsp" />
        <form action="createAcc/new" method="POST">

            <div class="tabs">
                <h3>Регистрация</h3>
                <div class="tabs__nav">
                    <a class="tabs__link tabs__link_active" href="#content-1">Шаг 1</a>
                    <a class="tabs__link" href="#content-2">Шаг 2</a>
                    <a class="tabs__link" href="#content-3">Шаг 3</a>
                    <a class="tabs__link" href="#content-4">Шаг 4</a>
                </div>
                <div class="tabs__content">
                    <div class="tabs__pane tabs__pane_show" id="content-1">
                        <h4>Данные пользователя</h4>
                        <table>
                            <tbody class="tr">
                                <tr>
                                    <td title="Введите имя пользователя.&#10Имя пользоавтеля может содержать любые символы">🛈 Имя</td>
                                    <td><input type="text" name="nameU" id="nameU" maxlength="50" minlength="2" /></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td title="Введите адрес электронной почты.&#10Он будет использоваться для авторизации">🛈 Почта</td>
                                    <td><input type="text" name="mail" id="mail" maxlength="100"/></td>
                                    <td id="errMail"></td>
                                </tr>
                                <tr>
                                    <td title="Укажите удобный для Вас способ связи.&#10(Можно добавлять примечания)">🛈 Способ связи</td>
                                    <td><input type="text" name="phone" id="phone" maxlength="100"/></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td title="Придумайте пароль.&#10Рекомендуется использовать буквы, цифры и специальные символы.">🛈 Пароль</td>
                                    <td><input type="password" name="pass1" id="pass1" maxlength="30" minlength="4" /></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td title="Повторно введите пароль">🛈 Повторите пароль</td>
                                    <td><input type="password" name="pass" id="pass2" maxlength="30" minlength="4"/></td>
                                    <td id="errPass"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tabs__pane" id="content-2">
                        <h4>Оформление</h4>
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        <table border="0">
                                                <tbody class='tr'>
                                                    <tr>
                                                        <td title="Наименование лица, оказывающего услугу.&#10Например, 'Тренер', 'Парикмахер', 'Репетитор'">🛈 Наименование мастера</td>
                                                        <td><input maxlength="100" type="text" name="custom_master" id="masterName" value="Мастер"/></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td title="Наименование лица, получающего услугу.&#10Например, 'Ученик', 'Заказчик'">🛈 Наименование клиента</td>
                                                        <td><input maxlength="100" type="text" name="custom_client" id="clientName" value="Клиент"/></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td title="Наименование места, связанного с оказанием услуги.&#10Например, 'Кабинет', 'Зал', 'Кресло'">🛈 Наименование места</td>
                                                        <td><input maxlength="100" type="text" name="custom_location" id="locationName" value="Место"/></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td title="Цвет основного фона блоков">🛈 Основной цвет</td>
                                                        <td><input id="inp_c1" name="custom_colourPrimo" type="color" value='#ffffff'/></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td title="Цвет второстепенных элементов (некоторых заголовков, кнопок)">🛈 Дополнительный цвет</td>
                                                        <td><input id="inp_c2" name="custom_colourSecundo" type="color" value='#dedede'/></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td title="Цвет текста, отображаемого поверх основного цвета">🛈 Основной цвет текста</td>
                                                        <td><input id="inp_ct1" name="custom_colourTextPrimo" type="color" value='#000000'/></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td title="Цвет текста, отображаемого поверх дополнительного цвета">🛈 Дополнительный цвет текста</td>
                                                        <td><input id="inp_ct2" name="custom_colourTextSecundo" type="color" value='#000000'/></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td title="Цвет кнопки при наведении">🛈 Цвет кнопок при наведении</td>
                                                        <td><input id="inp_ch" name="custom_colourHover" type="color" value='#f8f8f8'/></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td title="Цвет ссылки">🛈 Цвет ссылок</td>
                                                        <td><input id="inp_clink" name="custom_colourLink" type="color" value='#08330f'/></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td title="Цвет ссылки при наведении">🛈 Цвет ссылок при наведении</td>
                                                        <td><input id="inp_clinkh" name="custom_colourLinkHover" type="color" value='#0cb191'/></td>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                    </td><td style="vertical-align: top;">
                                        <div>
                                            <center>Пример используемых цветов</center>
                                            <div id="demo">
                                            <table>
                                                <tbody id="demoBody">
                                                    <tr id="demo_c2" style="padding: 10px; background-color:#dedede; color: #000000;">
                                                        <td>Заголовок</td>
                                                    </tr>
                                                    <tr id="demo_c1" style="padding: 10px; background-color:#ffffff; color: #000000;">
                                                        <td><p>Какой-то текст</p>
                                                            <p><a href="#" id="demo_a">Какая-то ссылка</a>
                                                            <a href="#" id="demo_b" class="button">Какая-то кнопка</a></p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            </div>
                                            <center><a href="#" class="button" onclick="updDemo()">Проверить</a></center>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tabs__pane" id="content-3">
                    <h4>Создание шаблонов задач</h4>
                        <div><br>
                            <h3>Добавление типа</h3>
                            <table border="0">
                                <tbody>
                                <tr>
                                    <td style="width: 170px;">Наименование услуги:</td>
                                    <td><input type="text" id="nameDT" maxlength="100"/></td>
                                </tr>
                                <tr>
                                    <td>Длительность:</td>
                                    <td><input type="number" id="hhDT" max="23" min="0" value="0"/>ч. <input type="number" id="mmDT" min="0" max="1440" value="0"/> мин.</td>
                                </tr>
                                <tr>
                                    <td>Стоимость:</td>
                                    <td><input type="number" id="priceDT" min="0" value="0.0"/></td>
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
                                    <td style="width: 170px;">Введите номер строки:</td>
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
                </div>
                    <div class="tabs__pane" id="content-4">
                        <h4>Завершение регистрации</h4>
                        <p id="outSubm"></p>
                    </div>
                </div>
            </div>
        </form>
        <input hidden type="number" id="mailOk"/>
        <input hidden type="number" id="passOk"/>
        <jsp:include page="templates/footer.jsp" />
        <jsp:include page="scripts/scr_registration.jsp" />
    </body>
</html>
