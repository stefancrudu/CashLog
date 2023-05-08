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
      bottom: 0,
      right: 0,
      child: Card(
        margin: const EdgeInsets.all(20.0),
        color: Theme.of(context).colorScheme.primary,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BalanceRow(
                content: AppLocalizations.of(context)!
                    .initialBalance(balance.initialBalance),
              ),
              const SizedBox(
                height: 10,
              ),
              BalanceRow(
                content: AppLocalizations.of(context)!
                    .totalCashInBalance(balance.totalCashIn),
              ),
              const SizedBox(
                height: 10,
              ),
              BalanceRow(
                content: AppLocalizations.of(context)!
                    .totalCashOutBalance(balance.totalCashOut),
              ),
              const SizedBox(
                height: 10,
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
