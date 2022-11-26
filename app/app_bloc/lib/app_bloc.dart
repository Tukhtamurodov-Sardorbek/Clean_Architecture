library app_bloc;

import 'package:app_bloc/src/di/init.dart';
import 'package:core/core.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'src/app_bloc_helper.dart';
export 'src/bloc_observer.dart';

class AppBloc {
  static inject(GetIt inject, String? environment) =>
      configureInjection(inject, environment);
}
