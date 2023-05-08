import 'package:cash_log/data/database_manager.dart';
import 'package:cash_log/extensions/formated_date.dart';

import 'package:flutter/material.dart';

enum DocumentType {
  ci,
  di,
  dp,
  bf,
  another,
}

class Document {
  int? id;
  DocumentType type;
  String number;
  String description;
  double value;
  bool isCashIn;
  double? balance;
  DateTime date;

  Document({
    this.id,
    required this.type,
    required this.number,
    required this.description,
    required this.value,
    required this.isCashIn,
    this.balance,
    required this.date,
  });

  Document.fromDatabaseMap(Map<String, dynamic> map)
      : id = map[DocumentsDatabaseFields.id],
        type = DocumentType.values[map[DocumentsDatabaseFields.type] as int],
        number = map[DocumentsDatabaseFields.number],
        description = map[DocumentsDatabaseFields.description],
        value = map[DocumentsDatabaseFields.value],
        isCashIn = map[DocumentsDatabaseFields.isCashIn] == 0 ? false : true,
        balance = map[DocumentsDatabaseFields.blanace],
        date = DateTime.fromMillisecondsSinceEpoch(
            map[DocumentsDatabaseFields.date]);

  Map<String, dynamic> createMapForDatabase() {
    return {
      DocumentsDatabaseFields.type: type.index,
      DocumentsDatabaseFields.number: number,
      DocumentsDatabaseFields.description: description,
      DocumentsDatabaseFields.value: value,
      DocumentsDatabaseFields.isCashIn: isCashIn,
      DocumentsDatabaseFields.blanace: balance ?? 0,
      DocumentsDatabaseFields.date: date.dateOnly().millisecondsSinceEpoch,
    };
  }
}
