<%@page contentType="text/html" pageEncoding="UTF-8"%>
</div></div>
<!-- CONTENT end -->
<div id="footer"></div>
</div>
<!-- WRAPPER end -->
<script>
    if ((${userData.userID} !== 0) && (${userData.userID} !== null))
        document.getElementById('gutenTag').innerHTML = "Добрый день, " + "${userData.nameUser}" + "!";

</script>
