import 'package:cash_log/models/document.dart';
import 'package:cash_log/models/documents.dart';

import 'package:cash_log/data/database_manager.dart';

import 'package:riverpod/riverpod.dart';

final documentsProvider = StateNotifierProvider<DocumentsNotifier, Documents>(
  (ref) => DocumentsNotifier(),
);

class DocumentsNotifier extends StateNotifier<Documents> {
  final database = DatabaseManager.instance;

  DocumentsNotifier() : super(Documents(list: [], initialBalance: 0));

  void loadDocuments(DateTime? date) {
    database.getDocumentsForDate(date ?? DateTime.now()).then(
          (documents) => state = documents,
        );
  }

  void save(Document document) {
    int documentIndex =
        state.list.indexWhere((element) => document.id == element.id);

    if (state.list.isNotEmpty) {
      if (documentIndex == -1) {
        document.balance = document.isCashIn
            ? state.list.first.balance! + document.value
            : state.list.first.balance! - document.value;
      } else if (state.list.length > documentIndex + 1) {
        document.balance = document.isCashIn
            ? state.list[documentIndex + 1].balance! + document.value
            : state.list[documentIndex + 1].balance! - document.value;
      } else {
        document.balance = document.isCashIn
            ? state.balance.initialBalance + document.value
            : state.balance.initialBalance - document.value;
      }
    } else {
      document.balance = document.isCashIn
          ? state.balance.initialBalance + document.value
          : state.balance.initialBalance - document.value;
    }

    database.save(document).then(
          (documents) => state = documents,
        );
  }

  void delete(Document document) {
    database.delete(document).then((documents) {
      if (documents != null) {
        state = documents;
      }
    });
  }
}
