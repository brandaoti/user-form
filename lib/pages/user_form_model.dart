//

import 'package:user_form/shared/repository/secure_storage_adapter.dart';
import 'package:user_form/shared/repository/shared_preferences_adapter.dart';

class UserFormModel {
  String? _name;
  String? _lastname;
  final SharedPreferencesAdapter _sharedPreferences = SharedPreferencesAdapter();
  final SecureStorageAdapter _secureStorage = SecureStorageAdapter();

  get getName => _name;

  get getLastname => _lastname;

  set setName(String name) {
    this._name = name;
  }

  set setLastname(String lastname) {
    this._lastname = lastname;
  }

  // function to save user
  void getSaveUser() {
    if (_name == null) return;
    if (_lastname == null) return;

    // _sharedPreferences.saveUser(_name!, _lastname!);
    _secureStorage.saveUser(_name!, _lastname!);
  }

  Future<String> getFullName() {
    // return _sharedPreferences.getUserFullName();
    return _secureStorage.getFullName();
  }
}
