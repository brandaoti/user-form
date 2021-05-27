//
class UserFormModel {
  String? _name;
  String? _lastname;

  get getName => _name;

  get getLastname => _lastname;

  set setName(String name) {
    this._name = name;
  }

  set setLastname(String lastname) {
    this._lastname = lastname;
  }
}
