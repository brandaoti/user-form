import 'package:flutter/material.dart';

class BuildTextFormFieldComponent extends StatelessWidget {
  final String? labelText;
  final Function? onValidate;
  final Function? onChanged;

  const BuildTextFormFieldComponent({
    Key? key,
    required this.labelText,
    this.onValidate,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(labelText: labelText),
        validator: (value) => onValidate!(value),
        onChanged: (value) => onChanged!(value),
      ),
    );
  }
}
