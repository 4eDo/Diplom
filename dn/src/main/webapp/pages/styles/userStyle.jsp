<style>
    #header, #footer, button, .button, .nav_button{
        background-color: ${userData.custom.colourSecundo} !important;
        color: ${userData.custom.colourTextSecundo}!important;
    }
    button:hover, .button:hover, .nav_button:hover{
        background-color:${userData.custom.colourHover} !important;
        color: ${userData.custom.colourTextSecundo}!important;}
    #content{
        background-color: ${userData.custom.colourPrimo}!important;
        color: ${userData.custom.colourTextPrimo}!important;
    }
    a{color:${userData.custom.colourLink} !important;}
    a:hover{color:${userData.custom.colourLinkHover} !important;}

    .tsk summary{background: ${userData.custom.colourSecundo}33!important;}

    #graph.graph{
        border: 1px dashed ${userData.custom.colourTextPrimo}33!important;
    }
    #graph .item{
        color: ${userData.custom.colourTextSecundo}!important; 
        background-color: ${userData.custom.colourSecundo}!important;
        box-shadow: 0 0 1px ${userData.custom.colourSecundo}!important;
    }
    #graph .item:hover{
        background-color: ${userData.custom.colourHover} !important;  
        box-shadow: 0 0 2px ${userData.custom.colourHover} !important;
    }

    .moreStat tbody tr:nth-child(odd){
        background-color: ${userData.custom.colourSecundo}11 !important;
    }

    th.sorted[data-order="1"],
    th.sorted[data-order="-1"] {
        background-color:${userData.custom.colourHover} !important;
        color: ${userData.custom.colourTextSecundo}!important;
    }

    .table_sort th{
        background-color: ${userData.custom.colourSecundo} !important;
        color: ${userData.custom.colourTextSecundo}!important;
    }
</style>

