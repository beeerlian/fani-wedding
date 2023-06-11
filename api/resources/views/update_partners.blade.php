<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Edit Partner</title>

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


</head>
<body>

@include ('components.admin_header')

<!-- update partners section starts  -->

<section class="update-partners">

   <h1 class="heading">edit partner</h1>

   <form action="/update_partner/{{$partner->id}}" method="POST" enctype="multipart/form-data">
    @csrf
      <input type="hidden" name="id" value="{{$partner->id}}">
      <span>edit nama</span>
      <input type="text" required placeholder="enter partner name" name="name" maxlength="100" class="box" value="{{$partner->name}}">
      <span>edit email</span>
      <input type="email" name="email" required placeholder="enter partner email" maxlength="100" class="box" value="{{$partner->email}}">
      <span>edit nomor telepon</span>
      <input type="text" min="0" max="9999999999" required placeholder="enter partners number phone" name="number" class="box" onkeypress="if(this.value.length == 18) return false;" class="box" value="{{$partner->number}}">
      <span>edit deskripsi</span>
      <textarea required placeholder="enter partner description" name="keterangan" maxlength="1000" class="box">{{$partner->keterangan}}</textarea>
      <span>edit alamat</span>
      <textarea required placeholder="enter partner address" name="address" maxlength="1000" class="box">{{$partner->address}}</textarea>
      <div class="flex-btn">
         <input type="submit" value="perbarui" class="btn" name="update">
         <a href="/partners" class="option-btn">kembali</a>
      </div>
   </form>

</section>

<!-- update product section ends -->

<!-- custom js file link  -->
<script src="{{asset('js/admin_script.js')}}"></script>

</body>
</html>
