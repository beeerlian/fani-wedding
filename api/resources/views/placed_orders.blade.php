    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>

    <!-- Logo Title Bar -->
    <link rel="icon" href="../images/logofanny.png"
    type="image/x-icon" class="LOGO">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- font google -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        type="text/css" media="all"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC%3A400%2C700%7CLato%3A400%2C700%2C400italic%2C700italic&amp;ver=4.9.8"
        type="text/css" media="screen"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="{{asset('css/admin_style.css')}}">

        <style>
        .zoom {
        background-color: transparent;
        transition: transform .1s;
        width: 0px auto;
        height: 0px auto;
        }

        .zoom:hover {
        -ms-transform: scale(1.5); /* IE 9 */
        -webkit-transform: scale(1.5); /* Safari 3-8 */
        transform: scale(6.5);
        }
        </style>

    <style>
    #myInput {
    background-repeat: no-repeat;
    width: 100%;
    font-size: 16px;
    padding: 12px 20px 12px 40px;
    border: 1px solid #ddd;
    margin-bottom: 12px;
    }

    .btn-upp{
        display: block;
        margin-top: 1rem;
        border-radius: .5rem;
        cursor: pointer;
        width: 50%;
        font-size: 1rem;
        color:var(--white);
        padding:0.5rem 0.5rem;
        text-transform: capitalize;
        text-align: center;
    }

    .btn-upp{
        background-color: #b29723;
    }
    .ordd4{
        display: table; /* keep the background color wrapped tight */
        border-radius: 15px;
        margin: 0px auto 0px auto; /* keep the table centered */
        padding:5px;font-size:20px;background-color:rgba(84, 206, 73, 0.63);color:#000000;
    }
    .ordd2{
        display: table; /* keep the background color wrapped tight */
        border-radius: 15px;
        margin: 0px auto 0px auto; /* keep the table centered */
        padding:5px;font-size:20px;background-color:rgba(228, 0, 0, 0.664);color:#000000;
    }
    .ordd3{
        display: table; /* keep the background color wrapped tight */
        border-radius: 15px;
        margin: 0px auto 0px auto; /* keep the table centered */
        padding:5px;font-size:20px;background-color:rgba(65, 53, 240, 0.575);color:#000000;
    }

    .button-54 {
    font-family: "Open Sans", sans-serif;
    font-size: 16px;
    letter-spacing: 2px;
    text-decoration: none;
    text-transform: uppercase;
    color: #4e4e4e;
    cursor: pointer;
    border: 3px solid;
    padding: 0.25em 0.5em;
    box-shadow: 1px 1px 0px 0px, 2px 2px 0px 0px, 3px 3px 0px 0px, 4px 4px 0px 0px, 5px 5px 0px 0px;
    position: relative;
    user-select: none;
    -webkit-user-select: none;
    touch-action: manipulation;
    transition-duration: 0.2s;
    }
    .button-54:hover {
    background-color: #9e9e9e;
    color: rgb(0, 0, 0);
    }

    .button-54:active {
    box-shadow: 0px 0px 0px 0px;
    top: 5px;
    left: 5px;
    }

    @media (min-width: 768px) {
    .button-54 {
        padding: 0.25em 0.75em;
    }
}

    .ordd{
        display: table; /* keep the background color wrapped tight */
        border-radius: 15px;
        margin: 0px auto 0px auto; /* keep the table centered */
        padding:5px;font-size:20px;background-color:rgba(228, 0, 0, 0.664);color:#000000;
    }
    </style>

    </head>
    <body>

    @include ('components.admin_header')


    <!-- placed orders section starts  -->

    <section class="placed-orders">
