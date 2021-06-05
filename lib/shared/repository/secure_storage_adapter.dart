import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:user_form/shared/repository/internal_storage_adapter.dart';

class SecureStorageAdapter extends InternalStorageAdapter {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  void saveUser(String name, String lastname) async {
    await _secureStorage.write(key: 'name', value: name);
    await _secureStorage.write(key: 'lastname', value: lastname);
    print('Dados securo');
  }

  Future<String> currentUser() async {
    String? name = await _secureStorage.read(key: 'name');
    String? lastname = await _secureStorage.read(key: 'lastname');

    if ((name != null) && (lastname != null)) {
      return name + ' ' + lastname;
    } else {
      return 'Dados não seguros';
    }
  }

  @override
  void deleteUser() {}
}
