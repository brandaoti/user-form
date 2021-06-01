abstract class InternalStorageAdapter {
  void saveUser(String name, String lastname);

  Future<String> getFullName();
}
