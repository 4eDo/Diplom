<%@page contentType="text/html" pageEncoding="UTF-8" %>
<script>

    function addParam(param) {
        document.getElementById("SearchString").value += param;
    };

    function createExpr(arr) {
        var index = 0;
        var expr = [":containsiAND('" + arr[0] + "')"];
        for (var i = 1; i < arr.length; i++) {
            if (arr[i] === '__AND__') {
                expr[index] += ":containsiAND('" + arr[i + 1] + "')";
                i++;
            } else if (arr[i] === '__OR__') {
                index++;
                expr[index] = ":containsiOR('" + arr[i + 1] + "')";
                i++;
            }
        }
        return expr;
    }

    $(document).ready(function () {

        $(".searchKey").keyup(function () {
            var searchTerm = $(".searchKey").val().replace(/["']/g, "");
            var arr = searchTerm.split(/(__AND__|__OR__)/);
            var exprs = createExpr(arr);
            var searchSplit = searchTerm.replace(/__AND__/g, "'):containsiAND('").replace(/__OR__/g, "'):containsiOR('");

            $.extend($.expr[':'], {
                'containsiAND': function (element, i, match, array) {
                    return (element.textContent || element.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                },
                'containsiOR': function (element, i, match, array) {
                    return (element.textContent || element.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                }
            });

            $('.table_sort tbody tr').attr('visible', 'false');
            for (var expr in exprs) {
                $(".table_sort tbody tr" + exprs[expr]).each(function (e) {
                    $(this).attr('visible', 'true');
                });
            }

            var searchCount = $('.table_sort tbody tr[visible="true"]').length;

            $('.searchCount').text('найдено записей:' + searchCount + '\n');
            if (searchCount == '0') {
                $('.no-result').show();
            } else {
                $('.no-result').hide();
            }
            if ($('.searchKey').val().length == 0) {
                $('.searchCount').hide();
            } else {
                $('.searchCount').show();
            }
        });
    });

    document.addEventListener('DOMContentLoaded', () => {
        const getSort = ({target}) => {
            const order = (target.dataset.order = -(target.dataset.order || -1));
            const index = [...target.parentNode.cells].indexOf(target);
            const collator = new Intl.Collator(['en', 'ru'], {numeric: true});
            const comparator = (index, order) => (a, b) => order * collator.compare(
                a.children[index].innerHTML,
                b.children[index].innerHTML
            );

            for (const tBody of target.closest('table').tBodies)
                tBody.append(...[...tBody.rows].sort(comparator(index, order)));

            for (const cell of target.parentNode.cells)
                cell.classList.toggle('sorted', cell === target);
        };

        document.querySelectorAll('.table_sort thead').forEach(tableTH => tableTH.addEventListener('click', () => getSort(event)));

    });

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
</script>
