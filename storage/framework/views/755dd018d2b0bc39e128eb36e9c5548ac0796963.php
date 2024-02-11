<?php $__env->startSection('content'); ?>
    <?php if(\Session::has('success')): ?>
        <div class="alert alert-success">
            <p><?php echo e(\Session::get('success')); ?></p>
        </div>
    <?php endif; ?>
    <div class="col-md-12 col-sm-12  ">
        <div class="x_panel">
            <div class="x_title">
                <h2>Comment List</h2>

                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>

            <div class="x_content">
                <div class="clearfix"></div>
                <div class="table-responsive">
                    <a href="<?php echo e(route('superAdmin.comment.archive')); ?>" class="btn btn-sm btn-primary pull-right">Archive
                        comment</a>
                    <table class="table table-striped jambo_table bulk_action">
                        <thead>
                            <tr>
                                <th class="column-title"> <input type="checkbox" id="checkAll"></th>
                                <th class="column-title" scope="col">post ID</th>
                                <th class="column-title text-center" scope="col">Comment</th>
                                <th class="column-title" scope="col">Author</th>
                                <th class="column-title" scope="col">Date</th>
                                <th class="column-title" scope="col">Status</th>
                                <th class="column-title text-center" scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $cat = '';
                                $userName = '';
                            ?>
                            <form method="post" action="<?php echo e(route('superAdmin.post.multipledelete')); ?>">
                                <?php echo e(csrf_field()); ?>

                                <input class="btn btn-danger btn-sm" type="submit" name="submit" value="Delete All" />
                                <br><br>
                                <?php $__currentLoopData = $comment; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php
                                        $postTitle = DB::table('posts')
                                            ->where('id', $value->post_id)
                                            ->get();
                                        // $userName = DB::table('users')
                                        //     ->where('id', $value->user_id)
                                        //     ->get();
                                    ?>
                                    <tr>
                                        <td class="text-left">
                                            <input name='id[]' type="checkbox" id="checkAll"
                                                value="<?php echo $value->id; ?>">
                                        </td>
                                        <td>
                                            <?php echo e($postTitle[0]->name); ?>

                                        </td>
                                        <td width="60%"><?php echo e($value->comment_body); ?></td>
                                        <?php
                                            $usr = DB::table('users')
                                                ->where('id', $value->user_id)
                                                ->get();
                                        ?>

                                        <td>
                                            
                                            <?php $__currentLoopData = $usr; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php echo e($val->name); ?>

                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <?php echo e($value->commentname); ?>


                                        </td>
                                        <td>
                                            <?php echo e(date('d-m-Y', strtotime($value->created_at))); ?>


                                        </td>
                                        <td> <?php echo e($value->status == 1 ? 'Active' : 'Inactive'); ?></td>
                                        
                                        
                                        <td>
                                            <?php if($value->status == 1): ?>
                                                <a href="<?php echo e(route('superAdmin.comments.publish', $value->id)); ?>"
                                                    class="btn btn-sm btn-info "><i class="fa fa-arrow-circle-up"
                                                        aria-hidden="true"></i></a>
                                            <?php else: ?>
                                                <a href="<?php echo e(route('superAdmin.comments.unpublish', $value->id)); ?>"
                                                    class="btn btn-sm btn-warning">
                                                    <i class="fa fa-arrow-circle-down " aria-hidden="true"></i>
                                                </a>
                                            <?php endif; ?>

                                            <a href="<?php echo e(route('superAdmin.comments.view', $value->id)); ?>"
                                                class="btn btn-sm btn-success">
                                                <i class="fa fa-eye" aria-hidden="true"></i></a>

                                            <a href="<?php echo e(route('superAdmin.comments.distroy', $value->id)); ?>"
                                                class="btn btn-sm btn-info  btn-danger"><i class="fa fa-trash"
                                                    aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </form>
                        </tbody>
                    </table>
                    <?php echo $comment->links(); ?>

                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.deshboard', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/superadmin/comment/index.blade.php ENDPATH**/ ?>