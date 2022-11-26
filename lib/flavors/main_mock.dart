import 'package:core/core.dart';
import 'package:flutter_project/flavors/base_config.dart';
import 'package:flutter_project/main.dart';

void main() {
  F.appFlavor = Flavor.Mock;
  Main.runner(environment: F.appEnvironment);
}