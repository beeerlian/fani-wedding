<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Placed Order</title>

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
      height: 0% auto;
      }

      .zoom:hover {
      -ms-transform: scale(1.5); /* IE 9 */
      -webkit-transform: scale(1.5); /* Safari 3-8 */
      transform: scale(6.5);
      }

      .lun{
        display: table; /* keep the background color wrapped tight */
        border-radius: 15px;
        margin: 0px auto 0px auto; /* keep the table centered */
        padding:5px;font-size:20px;background-color:rgba(228, 0, 0, 0.664);color:#000000;
    }

    .not{
        display: table; /* keep the background color wrapped tight */
        border-radius: 15px;
        margin: 0px auto 0px auto; /* keep the table centered */
        padding:5px;font-size:20px;background-color:rgba(84, 206, 73, 0.63);color:#3b3939;
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
      </style>

</head>
<body>

@include('components.admin_header')

<!-- placed orders section starts  -->

<section class="placed-orders">

    <br>
    <a href="dashboard" class="button-54" role="button"><b><- Back</b></a>
    <br><br>

   <h1 class="heading">Order Lunas</h1>
<b>
   @if ($message = Session::get('lunasdel'))
            <div class="lun">{{ $message }}</div>
            @endif

            @if ($message = Session::get('lun1'))
            <div class="lun">{{ $message }}</div>
            @endif

            @if ($message = Session::get('lun2'))
            <div class="not">{{ $message }}</div>
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
            <td>Total Pembayaran</td>
            <td>Bukti Pembayaran</td>
            <td>Status Pembayaran</td>
            <td>Action</td>
         </tr>
      </thead>

      @foreach($lunas as $dah)



         <tr>
            <td><span>{{$dah->id}}</td>
            <td><span>{{$dah->name}}</span></td>
            <td><span>{{$dah->email}}</span></td>
            <td><span>{{$dah->number}}</span></td>
            <td><span>{{$dah->address}}</span></td>
            <td><span>{{$dah->event_time}}</span></td>
            <td><span>Rp. </span>{{number_format($dah->total_price,2,',','.')}}</span></td>
            <td><div class="zoom"><img src="{{asset('bukti/'.$dah->proof_payment)}}" width="80px" alt=""></div></td>

                <form action="/kelunasan2/{{$dah->id}}" method="POST" enctype="multipart/form-data">
                    @csrf
                <td>
                   <input type="hidden" name="order_id" value="{{$dah->id}}">
                   <select name="payment_status" class="drop-down-bayar">
                      <option hidden value="{{$dah->payment_status}}" selected>{{$dah->payment_status}}</option>
                      <option value=""></option>
                      <option value="Belum lunas">Belum lunas</option>
                      <option value="Lunas">Lunas</option>
                   </select>
                </td>

                <td>
                   <div class="flex-btn">
                   <input type="submit" value="update" class="btn-order" name="update_payment">
                </form>

                <span><form id="delete-form-{{$dah->id}}" action="/lunas2-delete/{{$dah->id}}" method="POST" style="display: none;">
                @csrf
                @method('DELETE')
            </form>
            <a href="#" class="delete-btn" onclick="event.preventDefault(); confirmDelete({{$dah->id}});">
                Hapus
            </a>

            <script>
            function confirmDelete(id) {
                if (confirm('Delete this order?')) {
                    document.getElementById('delete-form-' + id).submit();
                }
            }
            </script></span></td>
            </form>
         </td>
         </tr>
         @endforeach
   </table>
   </div>
   </div>
</section>

<!-- placed orders section ends -->









<!-- custom js file link  -->
<script src="../js/admin_script.js"></script>

</body>
</html>
