<?php

namespace App\Admin\Controllers;

use App\Models\Addresses;
use \App\Models\User; // Import the User model
use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;

class AddressesControllers extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Addresses';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Addresses());

        // Define grid columns here
        $grid->column('id', __('ID'))->sortable();
        $grid->column('name', __('Name'));
        $grid->column('description', __('Description'));
        $grid->column('addresslink', __('Address Link'));
        $grid->column('city', __('City'));
        $grid->column('user.name', __('User'))->sortable(); // Display user name instead of user_id
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
        $show = new Show(Addresses::findOrFail($id));

        // Define detail view fields here
        $show->field('id', __('ID'));
        $show->field('name', __('Name'));
        $show->field('description', __('Description'));
        $show->field('addresslink', __('Address Link'));
        $show->field('city', __('City'));
        $show->field('user.name', __('User')); // Display user name
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
        $form = new Form(new Addresses());

        // Define form fields here
        $form->text('name', __('Name'));
        $form->textarea('description', __('Description'));
        $form->textarea('addresslink', __('Address Link'));
        $form->text('city', __('City'));
        $form->select('user_id', __('User'))->options(User::all()->pluck('name', 'id')); // Dropdown to select user

        return $form;
    }
}
