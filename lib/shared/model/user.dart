class User {
  int? rowId;
  String? name;
  String? lastname;

  User({this.name, this.lastname});

  User.fromMap(Map<String, dynamic> map) {
    rowId = map['rowid'];
    name = map['name'];
    lastname = map['lastname'];
  }

  Map<String, dynamic> toMap() {
    return {
      'rowid': rowId,
      'name': name,
      'lastname': lastname,
    };
  }
}
