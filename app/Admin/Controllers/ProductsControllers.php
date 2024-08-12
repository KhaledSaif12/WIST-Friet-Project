<?php

namespace App\Admin\Controllers;

use App\Models\Categories;
use App\Models\Farms;
use \App\Models\Products;
use App\Models\Seasons;
use Illuminate\Support\Str; // Import Str facade

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
        $grid->column('prais', __('Price'))->display(function ($price) {
            return '$' . number_format($price, 2);
        });
        $grid->column('quantity', __('Quantity'))->sortable();
        $grid->column('photo', __('Photo'))->image('/storage', 50, 50);
        $grid->column('description', __('Description'))->limit(50);
        $grid->column('category.name', __('Category'));
        $grid->column('season.seasonsname', __('Season'));
        $grid->column('farm.name', __('Farm'));
        $grid->column('data', __('Date'))->sortable();
        $grid->column('productstatus', __('Product Status'))->using([1 => 'Active', 0 => 'Inactive']);
        $grid->column('slug', __('Slug'));
        $grid->column('created_at', __('Created At'))->sortable();
        $grid->column('updated_at', __('Updated At'))->sortable();

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
        $show->field('prais', __('Price'))->as(function ($price) {
            return '$' . number_format($price, 2);
        });
        $show->field('quantity', __('Quantity'));
        $show->field('photo', __('Photo'))->image('/storage/images');
        $show->field('description', __('Description'));
        $show->field('category.name', __('Category'));
        $show->field('season.seasonsname', __('Season'));
        $show->field('farm.name', __('Farm'));
        $show->field('data', __('Date'));
        $show->field('productstatus', __('Product Status'))->using([1 => 'Active', 0 => 'Inactive']);
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

        $form->text('name', __('Name'))->rules('required');
        $form->decimal('prais', __('Price'))->rules('required|min:0');
        $form->number('quantity', __('Quantity'))->rules('required|min:0');
        $form->image('photo', __('Photo'))->rules('required')->uniqueName();
        $form->textarea('description', __('Description'))->rules('required');
        $form->select('category_id', __('Category'))->options(function () {
            return Categories::all()->pluck('name', 'id')->toArray();
        })->rules('required');
        $form->select('season_id', __('Season'))->options(function () {
            return Seasons::all()->pluck('seasonsname', 'id')->toArray();
        })->rules('required');
        $form->select('farm_id', __('Farm'))->options(function () {
            return Farms::all()->pluck('name', 'id')->toArray();
        })->rules('required');
        $form->date('data', __('Date'))->rules('required');
        $form->switch('productstatus', __('Product Status'))->default(1);
        $form->text('slug', __('Slug'))->rules('required')->disable();

        return $form;
    }
    public function showProducts()
    {
        $products = Products::orderBy('id', 'desc')->get();
        return view('Clint.Prodact', ['products_all' => $products]);
    }
    public function showProductDetails($id)
    {
        // Retrieve the product by its ID
        $product = Products::findOrFail($id);

        // Return the view with the product details
        return view('Clint.products_details', ['product' => $product]);
    }
}
