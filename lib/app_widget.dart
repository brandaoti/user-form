import 'package:flutter/material.dart';
import 'package:user_form/pages/user_form_view.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Form Demo',
      home: UserForm(),
    );
  }
}
