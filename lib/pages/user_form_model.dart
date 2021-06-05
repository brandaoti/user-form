import 'package:user_form/shared/model/user.dart';
import 'package:user_form/shared/repository/internal_storage_adapter.dart';
import 'package:user_form/shared/repository/secure_storage_adapter.dart';
import 'package:user_form/shared/repository/shared_preferences_adapter.dart';
import 'package:user_form/shared/repository/sql_adapter.dart';

class UserFormModel {
  String? _name;
  String? _lastname;

  User? user;

  final InternalStorageAdapter internalStorage;

  UserFormModel({InternalStorageAdapter? adapter}) : internalStorage = adapter ?? SqlAdapter();

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
    internalStorage.saveUser(_name!, _lastname!);
  }

  void deleteUser() {
    internalStorage.deleteUser();
  }

  Future<String> getCurrentUser() {
    // return _sharedPreferences.getUserFullName();
    return internalStorage.currentUser();
  }

  Future<String> fullName() {
    return internalStorage.currentUser();

    // if ((_name != null) && (_lastname != null)) {
    //   return "$_name $_lastname";
    // } else {
    //   return 'Nenhum usuário encontrado!';
    // }
  }
}
