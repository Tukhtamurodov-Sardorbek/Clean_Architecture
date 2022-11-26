import 'package:database/src/hive_flutter/database.dart';

class AppDatabaseImpl implements AppDatabase{
  /// * Need a hive box
  const AppDatabaseImpl();

  @override
  Future<void> deleteUsername() async {}

  @override
  Future<String?> getUsername() async => null;

  @override
  Future<void> setUsername(String name) async {}

}