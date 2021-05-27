import 'package:flutter/material.dart';
import 'package:user_form/pages/user_form_controller.dart';
import 'package:user_form/shared/components/text_form_field_component.dart';

class UserForm extends StatelessWidget {
  final _controller = UserFormController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('User Form '),
      ),
      body: Center(
        child: Container(
          width: _size.width * .7,
          height: _size.height * .7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Form(
            key: _controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle_outlined, size: 54),
                  BuildTextFormFieldComponent(
                    labelText: 'Nome',
                    onValidate: (String value) => _controller.onValidateName(value),
                    onChanged: (String value) => _controller.onChangedName(value),
                  ),

                  BuildTextFormFieldComponent(
                    labelText: 'Sobrenome',
                    onValidate: (String value) => _controller.onValidateLastname(value),
                    onChanged: (String value) => _controller.onChangedLastname(value),
                  ),

                  //
                  SizedBox(height: _size.height * .1),
                  ElevatedButton(
                    child: Text('Logar'),
                    onPressed: () {
                      if (_controller.isValid) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text('Bem-Vindo'),
                              content: Text('${_controller.name} ${_controller.lastname}'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
