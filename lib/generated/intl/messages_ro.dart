// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ro locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ro';

  static String m0(value) => "${value}";

  static String m1(value) => "Sold final: ${value}";

  static String m2(value) => "Sold inital: ${value}";

  static String m3(value) => "Total incasat: ${value}";

  static String m4(value) => "Total platit: ${value}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cashInOptionFormLabel":
            MessageLookupByLibrary.simpleMessage("Sunt bani incasati?"),
        "dateFormLabel": MessageLookupByLibrary.simpleMessage("Data"),
        "deleteLabelButton":
            MessageLookupByLibrary.simpleMessage("Sterge documentul"),
        "descriptionFormLabel":
            MessageLookupByLibrary.simpleMessage("Descriere"),
        "documentRowValue": m0,
        "editPostTitle":
            MessageLookupByLibrary.simpleMessage("Editeaza document"),
        "errorMessageDocumentDescription":
            MessageLookupByLibrary.simpleMessage("Introdu o descriere"),
        "errorMessageDocumentNumber": MessageLookupByLibrary.simpleMessage(
            "Introdu numarul documentului"),
        "errorMessageDocumentValue": MessageLookupByLibrary.simpleMessage(
            "Introdu valoarea documentului"),
        "finalBalance": m1,
        "initialBalance": m2,
        "newPostTitle": MessageLookupByLibrary.simpleMessage("Document nou"),
        "noDocumentsMessage":
            MessageLookupByLibrary.simpleMessage("Nu ai documente."),
        "numberFormLabel":
            MessageLookupByLibrary.simpleMessage("Numar document"),
        "totalCashInBalance": m3,
        "totalCashOutBalance": m4,
        "typeFormLabel": MessageLookupByLibrary.simpleMessage("Tip document"),
        "valueFormLabel":
            MessageLookupByLibrary.simpleMessage("Valoare document")
      };
}
