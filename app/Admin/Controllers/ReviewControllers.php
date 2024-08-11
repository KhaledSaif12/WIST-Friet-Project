<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use App\Models\Review;

class ReviewControllers extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Review';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Review());

        $grid->column('id', __('Id'));
        $grid->column('product.name', __('Product Name'));
        $grid->column('user.name', __('User Name'));
        $grid->column('rating', __('Rating'))->display(function ($rating) {
            return str_repeat('★', $rating) . str_repeat('☆', 5 - $rating);
        });
        $grid->column('comment', __('Comment'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Review::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('product.name', __('Product Name'));
        $show->field('user.name', __('User Name'));
        $show->field('rating', __('Rating'))->as(function ($rating) {
            return str_repeat('★', $rating) . str_repeat('☆', 5 - $rating);
        });
        $show->field('comment', __('Comment'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Review());

        $form->select('product_id', __('Product Name'))->options(function () {
            return \App\Models\Products::all()->pluck('name', 'id')->toArray();
        });
        $form->select('user_id', __('User Name'))->options(function () {
            return \App\Models\User::all()->pluck('name', 'id')->toArray();
        });
        $form->number('rating', __('Rating'))->rules('required|integer|min:1|max:5')->default(1);
        $form->textarea('comment', __('Comment'));

        return $form;
    }
}
