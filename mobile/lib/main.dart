import 'dart:async';

import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
// import 'src/features/common/app_bloc/bloc_observer.dart';
import 'src/locator.dart';

Future main() async {
  await initializeApp();

  runApp(const MyApp());
}

// import 'package:fani_wedding/page/Beranda.dart';
// import 'package:fani_wedding/page/Keranjang.dart';
// import 'package:fani_wedding/page/PageAkunSaya.dart';
// import 'package:fani_wedding/page/PageEditProfile.dart';
// import 'package:fani_wedding/page/PageTentangKami.dart';
// import 'package:fani_wedding/page/PageUtama.dart';
// import 'package:fani_wedding/page/Produk.dart';
// import 'package:fani_wedding/page/ProdukView.dart';
// import 'package:fani_wedding/provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ProviderAccount(),
//       child: MaterialApp(
//         initialRoute: PageUtama.routeName.toString(),
//         routes: {
//           PageUtama.routeName.toString(): (context) => PageUtama(),
//           PageAkunSaya.routeName.toString(): (context) => PageAkunSaya(),
//           PageEditProfile.routeName.toString(): (context) => PageEditProfile(),
//           PageTentangKami.routeName.toString(): (context) => PageTentangKami(),
//           Beranda.routeName.toString(): (context) => Beranda(),
//           Produk.routeName.toString(): (context) => Produk(),
//           ProdukView.routeName.toString(): (context) => ProdukView(),
//           Keranjang.routeName.toString(): (context) => Keranjang()
//         },
//       ),
//     );
//   }
// }
