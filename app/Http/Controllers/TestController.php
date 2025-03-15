<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;

class TestController extends Controller
{
    public function test()
    {
        Redis::set('test_key', 'Redis is working!');
        return Redis::get('test_key');
    }
}
