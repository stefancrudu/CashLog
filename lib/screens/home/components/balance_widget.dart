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
              totalLabel(label: 'Sold inital', value: balance.initialBalance),
              const SizedBox(
                height: 10,
              ),
              totalLabel(label: 'Total de incasat', value: balance.totalCashIn),
              const SizedBox(
                height: 10,
              ),
              totalLabel(label: 'Total de plata', value: balance.totalCashOut),
              const SizedBox(
                height: 10,
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
