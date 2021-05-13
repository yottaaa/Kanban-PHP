<table class="table table-bordered">
    <thead>
        <tr>
        <?php for ($i = 0; $i < count($attributes); $i++): ?>
            <th scope="col"><?php echo $attributes[$i];?></th>
        <?php endfor; ?>
        <?php if ($actions):?>
            <th>Actions</th>
        <?php endif;?>
        </tr>
    </thead>
    <tbody>