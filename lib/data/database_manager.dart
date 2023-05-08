import 'dart:developer';

import 'package:cash_log/models/document.dart';
import 'package:cash_log/models/documents.dart';
import 'package:cash_log/extensions/formated_date.dart';

import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class DocumentsDatabaseFields {
  static const String name = 'documents';
  static const String id = 'id';
  static const String type = 'type';
  static const String number = 'number';
  static const String description = 'description';
  static const String value = 'value';
  static const String isCashIn = 'isCashIn';
  static const String blanace = 'balance';
  static const String date = 'date';
}

class DatabaseManager {
  DatabaseManager._privateConstructor();
  static final DatabaseManager instance = DatabaseManager._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(
      path.join(dbPath, 'documents.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(
    Database db,
    int version,
  ) async {
    await db.execute('''
          CREATE TABLE ${DocumentsDatabaseFields.name} (
            ${DocumentsDatabaseFields.id} INTEGER PRIMARY KEY AUTOINCREMENT, 
            ${DocumentsDatabaseFields.type} INTEGER, 
            ${DocumentsDatabaseFields.number} TEXT, 
            ${DocumentsDatabaseFields.description} TEXT, 
            ${DocumentsDatabaseFields.value} REAL,
            ${DocumentsDatabaseFields.isCashIn} BOOLEAN, 
            ${DocumentsDatabaseFields.blanace} REAL,
            ${DocumentsDatabaseFields.date} INTEGEN
          )
          ''');
  }

  DateTime _currentDate = DateTime.now();
  List<Document> _documents = [];

  Future<Documents> get documents async {
    double initialBalance = await getInitialBalance(_currentDate);
    return Documents(list: _documents, initialBalance: initialBalance);
  }

  Future<double> getInitialBalance(DateTime date) async {
    final Database database = await instance.database;
    final data = await database.query(
      DocumentsDatabaseFields.name,
      where: '${DocumentsDatabaseFields.date} < ?',
      whereArgs: [date.formatedToDatabase],
      orderBy: 'date DESC, id DESC',
      limit: 1,
    );

    if (data.isNotEmpty) {
      return Document.fromDatabaseMap(data.first).balance ?? 0;
    }
    return 0.0;
  }

  Future<Documents> getDocumentsForDate(DateTime date) async {
    _documents = [];
    _currentDate = date;
    final Database database = await instance.database;
    final data = await database.query(
      DocumentsDatabaseFields.name,
      where: '${DocumentsDatabaseFields.date} = ?',
      whereArgs: [date.formatedToDatabase],
      orderBy: 'id DESC',
    );
    _documents = data.map((row) => Document.fromDatabaseMap(row)).toList();
    return await documents;
  }

  Future<Documents> save(Document document) async {
    try {
      document.id == null ? await _add(document) : await _update(document);
    } catch (error) {
      log('save: Can\t save document');
    }
    return documents;
  }

  Future<void> _add(Document document) async {
    try {
      final Database database = await instance.database;
      int documentId = await database.insert(
        DocumentsDatabaseFields.name,
        document.createMapForDatabase(),
      );
      document.id = documentId;
    } catch (error) {
      log('insert: Can\t add document with id ${document.id}');
    }

    if (document.date == _currentDate) {
      _documents = [document, ..._documents];
    }

    if (document.date.dateOnly().compareTo(DateTime.now().dateOnly()) <= 0) {
      try {
        await _updateBalanceUntilToday(
          document.isCashIn ? document.value : 0 - document.value,
          document.date,
          document.id!,
        );
      } catch (error) {
        log('updateBalanceUntilToday: Can\t update documents from ${document.date} - id document ${document.id}');
      }
    }
  }

  Future<void> _update(Document document) async {
    // check if document has id?
    final index = _documents
        .indexWhere((documentFormList) => documentFormList.id == document.id);
    double oldBalance = _documents[index].balance!; // it will be updated;
    _documents[index] = document;

    try {
      final Database database = await instance.database;
      await database.update(
        DocumentsDatabaseFields.name,
        document.createMapForDatabase(),
        where: '${DocumentsDatabaseFields.id} = ?',
        whereArgs: [document.id],
      );
    } catch (error) {
      log('update: Can\t update document with id ${document.id}');
    }
    if (document.date.dateOnly().compareTo(DateTime.now().dateOnly()) <= 0) {
      try {
        await _updateBalanceUntilToday(
            document.balance! - oldBalance, document.date, document.id!);
      } catch (error) {
        log('updateBalanceUntilToday: Can\t update documents from ${document.date} - id document ${document.id}');
      }
    }
  }

  Future<Documents?> delete(Document document) async {
    if (document.id == null) return null;
    try {
      final Database database = await instance.database;
      await database.delete(
        DocumentsDatabaseFields.name,
        where: '${DocumentsDatabaseFields.id} = ?',
        whereArgs: [document.id],
      );
    } catch (error) {
      log('delete: Can\t delete document with ${document.id}');
    }

    _documents = _documents
        .where(
            (Document documentFromList) => documentFromList.id != document.id)
        .toList();
    if (document.date.dateOnly().compareTo(DateTime.now().dateOnly()) <= 0) {
      try {
        await _updateBalanceUntilToday(
            document.isCashIn ? 0 - document.value : document.value,
            document.date,
            document.id!);
      } catch (error) {
        log('updateBalanceUntilToday: Can\'t update all balances');
      }
    }
    return documents;
  }

  Future<void> _updateBalanceUntilToday(
      double diference, DateTime fromDate, int fromId) async {
    List<Map<String, Object?>> data = [];
    try {
      final Database database = await instance.database;
      data = await database.query(
        DocumentsDatabaseFields.name,
        where: '${DocumentsDatabaseFields.date} >= ?',
        whereArgs: [fromDate.formatedToDatabase],
        orderBy: 'date ASC, id ASC',
      );

      List<Document> documentsToUpdate =
          data.map((row) => Document.fromDatabaseMap(row)).toList();

      for (Document document in documentsToUpdate) {
        // neeed to update documents from
        if (document.date.dateOnly().compareTo(fromDate.dateOnly()) == 0 &&
            document.id! <= fromId) {
          continue;
        }
        if (document.date.dateOnly().compareTo(fromDate.dateOnly()) == 0) {
          for (Document documentFromList in _documents) {
            if (documentFromList.id == document.id) {
              documentFromList.balance = document.balance! + diference;
            }
          }
        }
        document.balance = document.balance! + diference;

        await database.update(
          DocumentsDatabaseFields.name,
          document.createMapForDatabase(),
          where: '${DocumentsDatabaseFields.id} = ?',
          whereArgs: [document.id],
        );
      }
    } catch (error) {
      log('updateBalanceUntilToday: can\'t update documents $fromDate');
    }
  }
}
