<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    var JSONListTT = document.getElementById("taskTypes").value.replace("\\", "");
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
