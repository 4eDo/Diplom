<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Вход</title>
        <style>
            <%@include file='styles/main.css' %>
            <%@include file='styles/login.css' %>
        </style>
    </head>
    <body>
        <jsp:include page="templates/header.jsp" />
        <div id="logIn">
            <div id="enterData">
                <center><h3>Вход</h3></center>
                <spring:form method="post"  modelAttribute="userData" action="loginPage/check-user">
                    <p>Почта: <spring:input path="mail" id="userMail" type="text" maxlength="100" placeholder="example@example.com" /></p>
                    <p>Пароль: <spring:input path="pass" id="userPass" type="password" maxlength="30"/></p>
                    <p id="ifErr"></p>
                    <spring:button id="btnLgIn">Войти</spring:button>

                </spring:form>
                <p><button id="btnRg" onclick="window.location.href = '/createAcc';">Регистрация</button></p>

            </div>
        </div>
        <script>
            const queryString = window.location.search;
            console.log(queryString);
            const urlParams = new URLSearchParams(queryString);
            const errMsg = urlParams.get('errMsg');
            console.log(errMsg);
            if(errMsg==1){
                let e = document.getElementById("ifErr");
                //alert("Ошибка авторизации! Проверьте правильность ввода логина и пароля");
                e.innerHTML="Ошибка авторизации! Проверьте правильность ввода логина и пароля";
                e.style.color="red";
                document.getElementById("userMail").style.outlineColor="red";
                document.getElementById("userPass").style.outlineColor="red";
                document.getElementById("userMail").style.borderColor="red";
                document.getElementById("userPass").style.borderColor="red";
            }


            userMail.addEventListener('input', function () {
                var re = /^[\w-\.]+@[\w-]+\.[a-z]{2,4}$/i;
                var myMail = this.value;
                var valid = re.test(myMail);
                if (!valid) {
                    document.getElementById('ifErr').innerHTML = 'Адрес должен иметь формат "example@example.com"';
                    document.getElementById('ifErr').style.color="red";
                    this.style.borderColor = 'red';
                    this.style.outlineColor = 'red';

                } else {
                    document.getElementById('ifErr').innerHTML = '';
                    document.getElementById('ifErr').style.color="";
                    this.style.borderColor = '';
                    this.style.outlineColor = '';
                }

                var count = this.value;

                if (count.length >99)
                {
                    document.getElementById('ifErr').innerHTML = 'Адрес не может содержать более 100 символов!';
                    document.getElementById('ifErr').style.color="red";

                }else {
                    document.getElementById('ifErr').innerHTML = '';
                    document.getElementById('ifErr').style.color="";
                }
            });
        </script>

        <script async src="//cdn.jsdelivr.net/npm/@fingerprintjs/fingerprintjs@3/dist/fp.min.js" onload="initFingerprintJS()"></script>
    <jsp:include page="templates/footer.jsp" />
    </body>
</html>
