import 'package:cash_log/models/document.dart';
import 'package:cash_log/models/balance.dart';

class Documents {
  List<Document> list;
  double initialBalance;

  Balance get balance {
    double totalCashIn = 0;
    double totalCashOut = 0;
    list.asMap().forEach((index, document) {
      if (document.isCashIn) {
        totalCashIn += document.value;
      } else {
        totalCashOut += document.value;
      }
    });
    double balance = initialBalance + totalCashIn - totalCashOut;

    return Balance(initialBalance, totalCashIn, totalCashOut, balance);
  }

  Documents({
    required this.list,
    required this.initialBalance,
  });
}
