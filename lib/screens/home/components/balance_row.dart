import 'package:cash_log/assets/constants/ksize.dart';
import 'package:flutter/material.dart';

class BalanceRow extends StatelessWidget {
  const BalanceRow({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: KSize.marginMinimum),
      child: Text(
        content,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}
