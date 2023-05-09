import 'package:cash_log/assets/constants/ksize.dart';
import 'package:cash_log/models/document.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DocumentRow extends StatelessWidget {
  const DocumentRow({
    super.key,
    required this.document,
    required this.onPressed,
  });

  final Document document;
  final void Function(Document entry) onPressed;

  Text getFormatedDocumentValueWidget(BuildContext context) {
    if (document.isCashIn) {
      return Text(
        AppLocalizations.of(context)!.documentRowValue(document.value),
      );
    } else {
      return Text(
        AppLocalizations.of(context)!.documentRowValue(0 - document.value),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: KSize.marginHalf,
        right: KSize.marginHalf,
        top: KSize.marginHalf,
      ),
      elevation: KSize.elevationCardDocumentRow,
      child: Padding(
        padding: const EdgeInsets.all(
          KSize.marginThreeQuarters,
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
                        width: KSize.marginMaximum,
                      ),
                      Text(document.number),
                      const Spacer(),
                      getFormatedDocumentValueWidget(context),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: KSize.marginMaximum,
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
