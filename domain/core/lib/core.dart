library core;

import 'package:core/src/di/init.dart';
import 'package:get_it/get_it.dart';

export 'package:auto_route/annotations.dart';
export 'package:auto_route/auto_route.dart';
export 'package:auto_route/empty_router_widgets.dart';
export 'package:core/generated/codegen_loader.g.dart';
export 'package:core/generated/locale_keys.g.dart';
export 'package:easy_debounce/easy_debounce.dart';
export 'package:easy_localization/easy_localization.dart';
export 'package:get_it/get_it.dart';
export 'package:injectable/injectable.dart';
export 'src/app_errors.dart';

export 'src/constants.dart';
export 'src/di/environments.dart';
export 'src/result.dart';
export 'src/storage/app_details.dart';
export 'src/utils.dart';

class Core {
  static inject(GetIt inject, String? environment) =>
      configureInjection(inject, environment);
}
