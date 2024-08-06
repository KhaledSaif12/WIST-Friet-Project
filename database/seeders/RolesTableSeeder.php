<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('roles')->insert([
            ['id' => 1, 'name' => 'client', 'display_name' => 'client_Pepole', 'description' => NULL, 'created_at' => NULL, 'updated_at' => NULL],
            ['id' => 2, 'name' => 'Delivery_driver', 'display_name' => 'Delivery_driver_pepole', 'description' => NULL, 'created_at' => NULL, 'updated_at' => NULL],
        ]);
    }
}
