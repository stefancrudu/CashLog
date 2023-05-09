// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(value) => " ${value}";

  static String m1(value) => "Final balance: ${value}";

  static String m2(value) => "Initial balance: ${value}";

  static String m3(value) => "Total cash in: ${value}";

  static String m4(value) => "Total cash out: ${value}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cashInOptionFormLabel":
            MessageLookupByLibrary.simpleMessage("It\'s cash in?"),
        "dateFormLabel": MessageLookupByLibrary.simpleMessage("Date"),
        "deleteLabelButton":
            MessageLookupByLibrary.simpleMessage("Delete document"),
        "descriptionFormLabel":
            MessageLookupByLibrary.simpleMessage("Description"),
        "documentRowValue": m0,
        "editPostTitle": MessageLookupByLibrary.simpleMessage("Edit Post"),
        "errorMessageDocumentDescription": MessageLookupByLibrary.simpleMessage(
            "Please enter some text for description"),
        "errorMessageDocumentNumber": MessageLookupByLibrary.simpleMessage(
            "Please enter the number of the document"),
        "errorMessageDocumentValue": MessageLookupByLibrary.simpleMessage(
            "Please enter a value for the document"),
        "finalBalance": m1,
        "initialBalance": m2,
        "newPostTitle": MessageLookupByLibrary.simpleMessage("New Post"),
        "noDocumentsMessage":
            MessageLookupByLibrary.simpleMessage("You don\'t have documents."),
        "numberFormLabel":
            MessageLookupByLibrary.simpleMessage("Document Number"),
        "totalCashInBalance": m3,
        "totalCashOutBalance": m4,
        "typeFormLabel": MessageLookupByLibrary.simpleMessage("Document Type"),
        "valueFormLabel": MessageLookupByLibrary.simpleMessage("Document Value")
      };
}
