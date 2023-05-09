import 'package:cash_log/generated/l10n.dart';
import 'package:cash_log/models/document.dart';

import 'package:flutter/material.dart';

class DocumentRow extends StatelessWidget {
  const DocumentRow({
    super.key,
    required this.document,
    required this.onPressed,
  });

  final Document document;
  final void Function(Document entry) onPressed;

  Text get getFormatedDocumentValueWidget {
    if (document.isCashIn) {
      return Text(
        S.current.documentRowValue(document.value),
      );
    } else {
      return Text(
        S.current.documentRowValue(0 - document.value),
        style: const TextStyle(
          color: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(document.description),
                  Row(
                    children: [
                      Text(document.type.name.toUpperCase()),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(document.number),
                      const Spacer(),
                      getFormatedDocumentValueWidget,
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              color: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.info_outline),
              onPressed: () => onPressed(document),
            ),
          ],
        ),
      ),
    );
  }
}
