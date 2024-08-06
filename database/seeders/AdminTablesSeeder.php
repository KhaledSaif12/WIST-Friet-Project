<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminTablesSeeder extends Seeder
{
    public function run()
    {
        DB::table('admin_menu')->insert([
            ['id' => 1, 'parent_id' => 0, 'order' => 1, 'title' => 'Dashboard', 'icon' => 'icon-chart-bar', 'uri' => '/', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 2, 'parent_id' => 0, 'order' => 2, 'title' => 'Admin', 'icon' => 'icon-server', 'uri' => '', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 3, 'parent_id' => 2, 'order' => 3, 'title' => 'Users', 'icon' => 'icon-users', 'uri' => 'auth/users', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 4, 'parent_id' => 2, 'order' => 4, 'title' => 'Roles', 'icon' => 'icon-user', 'uri' => 'auth/roles', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 5, 'parent_id' => 2, 'order' => 5, 'title' => 'Permission', 'icon' => 'icon-ban', 'uri' => 'auth/permissions', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 6, 'parent_id' => 2, 'order' => 6, 'title' => 'Menu', 'icon' => 'icon-bars', 'uri' => 'auth/menu', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 7, 'parent_id' => 2, 'order' => 7, 'title' => 'Operation log', 'icon' => 'icon-history', 'uri' => 'auth/logs', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 8, 'parent_id' => 0, 'order' => 8, 'title' => 'Helpers', 'icon' => 'icon-cogs', 'uri' => '', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 9, 'parent_id' => 8, 'order' => 9, 'title' => 'Scaffold', 'icon' => 'icon-keyboard', 'uri' => 'helpers/scaffold', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 10, 'parent_id' => 8, 'order' => 10, 'title' => 'Database terminal', 'icon' => 'icon-database', 'uri' => 'helpers/terminal/database', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 11, 'parent_id' => 8, 'order' => 11, 'title' => 'Laravel artisan', 'icon' => 'icon-terminal', 'uri' => 'helpers/terminal/artisan', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 12, 'parent_id' => 8, 'order' => 12, 'title' => 'Routes', 'icon' => 'icon-list-alt', 'uri' => 'helpers/routes', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 13, 'parent_id' => 0, 'order' => 13, 'title' => 'Api tester', 'icon' => 'icon-sliders-h', 'uri' => 'api-tester', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 14, 'parent_id' => 0, 'order' => 14, 'title' => 'Users', 'icon' => 'icon-file', 'uri' => 'users', 'created_at' => now(), 'updated_at' => now()],
        ]);

        DB::table('admin_permissions')->insert([
            ['id' => 1, 'name' => 'All permission', 'slug' => '*', 'http_method' => '', 'http_path' => '*', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 2, 'name' => 'Dashboard', 'slug' => 'dashboard', 'http_method' => 'GET', 'http_path' => '/', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 3, 'name' => 'Login', 'slug' => 'auth.login', 'http_method' => '', 'http_path' => '/auth/login\r\n/auth/logout', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 4, 'name' => 'User setting', 'slug' => 'auth.setting', 'http_method' => 'GET,PUT', 'http_path' => '/auth/setting', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 5, 'name' => 'Auth management', 'slug' => 'auth.management', 'http_method' => '', 'http_path' => '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 6, 'name' => 'Admin helpers', 'slug' => 'ext.helpers', 'http_method' => '', 'http_path' => '/helpers/*', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 7, 'name' => 'Api tester', 'slug' => 'ext.api-tester', 'http_method' => '', 'http_path' => '/api-tester*', 'created_at' => now(), 'updated_at' => now()],
        ]);

        DB::table('admin_roles')->insert([
            ['id' => 1, 'name' => 'Administrator', 'slug' => 'administrator', 'created_at' => now(), 'updated_at' => now()],
        ]);

        DB::table('admin_role_menu')->insert([
            ['role_id' => 1, 'menu_id' => 2, 'created_at' => now(), 'updated_at' => now()],
        ]);

        DB::table('admin_role_permissions')->insert([
            ['role_id' => 1, 'permission_id' => 1, 'created_at' => now(), 'updated_at' => now()],
        ]);

        DB::table('admin_role_users')->insert([
            ['role_id' => 1, 'user_id' => 1, 'created_at' => now(), 'updated_at' => now()],
        ]);

        DB::table('admin_users')->insert([
            ['id' => 1, 'username' => 'admin', 'password' => bcrypt('admin'), 'name' => 'Administrator', 'created_at' => now(), 'updated_at' => now()],
        ]);
    }
}
