<?php

namespace App\Admin\Controllers;

use \App\Models\Products;
use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;

class ProductsControllers extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Products';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Products());

        $grid->column('id', __('ID'))->sortable();
        $grid->column('name', __('Name'));
        $grid->column('price', __('Price'));
        $grid->column('quantity', __('Quantity'));
        $grid->column('photo', __('Photo'));
        $grid->column('description', __('Description'));
        $grid->column('category_id', __('Category'));
        $grid->column('season_id', __('Season'));
        $grid->column('farm_id', __('Farm'));
        $grid->column('date', __('Date'));
        $grid->column('productstatus', __('Product Status'));
        $grid->column('slug', __('Slug'));
        $grid->column('created_at', __('Created At'));
        $grid->column('updated_at', __('Updated At'));

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
        $show = new Show(Products::findOrFail($id));

        $show->field('id', __('ID'));
        $show->field('name', __('Name'));
        $show->field('price', __('Price'));
        $show->field('quantity', __('Quantity'));
        $show->field('photo', __('Photo'));
        $show->field('description', __('Description'));
        $show->field('category_id', __('Category'));
        $show->field('season_id', __('Season'));
        $show->field('farm_id', __('Farm'));
        $show->field('date', __('Date'));
        $show->field('productstatus', __('Product Status'));
        $show->field('slug', __('Slug'));
        $show->field('created_at', __('Created At'));
        $show->field('updated_at', __('Updated At'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Products());

        $form->text('name', __('Name'))->required();
        $form->decimal('price', __('Price'))->required();
        $form->number('quantity', __('Quantity'))->required();
        $form->image('photo', __('Photo'))->required();
        $form->textarea('description', __('Description'))->required();
        $form->select('category_id', __('Category'))->options('/api/categories')->required();
        $form->select('season_id', __('Season'))->options('/api/seasons')->required();
        $form->select('farm_id', __('Farm'))->options('/api/farms')->required();
        $form->date('date', __('Date'))->required();
        $form->switch('productstatus', __('Product Status'))->default(1);
        $form->text('slug', __('Slug'))->required();

        return $form;
    }
}
