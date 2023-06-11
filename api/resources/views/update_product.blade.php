<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Edit Produk</title>

   <!-- Logo Title Bar -->
   <link rel="icon" href="../images/logofanny.png"
   type="image/x-icon" class="LOGO">

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- font google -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" media="all"/>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC%3A400%2C700%7CLato%3A400%2C700%2C400italic%2C700italic&amp;ver=4.9.8" type="text/css" media="screen"/>
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="{{ asset('css/admin_style.css') }}" type="text/css">

</head>
<body>

@include('components/admin_header')

<!-- update product section starts  -->

<section class="update-product">

   <h1 class="heading">Edit Produk</h1>

   <form id="update-form-{{$product->id}}" action="/product_update/{{$product->id}}" method="POST" enctype="multipart/form-data">
      @csrf
      <input type="hidden" name="pid" value="{{$product->id}}">
      <input type="hidden" name="old_image" value="{{asset('images/'.$product->image)}}">
      <img src="{{ asset('images/'.$product->image) }}" alt="">
      <span>Edit nama</span>
      <input type="text" required placeholder="enter product name" name="name" maxlength="100" class="box" value="{{ $product->name }}" required>
      <span>Edit harga</span>
      <input type="number" min="0" max="9999999999" required placeholder="enter product price" name="price" onkeypress="if(this.value.length == 16) return false;" class="box" value="{{$product->price}}" required>
      <span>Edit kategori</span>
      <select name="category" class="box" required>
         <option selected value="{{$product->category}}">{{$product->category}}</option>
         <option value="Makeup">Makeup</option>
         <option value="Paket Wedding">Paket Wedding</option>
         <option value="Extra Wedding">Extra Wedding</option>
         <option value="Paket Foto">Paket Foto</option>
      </select>
      <span>Edit keterangan</span>
      <textarea required placeholder="enter product description" name="keterangan" maxlength="1000" class="box">{{$product->keterangan}}</textarea>
      <span>edit gambar</span>
      <input type="file" name="image" class="box" accept="image/jpg, image/jpeg, image/png, image/webp">
      <div class="flex-btn">
         <input id="" type="submit" value="perbarui" class="btn" onclick="event.preventDefault(); if(confirm('produk berhasil di update')) { document.getElementById('update-form-{{ $product->id }}').submit(); }">
         <a href="{{ route('products.index') }}" class="option-btn">kembali</a>
      </div>
   </form>

</section>

<!-- update product section ends -->

<!-- custom js file link  -->
<script src="{{asset('js/admin_script.js')}}"></script>

</body>
</html>
