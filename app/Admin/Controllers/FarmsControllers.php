<?php

namespace App\Admin\Controllers;

use App\Models\Farms;
use App\Models\User;
use App\Models\Addresses;
use Faker\Provider\ar_EG\Address;
use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;

class FarmsControllers extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Farms';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Farms());

        // Define grid columns here
        $grid->column('id', __('ID'))->sortable();
        $grid->column('name', __('Name'));
        $grid->column('commercialregistrationno', __('Commercial Registration No'));
        $grid->column('image', __('Image'))->image('/storage', 100, 100);
        $grid->column('user.name', __('User'))->sortable(); // Display user name instead of user_id
        $grid->column('address.name', __('Address'))->sortable(); // Display address name instead of address_id
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
        $show = new Show(Farms::findOrFail($id));

        // Define detail view fields here
        $show->field('id', __('ID'));
        $show->field('name', __('Name'));
        $show->field('commercialregistrationno', __('Commercial Registration No'));
        $show->field('image', __('Image'))->image('/storage/images');
        $show->field('user.name', __('User')); // Display user name
        $show->field('address.name', __('Address')); // Display address name
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
    $form = new Form(new Farms());

    $form->text('name', __('Name'));
    $form->number('commercialregistrationno', __('Commercial Registration No'));
    $form->image('image', __('Image'))->rules('required|image|mimes:jpeg,png,jpg,gif|max:2048');
    $form->select('user_id', __('User'))->options(User::all()->pluck('name', 'id'));
    $form->select('address_id', __('Address'))->options(Addresses::all()->pluck('name', 'id'));

    $form->saving(function (Form $form) {
        if ($form->image && $form->image instanceof \Illuminate\Http\UploadedFile) {
            // Generate a unique file name
            $fileName = time() . '_' . $form->image->getClientOriginalName();

            // Store the image in the 'public/images' directory
            $path = $form->image->storeAs('public/images', $fileName);

            // Store the file name in the database
            $form->model()->image = basename($path);
        }
    });

    return $form;
}


}
