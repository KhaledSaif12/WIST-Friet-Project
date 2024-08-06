<?php

namespace App\Admin\Controllers;

use \App\Models\Seasons;
use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;

class SeasonsControllers extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Seasons';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Seasons());

        $grid->column('id', __('Id'));
        $grid->column('seasonsname', __('Seasonsname'));
        $grid->column('startdaet', __('Startdaet'));
        $grid->column('enddate', __('Enddate'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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
        $show = new Show(Seasons::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('seasonsname', __('Seasonsname'));
        $show->field('startdaet', __('Startdaet'));
        $show->field('enddate', __('Enddate'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Seasons());

        $form->text('seasonsname', __('Seasonsname'));
        $form->date('startdaet', __('Startdaet'))->default(date('Y-m-d'));
        $form->date('enddate', __('Enddate'))->default(date('Y-m-d'));

        return $form;
    }
}
