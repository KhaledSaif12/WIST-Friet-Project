<?php

namespace App\Admin\Controllers;

use \App\Models\OrderItems;
use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\Products;
use \App\Models\Orders;

class OrderItemsControllers extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'OrderItems';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new OrderItems());

        $grid->column('id', 'ID')->sortable();
        $grid->column('product.name', 'Product Name'); // Display product name
        $grid->column('order.id', 'Order ID'); // Display order ID
        $grid->column('quantity', 'Quantity');
        $grid->column('total_product_price', 'Total Product Price');
        $grid->column('created_at', 'Created At');
        $grid->column('updated_at', 'Updated At');

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
        $show = new Show(OrderItems::findOrFail($id));

        $show->field('id', 'ID');
        $show->field('product.name', 'Product Name'); // Display product name
        $show->field('order.id', 'Order ID'); // Display order ID
        $show->field('quantity', 'Quantity');
        $show->field('total_product_price', 'Total Product Price');
        $show->field('created_at', 'Created At');
        $show->field('updated_at', 'Updated At');

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new OrderItems());

        $form->select('product_id', 'Product')->options(Products::all()->pluck('name', 'id')
        )->rules('required');
        $form->select('order_id', 'Order')->options(Orders::all()->pluck('id', 'id')
        )->rules('required');
        $form->number('quantity', 'Quantity')->rules('required');
        $form->decimal('total_product_price', 'Total Product Price')->rules('required');
        $form->display('created_at', 'Created At');
        $form->display('updated_at', 'Updated At');

        return $form;
    }
}
