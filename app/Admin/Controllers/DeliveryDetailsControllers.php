<?php

namespace App\Admin\Controllers;

use \App\Models\DeliveryDetails;
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
        $grid->column('user_id', __('User ID'));
        $grid->column('vehicletype', __('Vehicle Type'));
        $grid->column('vehiclenumber', __('Vehicle Number'));
        $grid->column('vehicleimage', __('Vehicle Image'));
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
        $show->field('user_id', __('User ID'));
        $show->field('vehicletype', __('Vehicle Type'));
        $show->field('vehiclenumber', __('Vehicle Number'));
        $show->field('vehicleimage', __('Vehicle Image'));
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

        $form->number('user_id', __('User ID'));
        $form->text('vehicletype', __('Vehicle Type'));
        $form->text('vehiclenumber', __('Vehicle Number'));
        $form->image('vehicleimage', __('Vehicle Image'));

        return $form;
    }
}
