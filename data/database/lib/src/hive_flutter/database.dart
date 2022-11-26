abstract class AppDatabase {
  Future<void> setUsername(String name);
  Future<String?> getUsername();
  Future<void> deleteUsername();
}