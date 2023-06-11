<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Register</title>

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
   <link rel="stylesheet" href="{{('css/admin_style.css')}}">

</head>
<body>
<!-- register admin section starts  -->

<section class="form-container">

    <form action="{{ route('admin.store') }}" method="POST" enctype="multipart/form-data">
    @csrf
      <h3>register</h3>
      <input type="text" name="name" required placeholder="masukan nama anda" class="box">
      <input type="email" name="email" required placeholder="Masukkan email anda" class="box">
      <input type="tel" name="number" min="0" max="9999999999" placeholder="Masukkan nomor anda" class="box">
      <input type="text" name="address" placeholder="Masukkan alamat anda" class="box">
      <input type="password" name="password" maxlength="20" placeholder="masukan kata sandi" class="box" oninput="this.value = this.value.replace(/\s/g, '')">
      <input type="submit" value="register" name="submit" class="btn">
   </form>

</section>

<!-- register admin section ends -->

<!-- custom js file link  -->
<script src="{{('js/admin_script.js')}}"></script>

</body>
</html>
