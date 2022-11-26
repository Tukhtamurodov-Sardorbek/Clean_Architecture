import 'package:database/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/flavors/base_config.dart';
import 'package:core/core.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:usecase/usecase.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'di/injector.dart';

void mainCommon() {
  if (kDebugMode) {
    Bloc.observer = AppBlocObserver();
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return F.appFlavor == Flavor.prod
            ? const MyApp()
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
                  child: const MyApp(),
                ),
              );
      },
    ),
  );
}

class App {
  final Environment environment;
  final Widget Function(ThemeData theme, ThemeData darkTheme) appWidget;

  App._internal(this.environment, this.appWidget) {
    init(environment);
  }

  factory App.run({
    required Environment environment,
    required Widget Function(ThemeData theme, ThemeData darkTheme) appWidget,
  }) {
    return App._internal(environment, appWidget);
  }

  Future<void> init(Environment env) async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
      _initInjections(environment),
      EasyLocalization.ensureInitialized(),
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
    ]);

    final themes = result.whereType<ThemeData>();

    final lightTheme =
    themes.firstWhere((element) => element.brightness == Brightness.light);
    final darkTheme =
    themes.firstWhere((element) => element.brightness == Brightness.dark);

    runApp(appWidget(lightTheme, darkTheme));
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
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text('Clean Architecture'),
      ),
      body: Container(
        color: Colors.blueGrey,
      ),
    );
  }
}
