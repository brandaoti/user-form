import 'dart:async';

import 'package:flutter/material.dart';
import 'package:user_form/pages/user_form_model.dart';

class UserFormController {
  final _formKey = GlobalKey<FormState>();
  final _model = UserFormModel();

  // validate form
  GlobalKey get formKey => _formKey;

  String get name => _model.getName;
  String get lastname => _model.getLastname;

  Future<String> get getCurrentUser => _model.getCurrentUser();

  get saveUser => _model.getSaveUser();

  get deleteUser => _model.deleteUser();

  onChangedName(String value) => _model.setName = value;

  onChangedLastname(String value) => _model.setLastname = value;

  bool get isValid => _formKey.currentState!.validate();

  // * Form and Field Validation
  String? onValidateName(String value) {
    if (value.isEmpty) {
      return 'Informe o seu nome!';
    } else if (value.length < 3) {
      return 'Nome precisa ter 3 ou mais caractere!';
    }
    return null;
  }

  String? onValidateLastname(String value) {
    if (value.isEmpty) {
      return 'Informe o seu sobrenome!';
    }
    return null;
  }
}
