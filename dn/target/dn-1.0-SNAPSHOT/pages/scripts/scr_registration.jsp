<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    var $tabs = function (target) {
        var
                _elemTabs = (typeof target === 'string' ? document.querySelector(target) : target),
                _eventTabsShow,
                _showTab = function (tabsLinkTarget) {
                    var tabsPaneTarget, tabsLinkActive, tabsPaneShow;
                    tabsPaneTarget = document.querySelector(tabsLinkTarget.getAttribute('href'));
                    tabsLinkActive = tabsLinkTarget.parentElement.querySelector('.tabs__link_active');
                    tabsPaneShow = tabsPaneTarget.parentElement.querySelector('.tabs__pane_show');
                    // если следующая вкладка равна активной, то завершаем работу
                    if (tabsLinkTarget === tabsLinkActive) {
                        return;
                    }
                    // удаляем классы у текущих активных элементов
                    if (tabsLinkActive !== null) {
                        tabsLinkActive.classList.remove('tabs__link_active');
                    }
                    if (tabsPaneShow !== null) {
                        tabsPaneShow.classList.remove('tabs__pane_show');
                    }
                    // добавляем классы к элементам (в завимости от выбранной вкладки)
                    tabsLinkTarget.classList.add('tabs__link_active');
                    tabsPaneTarget.classList.add('tabs__pane_show');
                    document.dispatchEvent(_eventTabsShow);
                },
                _switchTabTo = function (tabsLinkIndex) {
                    var tabsLinks = _elemTabs.querySelectorAll('.tabs__link');
                    if (tabsLinks.length > 0) {
                        if (tabsLinkIndex > tabsLinks.length) {
                            tabsLinkIndex = tabsLinks.length;
                        } else if (tabsLinkIndex < 1) {
                            tabsLinkIndex = 1;
                        }
                        _showTab(tabsLinks[tabsLinkIndex - 1]);
                    }
                };

        _eventTabsShow = new CustomEvent('tab.show', {detail: _elemTabs});

        _elemTabs.addEventListener('click', function (e) {
            var tabsLinkTarget = e.target;
            // завершаем выполнение функции, если кликнули не по ссылке
            if (!tabsLinkTarget.classList.contains('tabs__link')) {
                return;
            }
            // отменяем стандартное действие
            e.preventDefault();
            _showTab(tabsLinkTarget);
        });

        return {
            showTab: function (target) {
                _showTab(target);
            },
            switchTabTo: function (index) {
                _switchTabTo(index);
            }
        }

    };

    $tabs('.tabs');

    function updDemo() {
        document.getElementById("demo").style.backgroundColor = document.getElementById("inp_c1").value;
        document.getElementById("demo_c1").style.backgroundColor = document.getElementById("inp_c1").value;
        document.getElementById("demo_c2").style.backgroundColor = document.getElementById("inp_c2").value;
        document.getElementById("demo_b").style.backgroundColor = document.getElementById("inp_c2").value;
        document.getElementById("demo_b").style.color = document.getElementById("inp_ct2").value;
        document.getElementById("demo_c1").style.color = document.getElementById("inp_ct1").value;
        document.getElementById("demo_c2").style.color = document.getElementById("inp_ct2").value;
        document.getElementById("demo_a").style.color = document.getElementById("inp_clink").value;
        document.getElementById("demo_a").onmouseenter = function () { // курсор зашёл на элемент-родитель [mozilla.org]
            this.style.color = document.getElementById("inp_clinkh").value;
        };
        document.getElementById("demo_a").onmouseleave = function () { // курсор ушёл с элемента-родителя
            this.style.color = document.getElementById("inp_clink").value;
        };
        document.getElementById("demo_b").onmouseenter = function () { // курсор зашёл на элемент-родитель [mozilla.org]
            this.style.backgroundColor = document.getElementById("inp_ch").value;
        };
        document.getElementById("demo_b").onmouseleave = function () { // курсор ушёл с элемента-родителя
            this.style.backgroundColor = document.getElementById("inp_c2").value;
        };
    }

    function updAllOk() {
        if ((mailOk.value == 1) && (passOk.value == 1)) {
            document.getElementById("outSubm").innerHTML = '<input type="submit" class="button" value="Зарегистрироваться"/>';

        } else {
            document.getElementById("outSubm").innerHTML = '<span id="errMsg">Не все поля заполнены верно!</span>';
        }
    }
    mail.addEventListener('input', function () {
        var re = /^[\w-\.]+@[\w-]+\.[a-z]{2,4}$/i;
        var myMail = this.value;
        var valid = re.test(myMail);
        if (!valid) {
            document.getElementById('errMail').innerHTML = 'Введите правильный адрес!';
            this.style.borderColor = 'red';
            this.style.outlineColor = 'red';
            mailOk.value = 0;

        } else {
            document.getElementById('errMail').innerHTML = '';
            this.style.borderColor = '';
            this.style.outlineColor = '';
            mailOk.value = 1;
        }
        updAllOk();
    });

    function checkPass() {
        if (document.getElementById('pass1').value !== document.getElementById('pass2').value) {
            document.getElementById('errPass').innerHTML = 'Пароли не совпадают!';
            pass1.style.borderColor = 'red';
            pass1.style.outlineColor = 'red';
            pass2.style.borderColor = 'red';
            pass2.style.outlineColor = 'red';
            passOk.value = 0;
        } else {
            document.getElementById('errPass').innerHTML = '';
            pass1.style.borderColor = '';
            pass1.style.outlineColor = '';
            pass2.style.borderColor = '';
            pass2.style.outlineColor = '';
            passOk.value = 1;
        }
        updAllOk();
    }
    ;
    pass2.addEventListener('input', function () {
        checkPass();
    });
    pass1.addEventListener('input', function () {
        checkPass();
    });

    var JSONListTT;
    drawTable();
    function addTT() {
        if (document.getElementById("nameDT").value.length == 0) {
            alert("Не заполнено название!");
        } else {
            if (JSONListTT == undefined || JSONListTT.length == 0) {
                JSONListTT = '{"Name":"' + document.getElementById("nameDT").value + '","Dur_hh":' + document.getElementById("hhDT").value + ',"Dur_mm":' + document.getElementById("mmDT").value + ',"Price":' + document.getElementById("priceDT").value + '}';
            } else {
                JSONListTT += ',{"Name":"' + document.getElementById("nameDT").value + '","Dur_hh":' + document.getElementById("hhDT").value + ',"Dur_mm":' + document.getElementById("mmDT").value + ',"Price":' + document.getElementById("priceDT").value + '}';
            }
            drawTable();
            document.getElementById("taskTypes").value = JSONListTT;
        }
    }
    function remTT() {
        if (confirm("Вы уверены? Это действие невозможно отменить.")) {
            var rowNum = document.getElementById("rem").value;
            document.getElementById("DefT").deleteRow(rowNum);
            let rn = parseInt(rowNum) - parseInt(1);
            var newJSON = "[" + JSONListTT + "]";
            newJSON = JSON.parse(newJSON);
            newJSON.splice(rn, 1);
            console.log(newJSON);
            let tempstr = JSON.stringify(newJSON);
            tempstr = tempstr.replace("[", "");
            tempstr = tempstr.replace("]", "");
            JSONListTT = tempstr;

            document.getElementById("taskTypes").value = JSONListTT;
            drawTable();
        }
    }
    function drawTable() {

        if (clearTable() == 1) {
            var newJSON = "[" + JSONListTT + "]";
            var newJSON = JSON.parse(newJSON);
            var newRow;
            var tempStr;
            var RemNum;
            for (let i = 0; i < newJSON.length; i++) {
                RemNum = parseInt(i) + parseInt(1);
                newRow = document.createElement('tr');
                tempStr = "<td>" + RemNum + "</td><td>" + newJSON[i].Name + "</td><td>" + newJSON[i].Dur_hh + "ч. " + newJSON[i].Dur_mm + "мин." + "</td><td>" + newJSON[i].Price + "</td>";
                newRow.innerHTML = tempStr;
                document.getElementById("DefT").append(newRow);
            }
        }
    }
    function clearTable() {
        var table = document.getElementById("DefT");
        while (table.rows.length > 1) {
            table.deleteRow(1);
        }
        return 1;
    }
</script>