import 'package:flutter/material.dart';

class CoreConstants {
  /// Margins are based roughly on a 4x4 grid.
  static const double marginMinimum = 1;
  static const double marginQuarter = 5;
  static const double marginHalf = 10;
  static const double marginThreeQuarters = 15;
  static const double marginMaximum = 20;

  static const double cornerRadius = 20;

  static const double elevationCardDocumentRow = 2;
  static const double elevationBalanceWidget = 5;

  // Positions for balance widget
  static const double balanceWidgetRightPosition = 0;
  static const double balanceWidgetBottomPosition = 0;

  // Icons
  static const datePickerIcon = Icon(Icons.edit_calendar_outlined);
  static const printIcon = Icon(Icons.print_outlined);
  static const addIcon = Icon(Icons.add);
  static const saveIcon = Icon(Icons.save);
  static const deleteIcon = Icon(Icons.delete_outlined);
  static const infoIcon = Icon(Icons.info_outline);

  // Date for DatePicker
  static final DateTime firstDate = DateTime(2000);
  static final DateTime lastDate = DateTime.now();
}
