import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'network/domain_manager.dart';
import 'router/auto_router.gr.dart';
import 'theme/themes.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(XTheme.barOverLayStyle);

  _locator();

  await Future.wait([
    // AnalyticsService.instance.init(),
    // dotenv.load(fileName: ".env"),
    GetStorage.init(),
  ]);
}

void _locator() {
  GetIt.I.registerLazySingleton(() => DomainManager());
  GetIt.I.registerLazySingleton(() => XRouter());
}