<br>
        <a href="dashboard" class="button-54" role="button"><strong><- Back</strong></a>

    <h1 class="heading">order</h1>

    <b>

            @if ($message = Session::get('notsuccess'))
                <div class="ordd">{{ $message }}</div>
            @endif

            @if ($message = Session::get('success'))
                <div class="ordd4">{{ $message }}</div>
            @endif

            @if ($message = Session::get('succ'))
                <div class="ordd4">{{ $message }}</div>
            @endif

            @if ($message = Session::get('notlun'))
                <div class="ordd">{{ $message }}</div>
            @endif

            @if ($message = Session::get('del'))
            <div class="ordd2">{{ $message }}</div>
            @endif

            @if ($message = Session::get('date'))
            <div class="ordd3">{{ $message }}</div>
            @endif
    </b>

            @if (($message = Session::get('succ1'))&&($message2 = Session::get('succ11')))
            <b><div class="ordd">{{ $message}}</div><br><div class="ordd">{{$message2}}</div></b>
            @endif

            @if (($message3 = Session::get('succ2'))&&($message4 = Session::get('succ22')))
            <b><div class="ordd">{{ $message3}}</div><br><div class="ordd4">{{$message4}}</div></b>
            @endif

            @if (($message3 = Session::get('succ3'))&&($message4 = Session::get('succ33')))
            <b><div class="ordd4">{{ $message3}}</div><br><div class="ordd2">{{$message4}}</div></b>
            @endif

            @if (($message3 = Session::get('succ4'))&&($message4 = Session::get('succ44')))
            <b><div class="ordd4">{{ $message3}}</div><br><div class="ordd4">{{$message4}}</div></b>
            @endif

            <b>
            @if ($message = Session::get('succ5'))
            <div class="ordd4">{{ $message }}</div>
            @endif

            @if ($message = Session::get('succ6'))
            <div class="ordd2">{{ $message }}</div>
            @endif

            @if ($message = Session::get('succ7'))
            <div class="ordd2">{{ $message }}</div>
            @endif

            @if ($message = Session::get('succ8'))
            <div class="ordd4">{{ $message }}</div>
            @endif
            </b>

            <br><br>

    <div class="box-container">


    <div class="box">
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
            <tr>
                <td>No</td>
                <td>Nama</td>
                <td>Email</td>
                <td>Nomor Telepon</td>
                <td>Alamat</td>
                <td>Waktu Acara</td>
                <td>Total Produk</td>
                <td>Total Pembayaran</td>
                <td>Status Pesanan</td>
                <td>Bukti Pembayaran</td>
                <td>Status Pembayaran</td>
                <td>Action</td>
            </tr>
        </thead>

        @foreach($order as $ord)


            <tr>
                <td><span> {{$ord->id}} </td>
                <td><span> {{$ord->name}} </td>
                <td><span> {{$ord->email}} </td>
                <td><span> {{$ord->number}} </span></td>
                <td><span> {{$ord->address}} </span></td>
                <td><span> {{$ord->event_time}} </td>
                <td><span> {{$ord->total_products}} </td>
                <td><span> {{$ord->total_price}} </span></td>

                <form action="/update_orders/{{$ord->id}}" method="POST" enctype="multipart/form-data">
                    @csrf
                <td>
                <input type="hidden" name="customer_id" value="{{$ord->customer_id}}">
                <select name="order_status" class="drop-down-order">
                    <option hidden selected value="{{$ord->order_status}}" >{{$ord->order_status}}</option>
                    <option value=" "></option>
                    <option value="Ditolak">Ditolak</option>
                    <option value="Diterima">Diterima</option>
                </select>
                </td>
                <td>
                    <div class="zoom"><img src="{{asset ('bukti/'.$ord->proof_payment) }}" width="80px" alt=""></div>
                </td>
                <td>
                <input type="hidden" name="customer_id" value="{{$ord->customer_id}}">
                <select name="payment_status" class="drop-down-bayar">
                    <option hidden value="{{$ord->payment_status}}" selected>{{$ord->payment_status}}</option>
                    <option value=" "></option>
                    <option value="Belum lunas">Belum lunas</option>
                    <option value="Lunas">Lunas</option>
                </select>
                </td>

                <td>
                <div class="flex-btn">
                <input type="submit" value="update" class="btn-order" name="update_payment">
                </form>

                <form style="display:block" action="/orders-delete/{{$ord->id}}" method="POST">
                    @csrf
                @method('DELETE')
                <button type="submit" class="delete-btn">Hapus</button>
                </form>
                    <a href="/date_update/{{$ord->id}}" class="option-btn">undur</a>
                </div>
                </div>
                </td>

            </tr>
            @endforeach

    </table>
    </div>
    </div>
    </section>

    <!-- placed orders section ends -->


    <!-- custom js file link  -->
    <script src="{{asset('js/admin_script.js')}}"></script>

    </body>
    </html>

