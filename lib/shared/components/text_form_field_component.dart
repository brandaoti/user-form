import 'package:flutter/material.dart';

class BuildTextFormFieldComponent extends StatelessWidget {
  final String? labelText;
  final Function(String)? onValidator;
  final Function(String)? onChanged;

  const BuildTextFormFieldComponent({
    Key? key,
    required this.labelText,
    this.onValidator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(labelText: labelText),
        validator: (value) => onValidator!(value!),
        onChanged: (value) => onChanged!(value),
      ),
    );
  }
}
