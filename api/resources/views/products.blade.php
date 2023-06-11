<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Produk</title>

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
   <link rel="stylesheet" href="{{ asset('css/admin_style.css') }}">

   <style>
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

.ordd4{
        display: table; /* keep the background color wrapped tight */
        justify-content: center;
        border-radius: 15px;
        margin: 0px auto 0px auto; /* keep the table centered */
        padding:5px;font-size:20px;background-color:rgba(108, 235, 96, 0.63);color:#3b3939;
    }
   </style>

</head>
<body>

@include('components.admin_header')

<!-- add products section starts  -->

<section class="add-products">
    <br>
    <a href="dashboard" class="button-54" role="button"><b><- Back</b></a>
    <br><br><br><br>

    @if ($message = Session::get('prodsucc'))
                <div class="ordd4">{{ $message }}</div>
            @endif

            <br><br>

   <form action="{{ route('products.store') }}" method="POST" enctype="multipart/form-data">
    @csrf
      <h3>tambahkan produk</h3>
      <input type="text" required placeholder="masukan nama produk" name="name" maxlength="100" class="box">
      <input type="number" min="0" max="9999999999" required placeholder="masukan harga produk" name="price" onkeypress="if(this.value.length == 16) return false;" class="box">
      <select name="category" class="box" required>
         <option value="" disabled selected>pilih kategori--</option>
         <option value="Makeup">Makeup</option>
         <option value="Paket Wedding">Paket Wedding</option>
         <option value="Extra Wedding">Extra Wedding</option>
         <option value="Paket Foto">Paket Foto</option>
      </select>
      <textarea required placeholder="masukan deskripsi produk" name="keterangan" maxlength="1000" class="box"></textarea>
      <input type="file" name="image" class="box" accept="image/jpg, image/jpeg, image/png, image/webp" required>
      <input type="submit" value="tambahkan produk" name="submit" class="btn">
   </form>

</section>

<!-- add products section ends -->

<!-- show products section starts  -->
<section class="show-products" style="padding-top: 0;">

   <div class="box-container">

    @foreach ($product as $item)

   <div class="box">
      <img src="{{ asset('images/'.$item->image) }}" alt="">
      <div class="flex">
        <div class="price"><span>Rp. </span>{{number_format($item->price,2,',','.')}}<span></span></div>
        <div class="category">{{ $item->category }}</div>
      </div>
      <div class="name"><p class="c">{{ $item->name }}</p></div>
      <div class="keterangan">  {{ $item->keterangan }} </div>
      <div class="flex-btn">

        <a href="/update_product/{{ $item->id }}" class="option-btn">edit</a>

         <a href="{{ url('products/' . $item->id) }}" class="delete-btn" onclick="event.preventDefault(); if(confirm('Yakin ingin menghapus produk?')) { document.getElementById('delete-form-{{ $item->id }}').submit(); }">hapus</a>
         <form id="delete-form-{{ $item->id }}" action="{{ url('products/' . $item->id) }}" method="POST" style="display: none;">
             @csrf
             @method('DELETE')
         </form>


      </div>
   </div>

   @endforeach

   </div>

</section>
<!-- show products section ends -->

<!-- custom js file link  -->
<script src="js/admin_script.js"></script>

</body>
</html>
