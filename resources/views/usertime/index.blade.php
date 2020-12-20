<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Time
            <span class='badge bg-info' id='date'></span><span style='margin:5px;' class='badge bg-danger' id='time'></span>
                <script type="text/javascript">
                    function showTime() {
                        var date = new Date(),
                            utc = new Date(Date.UTC(
                            date.getFullYear(),
                            date.getMonth(),
                            date.getDate(),
                            date.getHours()-8,
                            date.getMinutes(),
                            date.getSeconds()
                            ));

                        document.getElementById('time').innerHTML = utc.toLocaleTimeString();
                        document.getElementById('date').innerHTML = utc.toLocaleDateString();
                    }
                    setInterval(showTime, 1000);
                </script>
            
        </h2>
    </x-slot>

    <div class='container'>
    <div class="py-12">
        <div class='row'>
            <div class='col-10'>
                <div class='card'>
                
                    @if(session('success'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>{{session('success')}}</strong>  
                        <button type="button" class="close float-right" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                    @endif

                    @if(session('error'))
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>{{session('error')}}</strong>  
                        <button type="button" class="close float-right" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                    @endif

                    <div class='card-header'>
                        
                        <form action='{{url('/users/addtime')}}' method='POST'>
                        @csrf
                            <b>Time Logs</b>                         
                            <button type="submit" class="btn btn-success float-right">Time-In</button>
                        </form>
                    </div>
                    <div class='card-body'>
                        <table class='table'>
                            <thead>
                                <th>Name</th>
                                <th>Time In</th>
                                <th>Time Out</th>
                                <th>Hours</th>
                                <th>Action</th>
                            </thead>
                            <tbody>
                                @foreach($times as $time)
                                <tr>   
                                    <td>{{$time->user->name}}</td>
                                    <td>{{ Carbon\Carbon::parse($time->time_in)->format('h:i A') }}</td>
                                    <td>
                                        @if($time->time_out == NULL)
                                            No time out!
                                        @else
                                            {{ Carbon\Carbon::parse($time->time_out)->format('h:i A') }}
                                        @endif
                                    </td>
                                    <td>{{ $time->hours }}</td>
                                    <td>
                                        <form action='{{url('/users/addtimeouton/'.$time->id)}}' method='POST'>
                                        @csrf                         
                                            <button type="submit" class="btn btn-danger">Time-Out</button>
                                            
                                        </form>
                                        
                                    </td>
                                </tr>
                                
                                @endforeach
                                <tfoot>
                                <td><div>Total hours:</div></td>
                                <td><div></div></td>
                                <td><div></div></td>
                                <td><div>gg</div></td>
                                <td><div></div></td>
                                </tfoot>
                            </tbody>
                            
                        </table>
                        {{$times->links()}}
                        
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

  
</x-app-layout>
