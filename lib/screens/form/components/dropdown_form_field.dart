import 'package:cash_log/models/document.dart';

import 'package:flutter/material.dart';

class DropdownFormField extends StatelessWidget {
  const DropdownFormField({
    super.key,
    required this.labelText,
    required this.options,
    this.initialValue,
    required this.onSavedValue,
  });

  final String labelText;
  final List<String> options;
  final String? initialValue;
  final void Function(DocumentType) onSavedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      value: initialValue ?? options.first,
      items: options.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val.toUpperCase(),
          ),
        );
      }).toList(),
      onChanged: (value) {},
      onSaved: (value) {
        onSavedValue(
          DocumentType.values.firstWhere((element) => element.name == value),
        );
      },
    );
  }
}
