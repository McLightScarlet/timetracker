<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Usertime;
use Carbon\Carbon;
use Auth;

class TimeController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
    }

    public function ShowTime(){
        $times = Usertime::latest()->paginate(5); 
        return view('usertime.index')->with(compact('times'));
    }

    public function AddTimeIn(){
        $timein = new Usertime;
        $timein->user_id = Auth::user()->id;
        $time = Carbon::now();
        $carbon_date = Carbon::parse($time);
        $new_datetime = $carbon_date->addHour(8);
        //Carbon parse at the view->
        //$new_time = Carbon::parse($new_datetime)->format('h:i A');
        $timein->time_in = $new_datetime;
        $timein->save();

        return redirect()->back()->with('success', 'Time-in Successfully!');
    }

    // public function AddTimeOut($id){

    //     $time = Usertime::find($id);
    // if($time->time_out == NULL){
    //     return view('usertime.edit')->with(compact('time'));
    // }
    // else{
    //     return redirect()->route('users.time')->with('error', 'You already Time out!');
    // }
    // }

    public function AddTimeOutOn(Request $request, $id){
        $usertime = Usertime::find($id);
        if($usertime->time_out == NULL){
            $time = Carbon::now();
            $carbon_date = Carbon::parse($time);
            $new_datetimes = $carbon_date->addHour(8);
            // $new_date = Carbon::parse($new_datetime)->format();
            // $new_time = Carbon::parse($new_datetimes)->format('H:i:s');
            $update = Usertime::find($id)->update([
                'time_out'=> $new_datetimes
            ]);
            }
        else{
            return redirect()->route('users.time')->with('error', 'You already Time out!');
        }

        
        //converting to variable for getting difference
        $carbon_start = Usertime::find($id)->time_in;
        $carbon_end = Usertime::find($id)->time_out;
        $start = Carbon::parse($carbon_start);
        $end = Carbon::parse($carbon_end);
        //getting the time difference
        $carbon_hours = $start->diff($end)->format('%H:%I:%S');
        $hours = Carbon::parse($carbon_hours)->format('H:i:s');

        $t_hours = Carbon::parse($hours)->hour;
        $t_mins = Carbon::parse($hours)->minute;
        $total_hours = ("$t_hours  hours and $t_mins minutes");
        $update = Usertime::find($id)->update([
            'hours'=> $total_hours
        ]);

        return redirect()->route('users.time')->with('success', 'Time out Successfully!');       
}
    
}
