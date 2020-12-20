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
            <div class='col-3'>
                <div class='card'>
                    <div class='card-header d-flex justify-content-center'>
                        <b>Time Out</b>
                        
                    </div>
                    <div class='card-body'>
                        <table class='table'>
                            <thead class=''>
                                <form action='{{url('/users/addtimeouton/'.$time->id)}}' method='POST'>
                                @csrf                         
                                    <div class='d-flex justify-content-center'><button type="submit" class="btn btn-danger ">Time-Out</button></div>
                                </form>
                            </thead>

                        </table>
                        
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

  
</x-app-layout>
