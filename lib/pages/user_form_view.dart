import 'package:flutter/material.dart';
import 'package:user_form/pages/user_form_view_model.dart';
import 'package:user_form/shared/components/text_form_field_component.dart';
import 'package:user_form/shared/model/user.dart';

class UserForm extends StatelessWidget {
  final _controller = UserFormController();
  User? user;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text('User Form '),
          ),
          body: Center(
            child: Container(
              width: constraints.maxWidth * .8,
              height: constraints.maxHeight * .6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              constraints: BoxConstraints(
                maxWidth: 400,
                maxHeight: 300,
              ),
              child: Form(
                key: _controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(Icons.account_circle_outlined, size: 54),
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
                      SizedBox(height: _size.height * .05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            icon: Icon(Icons.login),
                            label: Text('Logar'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(38, 38),
                            ),
                            onPressed: () {
                              if (_controller.isValid) {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    final _name = '${_controller.name}';
                                    final _lastname = '${_controller.lastname}';

                                    return AlertDialog(
                                      title: Text('Bem-Vindo'),
                                      content: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text('$_name $_lastname'),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      actions: [
                                        IconButton(
                                          icon: Icon(Icons.save),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _controller.saveUser;

                                            final user = 'Usuário: $_name $_lastname';

                                            final snackBar = SnackBar(
                                              content: Text(user),
                                              backgroundColor: Colors.green,
                                            );

                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          ),
                          ElevatedButton.icon(
                            icon: Icon(Icons.save_outlined),
                            label: Text('Dados'),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return FutureBuilder<String>(
                                    future: _controller.getCurrentUser,
                                    builder: (context, snapshot) {
                                      return AlertDialog(
                                        title: Text('Usuário'),
                                        content: Text(snapshot.data ?? ''),
                                        actions: [
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              _controller.deleteUser;

                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
