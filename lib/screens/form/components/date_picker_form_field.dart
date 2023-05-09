import 'package:cash_log/assets/constants/core_constants.dart';
import 'package:cash_log/extensions/formated_date.dart';

import 'package:flutter/material.dart';

class DatePickerFormField extends StatefulWidget {
  const DatePickerFormField({
    super.key,
    this.initialValue,
    required this.onSavedValue,
  });
  final DateTime? initialValue;
  final void Function(DateTime newValue) onSavedValue;

  @override
  State<DatePickerFormField> createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  TextEditingController dateController = TextEditingController();
  DateTime _pickedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _pickedDate = widget.initialValue ?? DateTime.now();

    dateController.text = _pickedDate.toStringDate;
  }

  void _selectDate(Function(DateTime pickedDate) onSelectedDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: CoreConstants.firstDate,
      lastDate: CoreConstants.lastDate,
    );
    if (pickedDate != null) {
      onSelectedDate(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateController,
      decoration: const InputDecoration(
        labelText: 'Date',
      ),
      readOnly: true,
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate((pickedDate) {
          setState(() {
            _pickedDate = pickedDate;
            dateController.text = pickedDate.toStringDate;
          });
        });
      },
      onSaved: (newValue) {
        widget.onSavedValue(_pickedDate);
      },
    );
  }
}
