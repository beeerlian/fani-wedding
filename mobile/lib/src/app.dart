import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'features/common/setting/setting_bloc.dart';
import 'router/auto_router.gr.dart';
import 'theme/themes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<XRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingBloc()),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
        return MaterialApp.router(
          builder: BotToastInit(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('id', ''),
          ],
          locale: state.locale,
          theme: XTheme.light(),
          themeMode: state.themeMode,
          routeInformationParser:
              appRouter.defaultRouteParser(includePrefixMatches: true),
          routerDelegate: AutoRouterDelegate(
            appRouter,
            navigatorObservers: () => [BotToastNavigatorObserver()],
          ),
        );
      }),
    );
  }
}
