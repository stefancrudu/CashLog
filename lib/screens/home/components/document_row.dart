import 'package:cash_log/assets/constants/core_constants.dart';
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
        '${document.value} lei',
      );
    } else {
      return Text(
        '- ${document.value} lei',
        style: const TextStyle(
          color: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: CoreConstants.marginMinimum,
        right: CoreConstants.marginMinimum,
        top: CoreConstants.marginMinimum,
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(
          CoreConstants.marginThreeQuarters,
        ),
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
                        width: CoreConstants.marginMaximum,
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
              width: CoreConstants.marginMaximum,
            ),
            IconButton(
              color: Theme.of(context).colorScheme.primary,
              icon: CoreConstants.infoIcon,
              onPressed: () => onPressed(document),
            ),
          ],
        ),
      ),
    );
  }
}
