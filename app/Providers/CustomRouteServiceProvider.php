<?php

namespace App\Providers;


use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


class CustomRouteServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
   
    public function boot()
    {
        $this->superAdmin();
    }
   // superAdmin
    private function superAdmin(){
             Route::middleware('web','superAdmin')          
                ->namespace($this->namespace)
                ->group(base_path('routes/superAdmin.php')); 
    }   

}
