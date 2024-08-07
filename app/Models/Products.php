<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Products extends Model
{
        // العلاقة مع نموذج Categories
        public function category()
        {
            return $this->belongsTo(Categories::class);
        }
    
        // العلاقة مع نموذج Seasons
        public function season()
        {
            return $this->belongsTo(Seasons::class);
        }
    
        // العلاقة مع نموذج Farms
        public function farm()
        {
            return $this->belongsTo(Farms::class);
        }
    

    

    

    
}
