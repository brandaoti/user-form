import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void saveUser(String name, String lastname) async {
    final internalStorage = await _prefs;

    internalStorage.setString('name', name);
    internalStorage.setString('lastname', lastname);
    print('Dados salvo');
  }

  Future<String> getUserFullName() async {
    final internalPrefs = await _prefs;

    String? name = internalPrefs.getString('name');
    String? lastname = internalPrefs.getString('lastname');

    if ((name != null) && (lastname != null)) {
      return name + ' ' + lastname;
    }
    return 'Dados não encontrado!';
  }
}
