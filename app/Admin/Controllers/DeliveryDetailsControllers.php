<?php

namespace App\Admin\Controllers;

use \App\Models\DeliveryDetails;
use App\Models\User;
use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;

class DeliveryDetailsControllers extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'DeliveryDetails';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new DeliveryDetails());

        $grid->column('id', __('ID'));
        $grid->column('user.name', __('User Name')); // عرض اسم المستخدم
        $grid->column('vehicletype', __('Vehicle Type'));
        $grid->column('vehiclenumber', __('Vehicle Number'));
        $grid->column('vehicleimage', __('Vehicle Image'))->image(); // Show image preview in the grid
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
        $show = new Show(DeliveryDetails::findOrFail($id));

        $show->field('id', __('ID'));
        $show->field('user.name', __('User Name')); // عرض اسم المستخدم
        $show->field('vehicletype', __('Vehicle Type'));
        $show->field('vehiclenumber', __('Vehicle Number'));
        $show->field('vehicleimage', __('Vehicle Image'))->image(); // Show image preview in detail view
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
        $form = new Form(new DeliveryDetails());

        $form->select('usar_id', __('User'))->options(User::all()->pluck('name', 'id'))->rules('required|integer'); // استخدم select لعرض المستخدمين
        $form->text('vehicletype', __('Vehicle Type'))->rules('required|string|max:255');
        $form->text('vehiclenumber', __('Vehicle Number'))->rules('required|string|max:255');
        $form->image('vehicleimage', __('Vehicle Image'))->rules('required|image|mimes:jpeg,png,jpg,gif|max:2048'); // Add validation rules for the image

        return $form;
    }
}
