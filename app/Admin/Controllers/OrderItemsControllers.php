<?php

namespace App\Admin\Controllers;

use App\Models\OrderItems;
use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use App\Models\Products;
use App\Models\User;

class OrderItemsControllers extends AdminController
{
    protected $title = 'OrderItems';

    protected function grid()
    {
        $grid = new Grid(new OrderItems());

        $grid->column('id', 'ID')->sortable();
        $grid->column('product.name', 'Product Name');
        $grid->column('user_id', 'User ID');
        $grid->column('quantity', 'Quantity');
        $grid->column('total_product_price', 'Total Product Price');
        $grid->column('status', 'Status')->using([
            0 => 'Pending',
            1 => 'Shipped',
            2 => 'Delivered',
            3 => 'Canceled',
        ]); // عرض status كقائمة اختيار مع الأسماء
        $grid->column('order_delivery_time', 'Order Delivery Time')->display(function ($time) {
            return date('Y-m-d H:i', strtotime($time));
        });
        $grid->column('created_at', 'Created At');
        $grid->column('updated_at', 'Updated At');

        return $grid;
    }

    protected function detail($id)
    {
        $show = new Show(OrderItems::findOrFail($id));

        $show->field('id', 'ID');
        $show->field('product.name', 'Product Name');
        $show->field('user_id', 'User ID');
        $show->field('quantity', 'Quantity');
        $show->field('total_product_price', 'Total Product Price');
        $show->field('status', 'Status')->using([
            0 => 'Pending',
            1 => 'Shipped',
            2 => 'Delivered',
            3 => 'Canceled',
        ]); // عرض status كقائمة اختيار مع الأسماء
        $show->field('order_delivery_time', 'Order Delivery Time')->as(function ($time) {
            return date('Y-m-d H:i', strtotime($time));
        });
        $show->field('created_at', 'Created At');
        $show->field('updated_at', 'Updated At');

        return $show;
    }

    protected function form()
    {
        $form = new Form(new OrderItems());

        // Select User
        $form->select('user_id', 'User ID')->options(User::all()->pluck('name', 'id'))->rules('required');

        // Generate product options
        $productOptions = Products::all()->pluck('name', 'id')->map(function($name, $id) {
            return "<option value=\"$id\">$name</option>";
        })->implode('');

        // Create product entries with quantity
        $form->html('<div id="product-container"></div>');

        $form->html('<div class="product-entry">
                        <select name="product_id[]" class="form-control">' . $productOptions . '</select>
                        <input type="number" name="quantity[]" class="form-control" placeholder="Quantity">
                        <select name="status[]" class="form-control">
                            <option value="0">Pending</option>
                            <option value="1">Shipped</option>
                            <option value="2">Delivered</option>
                            <option value="3">Canceled</option>
                        </select>
                    </div>');

        // Add product button
        $form->html('<button type="button" id="add-product" class="btn btn-primary">Add Another Product</button>');

        // Script to add more products
        $form->html('<script>
            document.addEventListener("DOMContentLoaded", function() {
                document.getElementById("add-product").addEventListener("click", function() {
                    var container = document.getElementById("product-container");

                    var productEntry = document.createElement("div");
                    productEntry.className = "product-entry";

                    var productSelect = document.createElement("select");
                    productSelect.name = "product_id[]";
                    productSelect.className = "form-control";
                    productSelect.innerHTML = \'' . $productOptions . '\';

                    var quantityInput = document.createElement("input");
                    quantityInput.type = "number";
                    quantityInput.name = "quantity[]";
                    quantityInput.className = "form-control";
                    quantityInput.placeholder = "Quantity";

                    var statusSelect = document.createElement("select");
                    statusSelect.name = "status[]";
                    statusSelect.className = "form-control";
                    statusSelect.innerHTML = \'<option value="0">Pending</option><option value="1">Shipped</option><option value="2">Delivered</option><option value="3">Canceled</option>\';

                    productEntry.appendChild(productSelect);
                    productEntry.appendChild(quantityInput);
                    productEntry.appendChild(statusSelect);

                    container.appendChild(productEntry);
                });
            });
        </script>');

        $form->datetime('order_delivery_time', 'Order Delivery Time')->format('YYYY-MM-DD HH:mm');

        $form->display('created_at', 'Created At');
        $form->display('updated_at', 'Updated At');

        // Processing the form submission
        $form->saving(function (Form $form) {
            $productIds = request('product_id', []);
            $quantities = request('quantity', []);
            $statuses = request('status', []);
            $totalPrices = request('total_product_price', []);

            if (empty($productIds) || count($productIds) === 0) {
                throw new \Exception("At least one product must be added.");
            }

            foreach ($productIds as $index => $productId) {
                if (empty($productId) || !isset($quantities[$index])) {
                    throw new \Exception("Product ID or Quantity is missing.");
                }

                OrderItems::create([
                    'product_id' => $productId,
                    'quantity' => $quantities[$index] ?? 0,  // تأكد من أن quantity ليست null
                    'status' => $statuses[$index] ?? 0, // استخدام القيم الرقمية
                    'order_delivery_time' => $form->order_delivery_time,
                    'user_id' => $form->user_id,
                    'total_product_price' => $totalPrices[$index] ?? 0,
                ]);
            }
        });

        return $form;
    }
}
