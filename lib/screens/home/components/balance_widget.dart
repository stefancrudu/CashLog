import 'package:cash_log/assets/constants/core_constants.dart';
import 'package:cash_log/models/balance.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceWidget extends StatelessWidget {
  Balance balance;

  BalanceWidget({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: CoreConstants.balanceWidgetBottomPosition,
      right: CoreConstants.balanceWidgetRightPosition,
      child: Card(
        margin: const EdgeInsets.all(
          CoreConstants.marginMaximum,
        ),
        color: Theme.of(context).colorScheme.primary,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            CoreConstants.cornerRadius,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: CoreConstants.marginQuarter,
            horizontal: CoreConstants.marginMaximum,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              totalLabel(label: 'Sold inital', value: balance.initialBalance),
              const SizedBox(
                height: CoreConstants.marginMinimum,
              ),
              totalLabel(label: 'Total de incasat', value: balance.totalCashIn),
              const SizedBox(
                height: CoreConstants.marginMinimum,
              ),
              totalLabel(label: 'Total de plata', value: balance.totalCashOut),
              const SizedBox(
                height: CoreConstants.marginMinimum,
              ),
              totalLabel(label: 'Sold final', value: balance.finalBalance)
            ],
          ),
        ),
      ),
    );
  }

  Text totalLabel({required String label, required double value}) {
    return Text(
      '$label :  $value lei',
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
