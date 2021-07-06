abstract class InternalStorageAdapter {
  void saveUser(String name, String lastname);
  void deleteUser();

  Future<String> currentUser();
}
