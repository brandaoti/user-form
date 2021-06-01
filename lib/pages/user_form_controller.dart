import 'package:flutter/material.dart';
import 'package:user_form/pages/user_form_model.dart';

class UserFormController {
  final _formKey = GlobalKey<FormState>();
  final _model = UserFormModel();

  // validate form
  GlobalKey get formKey => _formKey;
  bool get isValid => _formKey.currentState!.validate();

  String get name => _model.getName;

  String get lastname => _model.getLastname;

  // * Form and Field Validation

  // Validate name
  String? onValidateName(String value) {
    if (value.isEmpty) {
      return 'Informe o seu nome!';
    } else if (value.length < 3) {
      return 'Nome precisa ter 3 ou mais caractere!';
    }
    return null;
  }

  // Validate lastname
  String? onValidateLastname(String value) {
    if (value.isEmpty) {
      return 'Informe o seu sobrenome!';
    }
    return null;
  }

  // Name changed
  onChangedName(String value) => _model.setName = value;

  // Lastname changed
  onChangedLastname(String value) => _model.setLastname = value;

  // Save internal storage
  get saveUser => _model.getSaveUser();

  // Recuperar dados
  Future<String> get fullName => _model.getFullName();
}
