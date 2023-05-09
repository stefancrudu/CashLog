import 'package:cash_log/assets/constants/kposition.dart';
import 'package:cash_log/assets/constants/ksize.dart';
import 'package:cash_log/models/balance.dart';
import 'package:cash_log/screens/home/components/balance_row.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BalanceWidget extends StatelessWidget {
  final Balance balance;

  const BalanceWidget({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: KPosition.balanceWidgetBottomPozition,
      right: KPosition.balanceWidgetRightPozition,
      child: Card(
        margin: const EdgeInsets.all(KSize.marginMaximum),
        color: Theme.of(context).colorScheme.primary,
        elevation: KSize.elevationBalanceWidget,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            KSize.cornerRadius,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: KSize.marginThreeQuarters,
            horizontal: KSize.marginMaximum,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BalanceRow(
                content: AppLocalizations.of(context)!
                    .initialBalance(balance.initialBalance),
              ),
              BalanceRow(
                content: AppLocalizations.of(context)!
                    .totalCashInBalance(balance.totalCashIn),
              ),
              BalanceRow(
                content: AppLocalizations.of(context)!
                    .totalCashOutBalance(balance.totalCashOut),
              ),
              BalanceRow(
                content: AppLocalizations.of(context)!
                    .totalCashInBalance(balance.finalBalance),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
