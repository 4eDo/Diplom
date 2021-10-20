<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
// ============= Р А С Ч Ё Т   В Р Е М Е Н И ==========================
    duration_hh.addEventListener('input', function () {
        recalcTime();
    });
    duration_mm.addEventListener('input', function () {
        recalcTime();
    });
    t_start_hh.addEventListener('input', function () {
        recalcTime();
    });
    t_start_mm.addEventListener('input', function () {
        recalcTime();
    });

    function div(a, b) {
        return (a - a % b) / b;
    }
    ;

    function recalcTime() {
        if (!t_start_hh.value.length)
            t_start_hh.value = 0;
        if (!t_start_mm.value.length)
            t_start_mm.value = 0;
        if (!duration_mm.value.length)
            duration_mm.value = 0;
        if (!duration_hh.value.length)
            duration_hh.value = 0;
        var temp = 60 * duration_hh.value
                + 1 * t_start_mm.value
                + 60 * t_start_hh.value
                + 1 * duration_mm.value;
        t_end_mm.value = temp % 60;
        t_end_hh.value = div(temp, 60);
    }
// ============= А В Т О З А П О Л Н Е Н И Е   П О   Т И П У ==========

    $(function () {
        $('#name').change(function () {
            var abc = $("#nameList option[value='" + $('#name').val() + "']");
            if (abc.attr('data-durhh')) {
                duration_hh.value = Number(abc.attr('data-durhh'));
            } else {
                duration_hh.value = 0;
            }
            if (abc.attr('data-durmm')) {
                duration_mm.value = Number(abc.attr('data-durmm'));
            } else {
                duration_mm.value = 0;
            }
            if (abc.attr('data-price')) {
                price.value = abc.attr('data-price');
            }
            recalcTime();
        });

    });

    function resFields() {
        document.getElementById('name').value = "";
        duration_hh.value = 0;
        duration_mm.value = 0;
        price.value = 0;
        recalcTime();
    }

    function drawDataList() {
        var UD = "[" + '${userData.defTTypes}' + "]";
        UD = JSON.parse(UD);
        var UDlen = UD.length;
        var newOpt;
        for (let i = 0; i < UDlen; i++) {
            newOpt = document.createElement('option');
            newOpt.setAttribute('data-durhh', UD[i].Dur_hh);
            newOpt.setAttribute('data-durmm', UD[i].Dur_mm);
            newOpt.setAttribute('data-price', UD[i].Price);
            newOpt.value = UD[i].Name;
            nameList.append(newOpt);

        }
    }
    drawDataList();
    
// ============= П О В Т О Р  =========================================
    $('#goSubmRep').on('click', function () {
        var outStr = "";
        var repSubm = "";
        if ((getCheck(0) || !(getCheck(1) || getCheck(2) || getCheck(3) || getCheck(4) || getCheck(5) || getCheck(6) || getCheck(7)))) {
            outStr = "10000000";
            repSubm = "Повтор выключен";
            $('#isRep0').prop('checked', true);
            $('#isRep1').prop('checked', false);
            $('#isRep2').prop('checked', false);
            $('#isRep3').prop('checked', false);
            $('#isRep4').prop('checked', false);
            $('#isRep5').prop('checked', false);
            $('#isRep6').prop('checked', false);
            $('#isRep7').prop('checked', false);
        } else {
            outStr = "0" + getCheck(1) + getCheck(2) + getCheck(3) +
                    getCheck(4) + getCheck(5) + getCheck(6) + getCheck(7);
            repSubm = "Повторять в";
            getCheck(1) ? repSubm += " Пн" : repSubm += "";
            getCheck(2) ? repSubm += " Вт" : repSubm += "";
            getCheck(3) ? repSubm += " Ср" : repSubm += "";
            getCheck(4) ? repSubm += " Чт" : repSubm += "";
            getCheck(5) ? repSubm += " Пт" : repSubm += "";
            getCheck(6) ? repSubm += " Сб" : repSubm += "";
            getCheck(7) ? repSubm += " Вс" : repSubm += "";

        }
        repeat.value = outStr;
        document.getElementById('repSubm').innerHTML = repSubm;
    });

    function getCheck(num) {
        var id = "isRep" + num;
        if ($("#" + id).prop('checked')) {
            return 1;
        } else {
            return 0;
        }
    }

    document.getElementById('ownerId').value = localStorage.getItem("OwnerId");
    if (!repeat.value.length) {
        repeat.value = "10000000";
    }
    var repOpt = document.getElementById("repeat").value.split('');
    for (let i = 0; i < repOpt.length; i++) {
        let id = "isRep" + i;
        (repOpt[i] == 1) ? $('#' + id).prop('checked', true) : $('#' + id).prop('checked', false);
    }
    startDate.value = startDate2.value;
    function updDate(e) {
        startDate.value = e.target.value;
        console.log(startDate.value);
    }
// ======= О Т П Р А В К А ============================================
    $("#editOne").click(function () {
        $("#taskForm").attr("action", "/editOne");
        $("#taskForm").submit();
    });
    $("#editAfter").click(function () {
        $("#taskForm").attr("action", "/editAfter");
        $("#taskForm").submit();
    });
</script>
