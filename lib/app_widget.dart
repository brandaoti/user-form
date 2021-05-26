import 'package:flutter/material.dart';
import 'package:user_form/user_form_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Form Demo',
      home: UserForm(),
    );
  }
}
