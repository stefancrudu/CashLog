// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// ` {value}`
  String documentRowValue(double value) {
    final NumberFormat valueNumberFormat = NumberFormat.simpleCurrency(
        locale: Intl.getCurrentLocale(), decimalDigits: 2);
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      ' $valueString',
      name: 'documentRowValue',
      desc: 'The value from document in list',
      args: [valueString],
    );
  }

  /// `Initial balance: {value}`
  String initialBalance(double value) {
    final NumberFormat valueNumberFormat = NumberFormat.simpleCurrency(
        locale: Intl.getCurrentLocale(), decimalDigits: 2);
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      'Initial balance: $valueString',
      name: 'initialBalance',
      desc: 'Initial value in balance widget',
      args: [valueString],
    );
  }

  /// `Total cash out: {value}`
  String totalCashOutBalance(double value) {
    final NumberFormat valueNumberFormat = NumberFormat.simpleCurrency(
        locale: Intl.getCurrentLocale(), decimalDigits: 2);
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      'Total cash out: $valueString',
      name: 'totalCashOutBalance',
      desc: 'Total cash out value in balance widget',
      args: [valueString],
    );
  }

  /// `Total cash in: {value}`
  String totalCashInBalance(double value) {
    final NumberFormat valueNumberFormat = NumberFormat.simpleCurrency(
        locale: Intl.getCurrentLocale(), decimalDigits: 2);
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      'Total cash in: $valueString',
      name: 'totalCashInBalance',
      desc: 'Total cash out value in balance widget',
      args: [valueString],
    );
  }

  /// `Final balance: {value}`
  String finalBalance(double value) {
    final NumberFormat valueNumberFormat = NumberFormat.simpleCurrency(
        locale: Intl.getCurrentLocale(), decimalDigits: 2);
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      'Final balance: $valueString',
      name: 'finalBalance',
      desc: 'Final value in balance widget',
      args: [valueString],
    );
  }

  /// `You don't have documents.`
  String get noDocumentsMessage {
    return Intl.message(
      'You don\'t have documents.',
      name: 'noDocumentsMessage',
      desc: 'The message when selected day has no documents',
      args: [],
    );
  }

  /// `New Post`
  String get newPostTitle {
    return Intl.message(
      'New Post',
      name: 'newPostTitle',
      desc: 'Title form for new document',
      args: [],
    );
  }

  /// `Edit Post`
  String get editPostTitle {
    return Intl.message(
      'Edit Post',
      name: 'editPostTitle',
      desc: 'Title form for editing document',
      args: [],
    );
  }

  /// `Date`
  String get dateFormLabel {
    return Intl.message(
      'Date',
      name: 'dateFormLabel',
      desc: 'Label for date from form',
      args: [],
    );
  }

  /// `Document Type`
  String get typeFormLabel {
    return Intl.message(
      'Document Type',
      name: 'typeFormLabel',
      desc: 'Label for document type from form',
      args: [],
    );
  }

  /// `Document Number`
  String get numberFormLabel {
    return Intl.message(
      'Document Number',
      name: 'numberFormLabel',
      desc: 'Label for document number from form',
      args: [],
    );
  }

  /// `Description`
  String get descriptionFormLabel {
    return Intl.message(
      'Description',
      name: 'descriptionFormLabel',
      desc: 'Label for document description from form',
      args: [],
    );
  }

  /// `Document Value`
  String get valueFormLabel {
    return Intl.message(
      'Document Value',
      name: 'valueFormLabel',
      desc: 'Label for document value from form',
      args: [],
    );
  }

  /// `It's cash in?`
  String get cashInOptionFormLabel {
    return Intl.message(
      'It\'s cash in?',
      name: 'cashInOptionFormLabel',
      desc: 'Label for document if is cash in or out from form',
      args: [],
    );
  }

  /// `Please enter the number of the document`
  String get errorMessageDocumentNumber {
    return Intl.message(
      'Please enter the number of the document',
      name: 'errorMessageDocumentNumber',
      desc: 'The message error for empty number field',
      args: [],
    );
  }

  /// `Please enter some text for description`
  String get errorMessageDocumentDescription {
    return Intl.message(
      'Please enter some text for description',
      name: 'errorMessageDocumentDescription',
      desc: 'The message error for empty description field',
      args: [],
    );
  }

  /// `Please enter a value for the document`
  String get errorMessageDocumentValue {
    return Intl.message(
      'Please enter a value for the document',
      name: 'errorMessageDocumentValue',
      desc: 'The message error for empty value field',
      args: [],
    );
  }

  /// `Delete document`
  String get deleteLabelButton {
    return Intl.message(
      'Delete document',
      name: 'deleteLabelButton',
      desc: 'Label for delete button on document form when is editing',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ro'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
