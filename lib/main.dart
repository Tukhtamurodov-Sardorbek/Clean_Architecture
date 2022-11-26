import 'dart:math';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:design_system/design_system.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_project/app.dart';
import 'package:flutter_project/di/injector.dart';
import 'package:flutter_project/flavors/base_config.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:usecase/usecase.dart';

class Main {
  final Environment environment;

  Main._(this.environment) {
    run(environment);
  }

  factory Main.runner({required Environment environment}) {
    return Main._(environment);
  }

  Future<void> _initInjections(Environment env) async {
    configureDependencies(env.name);

    await AppBloc.inject(locator, env.name);
    await Database.inject(locator, env.name);
    await Network.inject(locator, env.name);
    await Core.inject(locator, env.name);
    await Repository.inject(locator, env.name);
    await UseCase.inject(locator, env.name);
  }

  Future<void> run(Environment env) async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    EasyLogger(name: '🌎 FLAVOR').warning('Running ${env.name}');

    if (kDebugMode) {
      Bloc.observer = AppBlocObserver();
    }

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
      ),
    );

    final result = await Future.wait<dynamic>([
      _initInjections(env),
      EasyLocalization.ensureInitialized(),
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
      AppTheme.getAppThemeLight(),
      AppTheme.getAppThemeDark(),
    ]);

    final themes = result.whereType<ThemeData>();
    final lightTheme = themes.firstWhere((element) => element.brightness == Brightness.light);
    final darkTheme = themes.firstWhere((element) => element.brightness == Brightness.dark);

    runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('ru'),
          Locale('uz'),
          Locale('en'),
        ],
        useOnlyLangCode: true,
        useFallbackTranslations: true,
        fallbackLocale: const Locale('ru'),
        path: 'packages/core/assets/translations',
        child: Builder(
          builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              theme: lightTheme.copyWith(
                textTheme: GoogleFonts.manropeTextTheme(lightTheme.textTheme),
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
                    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                  },
                ),
              ),

              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,

              builder: (context, child) {
                // GetIt.I.get<Alice>().setNavigatorKey(GetIt.I.get<AppRouter>().navigatorKey);
                return F.appFlavor == Flavor.Production
                    ? const App()
                    : SafeArea(
                  child: Banner(
                    location: BannerLocation.topStart,
                    message: F.name,
                    color: Colors.black,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                      letterSpacing: 1.0,
                    ),
                    child: const App(),
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
