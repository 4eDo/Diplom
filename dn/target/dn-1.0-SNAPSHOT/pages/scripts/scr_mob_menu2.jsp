
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    function showmobmenu() {
    if (document.getElementById('nav_mob').style.display == "block")
    {
        document.getElementById('nav_mob').style.display = "none";
        document.getElementById('nav_mob_button_x').style.display == "none";
    }
    else
    {
        document.getElementById('nav_mob').style.display = "block";
        document.getElementById('nav_mob_button_x').style.display = "block";
    }
}</script>