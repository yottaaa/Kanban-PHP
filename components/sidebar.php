<div class="nav">
    <ul>
        <div class="profile">
            <div class="text-white profile-uname"><?php echo $_SESSION['fullname']?></div>
            <div class="d-flex row">
                <span class="text-muted">ID: <?php echo $_SESSION['user_id']?></span>
                <span class="text-muted">Dept. No: <?php echo $_SESSION['dept']?></span>
            </div>
        </div>
        <?php foreach ($links as $link) :?>
            <li>  
                <a href="<?php echo $link[2];?>" style="display: flex; align-items:center;">
                    <i class="fas fa-<?php echo $link[1];?>" style="margin-right: 1rem;"></i>
                    <?php echo $link[0];?>
                </a>
            </li>
        <?php endforeach; ?>
    </ul>
</div>