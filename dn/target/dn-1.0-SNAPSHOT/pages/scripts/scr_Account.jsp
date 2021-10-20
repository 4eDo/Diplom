<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    var JSONListTT = document.getElementById("taskTypes").innerHTML.replace("\\", "");
    drawTable();
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
