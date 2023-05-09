import 'package:flutter/material.dart';

class BalanceRow extends StatelessWidget {
  const BalanceRow({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(color: Colors.white),
    );
  }
}
