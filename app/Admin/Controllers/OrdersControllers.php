<?php

namespace App\Admin\Controllers;

use App\Models\Addresses;
use App\Models\DeliveryDetails;
use App\Models\Orders;
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

        $grid->column('id', 'ID')->sortable()->display(function ($id) {
            return "<span class='badge bg-primary'>$id</span>";
        });
        $grid->column('user.name', 'User Name')->sortable()->display(function ($name) {
            return "<strong>$name</strong>";
        });
        $grid->column('address.name', 'Address Name')->sortable();
        $grid->column('delivery.vehiclenumber', 'Vehicle Number')->sortable();
        $grid->column('orderdelivrytime', 'Order Delivery Time')->sortable()->display(function ($time) {
            return date('Y-m-d H:i', strtotime($time));
        });
        $grid->column('deliverycost', 'Delivery Cost')->sortable()->display(function ($cost) {
            return "$" . number_format($cost, 2);
        });
        $grid->column('totalorderprice', 'Total Order Price')->sortable()->display(function ($price) {
            return "$" . number_format($price, 2);
        });
        $grid->column('orderstatas', 'Order Status')->label([
            'In preparation' => 'info',
            'On the way to you' => 'warning',
            'Delivered' => 'success',
        ]);
        $grid->column('paymentmethod', 'Payment Method')->display(function ($method) {
            $colors = [
                'Credit Card' => 'primary',
                'PayPal' => 'success',
                'Bank Transfer' => 'info',
                'Upon delivery-Creamy computer' => 'warning',
            ];
            $color = $colors[$method] ?? 'secondary';
            return "<span class='badge bg-$color'>$method</span>";
        });
        $grid->column('created_at', 'Created At')->sortable()->display(function ($created_at) {
            return "<small class='text-muted'>" . date('Y-m-d H:i', strtotime($created_at)) . "</small>";
        });
        $grid->column('updated_at', 'Updated At')->sortable()->display(function ($updated_at) {
            return "<small class='text-muted'>" . date('Y-m-d H:i', strtotime($updated_at)) . "</small>";
        });

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
        $show->field('user.name', 'User Name');
        $show->field('address.name', 'Address Name');
        $show->field('delivery.vehiclenumber', 'Vehicle Number');
        $show->field('orderdelivrytime', 'Order Delivery Time')->as(function ($time) {
            return date('Y-m-d H:i', strtotime($time));
        });
        $show->field('deliverycost', 'Delivery Cost')->as(function ($cost) {
            return "$" . number_format($cost, 2);
        });
        $show->field('totalorderprice', 'Total Order Price')->as(function ($price) {
            return "$" . number_format($price, 2);
        });
        $show->field('orderstatas', 'Order Status')->as(function ($status) {
            return "<span class='badge badge-" . [
                'In preparation' => 'info',
                'On the way to you' => 'warning',
                'Delivered' => 'success',
            ][$status] . "'>$status</span>";
        });
        $show->field('paymentmethod', 'Payment Method')->as(function ($method) {
            $colors = [
                'Credit Card' => 'primary',
                'PayPal' => 'success',
                'Bank Transfer' => 'info',
                'Upon delivery-Creamy computer' => 'warning',
            ];
            $color = $colors[$method] ?? 'secondary';
            return "<span class='badge badge-$color'>$method</span>";
        });
        $show->field('created_at', 'Created At')->as(function ($created_at) {
            return date('Y-m-d H:i', strtotime($created_at));
        });
        $show->field('updated_at', 'Updated At')->as(function ($updated_at) {
            return date('Y-m-d H:i', strtotime($updated_at));
        });

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

        // الحقول المطلوبة (Required Fields)
        $form->select('user_id', 'User')
             ->options(User::all()->pluck('name', 'id'))
             ->rules('required'); // جعل الحقل مطلوب

        $form->select('address_id', 'Address')
             ->options(Addresses::all()->pluck('name', 'id'))
             ->rules('required'); // جعل الحقل مطلوب

        $form->datetime('orderdelivrytime', 'Order Delivery Time')
             ->format('YYYY-MM-DD HH:mm')
             ->rules('required'); // جعل الحقل مطلوب

        $form->decimal('totalorderprice', 'Total Order Price')
             ->rules('required') // جعل الحقل مطلوب
             ->prepend('$');

        // الحقول التي يمكن أن تكون فارغة (Optional Fields)
        $form->select('delivery_id', 'Vehicle Number')
             ->options(DeliveryDetails::all()->pluck('vehiclenumber', 'id'))
             ->rules('nullable'); // السماح بقبول قيمة null

        $form->decimal('deliverycost', 'Delivery Cost')
             ->prepend('$')
             ->rules('nullable'); // السماح بقبول قيمة null

        $form->select('orderstatas', 'Order Status')
             ->options([
                 'In preparation' => 'In preparation',
                 'On the way to you' => 'On the way to you',
                 'Delivered' => 'Delivered',
             ])
             ->rules('nullable'); // السماح بقبول قيمة null

        $form->select('paymentmethod', 'Payment Method')
             ->options([
                 'Credit Card' => 'Credit Card',
                 'PayPal' => 'PayPal',
                 'Bank Transfer' => 'Bank Transfer',
                 'Upon delivery-Creamy computer' => 'Upon delivery-Creamy computer',
             ])
             ->rules('nullable'); // السماح بقبول قيمة null

        $form->display('created_at', 'Created At');
        $form->display('updated_at', 'Updated At');

        return $form;
    }

}
