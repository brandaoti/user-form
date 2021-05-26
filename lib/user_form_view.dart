import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);

  // Global Key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('User Form '),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle_outlined, size: 54),

                  //
                  TextFormField(
                      decoration: InputDecoration(
                    labelText: 'Nome',
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
