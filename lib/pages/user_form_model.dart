//

import 'package:user_form/shared/repository/shared_preferences.dart';

class UserFormModel {
  String? _name;
  String? _lastname;
  final InternalSharedPreferences _sharedPreferences = InternalSharedPreferences();

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

    _sharedPreferences.saveUser(_name!, _lastname!);
  }
}
