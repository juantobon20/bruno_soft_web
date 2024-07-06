import 'package:flutter/material.dart';

import '../../../configs/config.dart';
import '../widgets.dart';

typedef OrderByColumn<T> = void Function(int columnIndex);

class CustomPaginated<T> extends StatelessWidget {

  final String title;
  final String textButton;
  final int sortColumnIndex;
  final bool sortAscending;
  final List<CustomHeaderData> columns;
  final DataTableSource source;
  final OrderByColumn<T> orderByColumn;
  final VoidCallback? onPressed;

  const CustomPaginated({
    super.key, 
    required this.title,
    required this.textButton,
    required this.sortColumnIndex,
    required this.sortAscending,
    required this.columns, 
    required this.source,
    required this.orderByColumn,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        const SizedBox(width: 16),

        Row(children: [
          const SizedBox(width: 8),

          titleText(text: title),

          const Spacer(),

          PrimaryButton(
            width: 150,
            height: 30,
            text: textButton, 
            onPressedCallback: onPressed
          ),
        ]),

        const SizedBox(height: 8),

        PaginatedDataTable(
          sortColumnIndex: sortColumnIndex > 0 ? sortColumnIndex : null,
          sortAscending: sortAscending,
          columns: columns.map((it) => 
            DataColumn(
              label: secondaryText(
                text: it.name, 
                textColor: CustomColors.primaryText
              ),
              onSort: it.canBeOrdered ? (columnIndex, _) => orderByColumn(columnIndex) : null,
            )
          ).toList(), 
          source: source
        )
      ],
    );
  }
}