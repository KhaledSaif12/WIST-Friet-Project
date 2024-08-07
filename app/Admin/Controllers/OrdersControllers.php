<?php

namespace App\Admin\Controllers;

use App\Models\Addresses;
use App\Models\DeliveryDetails;
use \App\Models\Orders;
use App\Models\User;
use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;

class OrdersControllers extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Orders';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Orders());

        $grid->column('id', 'ID')->sortable();
        $grid->column('user.name', 'User Name'); // Display user name
        $grid->column('address.name', 'Address Name'); // Display address name
        $grid->column('delivery.vehiclenumber', 'Vehicle Number'); // Display delivery name
        $grid->column('orderdelivrytime', 'Order Delivery Time');
        $grid->column('deliverycost', 'Delivery Cost');
        $grid->column('totalorderprice', 'Total Order Price');
        $grid->column('orderstatas', 'Order Status');
        $grid->column('paymentmethod', 'Payment Method');
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
        $show = new Show(Orders::findOrFail($id));

        $show->field('id', 'ID');
        $show->field('user.name', 'User Name'); // Display user name
        $show->field('address.name', 'Address Name'); // Display address name
        $show->field('delivery.vehiclenumber', 'Vehicle Number'); // Display delivery name
        $show->field('orderdelivrytime', 'Order Delivery Time');
        $show->field('deliverycost', 'Delivery Cost');
        $show->field('totalorderprice', 'Total Order Price');
        $show->field('orderstatas', 'Order Status');
        $show->field('paymentmethod', 'Payment Method');
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
        $form = new Form(new Orders());

        $form->display('id', 'ID');
        $form->select('user_id', 'User')->options(User::all()->pluck('name', 'id')
        )->rules('required');
        $form->select('address_id', 'Address')->options(Addresses::all()->pluck('name', 'id')
        )->rules('required');
        $form->select('delivery_id', 'Vehicle Number')->options(DeliveryDetails::all()->pluck('vehiclenumber', 'id')
        )->rules('required');
        $form->time('orderdelivrytime', 'Order Delivery Time');
        $form->decimal('deliverycost', 'Delivery Cost')->rules('required');
        $form->decimal('totalorderprice', 'Total Order Price')->rules('required');
        $form->select('orderstatas', 'Order Status')->options([
            'In preparation' => 'In preparation',
            'On the way to you' => 'On the way to you',
            'Delivered' => 'Delivered',
        ])->rules('required');
        $form->select('paymentmethod', 'Payment Method')->options([
            'Credit Card' => 'Credit Card',
            'PayPal' => 'PayPal',
            'Bank Transfer' => 'Bank Transfer',
            'Upon delivery-Creamy computer' => 'Upon delivery-Creamy computer',
        ])->rules('required');
        $form->display('created_at', 'Created At');
        $form->display('updated_at', 'Updated At');

        return $form;
    }
}
