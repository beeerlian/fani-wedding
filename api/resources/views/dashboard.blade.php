<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Beranda</title>

   <!-- Logo Title Bar -->
   <link rel="icon" href="{{asset('images/logofanny.png')}}"
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
   <link rel="stylesheet" href="css/admin_style.css">

</head>
<body>

@include('components/admin_header')

<!-- admin dashboard section starts  -->

<section class="dashboard">

   <h1 class="heading">dashboard</h1>

   <div class="box-container">

   <div class="box">

      <h3>{{ $productcount }}</h3>
      <a href="products" class="btn">Lihat produk</a>
   </div>


   <div class="box">
      <h3>{{ $orderscount }}</h3>
      <a href="placed_orders" class="btn">Lihat Order</a>
   </div>


   <div class="box">
      <h3><span>Rp. </span><span>{{number_format($lunassum,2,',','.')}}</span></h3>
      <a href="lunas" class="btn">Order Lunas</a>
   </div>


   <div class="box">
      <h3><span>Rp. </span><span>{{number_format($notlunassum,2,',','.')}}</span></h3>
      <a href="belum_lunas" class="btn">Order Belum Lunas</a>
   </div>


   <div class="box">
      <h3>{{$customercount}}</h3>
      <a href="customer_accounts" class="btn">data pengguna</a>
   </div>

   <div class="box">
      <h3>{{$admincount}}</h3>

      <a href="admin_accounts" class="btn">data admin</a>
   </div>


   <div class="box">
      <h3>{{$employeecount}}</h3>
      <a href="employees" class="btn">data karyawan</a>
   </div>

   <div class="box">
      <h3>{{$partnercount}}</h3>
      <a href="partners" class="btn">data partner</a>
   </div>


   <div class="box">
      <h3>{{$messagecount}}</h3>
      <a href="messages" class="btn">lihat pesan</a>
   </div>

   </div>

</section>

<!-- admin dashboard section ends -->

<!-- custom js file link  -->
<script src="{{asset('js/admin_script.js')}}"></script>

</body>
</html>
