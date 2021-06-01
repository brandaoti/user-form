import 'package:flutter_test/flutter_test.dart';
import 'package:user_form/pages/user_form_model.dart';
import 'package:user_form/shared/repository/internal_storage_adapter.dart';

void main() {
  final model = UserFormModel(adapter: MockInternalStorage());
  test('Verificando dados no Internal Storage', () {
    model.setName = 'Ceyle';
    model.setLastname = 'Brandão';

    expect(model.getName, 'Ceyle');
    expect(model.getLastname, 'Brandão');

    model.getSaveUser();

    expect(model.getFullName(), completion('Ceyle Brandão'));
  });
}

class MockInternalStorage extends InternalStorageAdapter {
  String? name;
  String? lastname;

  @override
  Future<String> getFullName() {
    if ((name != null) && (lastname != null)) {
      return Future.value(name! + ' ' + lastname!);
    } else {
      return Future.value('Nenhuma informação salva.');
    }
  }

  @override
  void saveUser(String name, String lastname) {
    this.name = name;
    this.lastname = lastname;
  }
}
