<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Carbon;

class AdminUserController extends Controller
{
    public function ShowAdminUser(){
        $users = User::latest()->paginate(5);
        return view('admin.users.index')->with('users', $users);
    }
}
