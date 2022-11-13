import 'package:core/src/constants.dart';

extension StringExtensions on String {
  String withDefaultPhoneCode() => '${Constants.defaultPhoneCode} $this';

  String obscurePhone() => replaceAll(RegExp(r'(?<=.{5})\d(?=.{3})'), '*');

  String removeBlankSpaces() => replaceAll(' ', '');
}

extension CardBalanceExt on num {
  double fromTiyin() => this / 100;
}
