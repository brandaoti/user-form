class User {
  String? name;
  String? lastname;

  User({required this.name, required this.lastname});

  User.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    lastname = map['lastname'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastname': lastname,
    };
  }
}
