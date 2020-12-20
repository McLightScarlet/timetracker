<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('User') }}
        </h2>
    </x-slot>

    <div class='container'>
    <div class="py-12">
        <div class='row'>
            <div class='col-9'>
                <div class='card'>
                    <div class='card-header'>
                        <b>User Management</b>
                    </div>
                    <div class='card-body'>
                        <table class='table'>
                            <thead>
                                <th>User ID</th>
                                <th>Name</th>
                                <th>Created At</th>
                                <th>Action</th>
                            </thead>
                            <tbody>
                                @foreach($users as $user)
                                <tr>
                                    <td>{{$user->id}}</td>
                                    <td>{{$user->name}}</td>
                                    <td>{{$user->created_at->diffForHumans()}}</td>
                                    <td>
                                        <a href="" class='btn btn-primary' style='margin:5px;'>Edit</a>
                                        <a href="" class='btn btn-danger' style='margin:5px;'>Delete</a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{$users->links()}}
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

  
</x-app-layout>
