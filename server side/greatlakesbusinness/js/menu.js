$(document).ready(function(){

    $("#show_menu").click(function(){
        var menuDiv=document.getElementById("menu");
        menuDiv.style.left="0px";
    });

    $("#close_menu").click(function(){
        var menuDiv=document.getElementById("menu");
        menuDiv.style.left="-200px";
    });
});