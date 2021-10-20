<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    var owId = localStorage.getItem("OwnerId");
    var isVis = document.querySelectorAll('.owId-' + owId);
    for (let i = 0; i < isVis.length; i++) {
        isVis[i].style.display = "table-row";
    }

    document.addEventListener("DOMContentLoaded", () => {

        var table, rows, switching, i, x, y, shouldSwitch;
        table = document.getElementById("tasksTable");
        switching = true;
        while (switching) {
            switching = false;
            rows = table.rows;
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = parseInt(rows[i-1].getElementsByTagName("TD")[0].innerHTML);
                y = parseInt(rows[i].getElementsByTagName("TD")[0].innerHTML);
                if (x > y) {
                    shouldSwitch = true;
                    break;
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i], rows[i-1]);
                switching = true;
            }
        }
    });


    function addLink(date, day) {
        var days = document.getElementById("days");
        var newDay = document.createElement("a");
        newDay.href = "/" + date;
        newDay.classList.add("button");
        var a = date;
        switch (day) {
            case 'MONDAY':
                a += ", Пн";
                break;
            case 'TUESDAY':
                a += ", Вт";
                break;
            case 'WEDNESDAY':
                a += ", Ср";
                break;
            case 'THURSDAY':
                a += ", Чт";
                break;
            case 'FRIDAY':
                a += ", Пт";
                break;
            case 'SATURDAY':
                a += ", Сб";
                break;
            case 'SUNDAY':
                a += ", Вс";
                break;
        }
        newDay.innerHTML = a;
        days.appendChild(newDay);
    }

    addLink('<%= java.time.LocalDate.now()%>', '<%= java.time.LocalDate.now().getDayOfWeek()%>');
    addLink('<%= java.time.LocalDate.now().plusDays(1)%>', '<%= java.time.LocalDate.now().plusDays(1).getDayOfWeek()%>');
    addLink('<%= java.time.LocalDate.now().plusDays(2)%>', '<%= java.time.LocalDate.now().plusDays(2).getDayOfWeek()%>');
    addLink('<%= java.time.LocalDate.now().plusDays(3)%>', '<%= java.time.LocalDate.now().plusDays(3).getDayOfWeek()%>');
    addLink('<%= java.time.LocalDate.now().plusDays(4)%>', '<%= java.time.LocalDate.now().plusDays(4).getDayOfWeek()%>');
    addLink('<%= java.time.LocalDate.now().plusDays(5)%>', '<%= java.time.LocalDate.now().plusDays(5).getDayOfWeek()%>');
    addLink('<%= java.time.LocalDate.now().plusDays(6)%>', '<%= java.time.LocalDate.now().plusDays(6).getDayOfWeek()%>');

    function updDate(e) {
        dtest.href = "/" + e.target.value;
    }

    var arr = ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"];
    var mon = ${TaskDate.getMonthValue()};
    var dOfW = "";
    switch ('${TaskDate.getDayOfWeek()}') {
        case 'MONDAY':
            dOfW = " (Понедельник)";
            break;
        case 'TUESDAY':
            dOfW = " (Вторник)";
            break;
        case 'WEDNESDAY':
            dOfW = " (Среда)";
            break;
        case 'THURSDAY':
            dOfW = " (Четверг)";
            break;
        case 'FRIDAY':
            dOfW = " (Пятница)";
            break;
        case 'SATURDAY':
            dOfW = " (Суббота)";
            break;
        case 'SUNDAY':
            dOfW = " (Воскресенье)";
            break;
    }
    taskDateSpan.innerHTML = "${TaskDate.getDayOfMonth()} " + arr[mon - 1] + " ${TaskDate.getYear()}" + dOfW;

    var reps = document.getElementsByClassName("tsk_repeat");
    var repLine;
    var repSubm;
    for (var i = 0; i < reps.length; i++) {
        repLine = reps[i].dataset.id;
        if (repLine == "10000000") {
            reps[i].innerHTML = "Без повтора";
        } else {
            repSubm = "";
            repLine.charAt(1) == '1' ? repSubm += " Пн" : repSubm += "";
            repLine.charAt(2) == '1' ? repSubm += " Вт" : repSubm += "";
            repLine.charAt(3) == '1' ? repSubm += " Ср" : repSubm += "";
            repLine.charAt(4) == '1' ? repSubm += " Чт" : repSubm += "";
            repLine.charAt(5) == '1' ? repSubm += " Пт" : repSubm += "";
            repLine.charAt(6) == '1' ? repSubm += " Сб" : repSubm += "";
            repLine.charAt(7) == '1' ? repSubm += " Вс" : repSubm += "";
            reps[i].innerHTML = repSubm;
        }
    }

    function openSp() {
        const splr = document.getElementsByTagName("details");
        if (document.getElementById("OpCl").getAttribute("data-operation") === "open") {
            for (i = 0; i < splr.length; i++) {
                splr[i].setAttribute("open", "");
            }
            document.getElementById("OpCl").innerHTML = "Свернуть детали";
            document.getElementById("OpCl").setAttribute("data-operation", "close");
        } else {
            for (i = 0; i < splr.length; i++) {
                splr[i].removeAttribute("open");
            }
            document.getElementById("OpCl").innerHTML = "Развернуть детали";
            document.getElementById("OpCl").setAttribute("data-operation", "open");
        }
    }
</script>
