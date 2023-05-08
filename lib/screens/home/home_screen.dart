import 'package:cash_log/models/document.dart';
import 'package:cash_log/providers/documents_provider.dart';
import 'package:cash_log/extensions/formated_date.dart';

import 'package:cash_log/screens/form/form_screen.dart';
import 'package:cash_log/screens/home/components/document_row.dart';
import 'package:cash_log/screens/home/components/balance_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  DateTime _filterDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    ref.read(documentsProvider.notifier).loadDocuments(_filterDate);
  }

  void navigateToForm({Document? document, DateTime? dateTime}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FormScreen(
          document: document,
          dateTime: dateTime,
        ),
      ),
    );
  }

  void selectDate() {
    showDatePicker(
      context: context,
      initialDate: _filterDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      setState(() {
        _filterDate = pickedDate ?? _filterDate;
      });
      ref.watch(documentsProvider.notifier).loadDocuments(_filterDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final documents = ref.watch(documentsProvider);

    final homeAppBar = AppBar(
      title: Text(
        _filterDate.toStringDate,
      ),
      actions: [
        IconButton(
          onPressed: selectDate,
          icon: const Icon(Icons.edit_calendar_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.print_outlined),
        ),
        IconButton(
          onPressed: () => navigateToForm(dateTime: _filterDate),
          icon: const Icon(Icons.add),
        ),
      ],
    );

    var listView = ListView.builder(
      itemCount: documents.list.length,
      itemBuilder: (context, index) {
        return DocumentRow(
          document: documents.list[index],
          onPressed: (document) => navigateToForm(document: document),
        );
      },
    );

    return Scaffold(
        appBar: homeAppBar,
        body: Stack(
          children: [
            documents.list.isNotEmpty
                ? listView
                : Center(
                    child:
                        Text(AppLocalizations.of(context)!.noDocumentsMessage),
                  ),
            BalanceWidget(
              balance: documents.balance,
            ),
          ],
        ));
  }
}
