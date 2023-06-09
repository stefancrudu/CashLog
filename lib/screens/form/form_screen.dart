import 'package:cash_log/models/document.dart';
import 'package:cash_log/providers/documents_provider.dart';

import 'package:cash_log/screens/form/components/date_picker_form_field.dart';
import 'package:cash_log/screens/form/components/dropdown_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormScreen extends ConsumerStatefulWidget {
  Document? document;
  DateTime? dateTime;
  FormScreen({super.key, this.document, this.dateTime});

  @override
  ConsumerState<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends ConsumerState<FormScreen> {
  Widget get titleScreen {
    return Text(widget.document == null ? 'New post' : 'Edit post');
  }

  var _date = DateTime.now();
  var _type = DocumentType.values.first;
  var _number = '';
  var _description = '';
  var _value = 0.0;
  var _isCashIn = false;

  final _formKey = GlobalKey<FormState>();

  void _saveAction() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.document = Document(
        id: widget.document?.id,
        type: _type,
        number: _number,
        description: _description,
        value: _value,
        isCashIn: _isCashIn,
        date: _date,
      );

      ref.read(documentsProvider.notifier).save(widget.document!);

      Navigator.of(context).pop();
    }
  }

  void _deleteAction() {
    ref.read(documentsProvider.notifier).delete(widget.document!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleScreen,
        actions: [
          IconButton(
            onPressed: _saveAction,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            children: [
              DatePickerFormField(
                initialValue:
                    widget.document?.date ?? widget.dateTime ?? DateTime.now(),
                onSavedValue: (value) {
                  _date = value;
                },
              ),
              DropdownFormField(
                labelText: 'Type',
                options: DocumentType.values.map((e) => e.name).toList(),
                initialValue: widget.document?.type.name ??
                    DocumentType.values.first.name,
                onSavedValue: (value) => {
                  _type = value,
                },
              ),
              TextFormField(
                initialValue: widget.document?.number ?? '',
                decoration: const InputDecoration(
                  labelText: 'Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of the document';
                  }
                  return null;
                },
                onSaved: (value) {
                  _number = value!;
                },
              ),
              TextFormField(
                initialValue: widget.document?.description ?? '',
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text for description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                initialValue: widget.document?.value.toString(),
                decoration: const InputDecoration(
                  labelText: 'Value',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some value';
                  }
                  return null;
                },
                onSaved: (value) {
                  _value = double.parse(value!);
                },
              ),
              FormField(
                initialValue: widget.document?.isCashIn ?? false,
                builder: (FormFieldState<bool> field) {
                  return SwitchListTile(
                    title: const Text("It's cash in?"),
                    value: field.value ?? false,
                    onChanged: (val) {
                      field.didChange(val);
                    },
                  );
                },
                onSaved: (value) {
                  _isCashIn = value!;
                },
              ),
              const Spacer(),
              if (widget.document?.id != null)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: _deleteAction,
                    icon: const Icon(Icons.delete_outlined),
                    label: const Text('Delete document'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
