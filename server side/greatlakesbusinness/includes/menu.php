<div style="padding: 0px; margin: 0px;">
<span style="background:white; padding:10px; text-align:left; color:black; display:block; width:100%; font-size:20px;">Menu <span style="font-size:12px; float:right; cursor:pointer" id="close_menu">Close</span></span>
<br>    
<nav class="nav">
        <ul>
            <!-- <a href="myhome.php"><li>Accueil</li></a> -->
<!--            <a href="approvisionnement.php"><li>Approvisionner</li></a>-->
            <!-- <a href="achat.php"><li>Accueil</li></a> -->
            <!-- <a href="article.php"><li>Poster un artiste</li></a> -->
            <!-- <a href="apropos.php"><li>A propos</li></a> -->
        </ul>
    </nav>
    <br><br>


    <div style="margin-left: 20px; color: #cccccc;">
        <div class="profileImg"><img style="width: 100%; height: 100%; border-radius: 100%" src="./includes/logIcon.png" alt="profile"></div>
        <span style="font-size: 15px;"><?php echo $_SESSION['mailUser'];?></span> <br><br>
        <span><a href="logout.php">Log out</a></span>
    </div>

</div>