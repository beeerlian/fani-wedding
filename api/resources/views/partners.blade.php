<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Partner / Mitra kerja</title>

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
        .hijau{
        display: table; /* keep the background color wrapped tight */
        border-radius: 15px;
        margin: 0px auto 0px auto; /* keep the table centered */
        padding:5px;font-size:20px;background-color:rgba(84, 206, 73, 0.63);color:#3b3939;
    }
    .merah{
        display: table; /* keep the background color wrapped tight */
        border-radius: 15px;
        margin: 0px auto 0px auto; /* keep the table centered */
        padding:5px;font-size:20px;background-color:rgba(228, 0, 0, 0.664);color:#000000;
    }
    .biru{
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
    </style>

</head>
<body>

@include('components.admin_header')

<!-- add partners section starts  -->

<section class="add-partners">

    <br>
    <a href="dashboard" class="button-54" role="button"><strong><- Back</strong></a>
    <br><br>

    <b>
    @if ($message = Session::get('up-part'))
            <div class="hijau">{{ $message }}</div>
            @endif

    @if ($message = Session::get('part1'))
                <div class="hijau">{{ $message }}</div>
            @endif

            @if ($message = Session::get('part-del'))
                <div class="merah">{{ $message }}</div>
            @endif
        </b>
            <br><br>

   <form action="/partner-add" method="POST" enctype="multipart/form-data">
    @csrf
      <h3>tambahkan partner</h3>
      <input type="text" required placeholder="masukan nama partner" name="name" maxlength="100" class="box">
      <input type="email" name="email" required placeholder="masukan email partner" maxlength="100" class="box">
      <input type="text" required placeholder="masukan nomor telepon partner" name="number" onkeypress="if(this.value.length == 18) return false;" class="box">
      <textarea required placeholder="deskripsi partner" name="keterangan" maxlength="1000" class="box"></textarea>
      <textarea required placeholder="masukan alamat partner" name="address" maxlength="1000" class="box"></textarea>
      <input type="submit" value="tambahkan partner" name="add_partners" class="btn">
   </form>

</section>

<!-- add partners section ends -->

<!-- show partners section starts  -->

<section class="show-partners" style="padding-top: 0;">

<div class="box-container">
   <div class="box">
   <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
      <tr>
         <thead>
            <tr>
               <th>nama</th>
               <th>email</th>
               <th>nomor telepon</th>
               <th>deskripsi</th>
               <th>alamat</th>
               <th>aksi</th>
         </tr>
         </thead>
      </tr>

      @foreach($partner as $part)

         <tr>
            <td><span>{{$part->name}}</span></td>
            <td><span>{{$part->email}}</span></td>
            <td><span>{{$part->number}}</span></td>
            <td><span>{{$part->keterangan}}</span></td>
            <td><span>{{$part->address}}</span></td>
            <td><div class="flex-btn">
               <a href="/partners/{{$part->id}}" class="option-btn-aksi">edit</a>

               <form action="/partner-delete/{{$part->id}}" enctype="multipart/form-data" method="POST">
                @csrf
               <button type="submit" class="delete-btn" onclick="return confirm('Delete this partner?');">hapus</a>
                @method('DELETE')
               </form>
            </div>
        </td>
         </tr>

         @endforeach

   </table>
   </div>
</div>
</section>

<!-- show products section ends -->

<!-- custom js file link  -->
<script src="{{asset('js/admin_script.js')}}"></script>

</body>
