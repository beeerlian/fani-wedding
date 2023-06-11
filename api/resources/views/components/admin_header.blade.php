<header class="header">

   <section class="flex">

      <a href="dashboard" class="logo">Admin<span>Panel</span></a>

      <nav class="navbar">
         <a href="/dashboard">Beranda</a>
         <a href="/products">Produk</a>
         <a href="/placed_orders">Order</a>
         <a href="/admin_accounts">Admin</a>
         <a href="/customer_accounts">Pengguna</a>
      </nav>

      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="user-btn" class="fas fa-user"></div>
      </div>

      <div class="profile">




         <p>{{ Auth::user()->name }}</p>
         <a href="/edit_profile/{{ Auth::user()->id }}" class="btn">edit profil</a>
         <div class="flex-btn">
            <a href="/admin-reg" class="option-btn">daftar</a>
         </div>
         <a href="{{route('logout')}}" onclick="event.preventDefault(); document.getElementById('logout-form').submit(); return confirm('keluar dari web admin WoFy?');" class="delete-btn">keluar</a>
         <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
            @csrf
        </form>
      </div>



   </section>

</header>
