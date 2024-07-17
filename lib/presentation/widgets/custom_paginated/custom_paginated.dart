import 'package:flutter/material.dart';

import '../../../configs/config.dart';
import '../../presentation.dart';
import '../widgets.dart';

typedef OrderByColumn<T> = void Function(int columnIndex);

class CustomPaginated<T> extends StatelessWidget {

  final String title;
  final List<Widget> options;
  final bool isLoading;
  final int sortColumnIndex;
  final int rowsPerPage;
  final bool sortAscending;
  final double columnSpacing;
  final List<CustomHeaderData> columns;
  final DataTableSource source;
  final OrderByColumn<T> orderByColumn;
  final VoidCallback? onPressed;

  const CustomPaginated({
    super.key, 
    required this.title,
    required this.options,
    required this.sortColumnIndex,
    required this.sortAscending,
    required this.columns, 
    required this.source,
    required this.orderByColumn,
    this.isLoading = false,
    this.rowsPerPage = 5,
    this.columnSpacing = 56,
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

          for (var option in options) ...[
            option,

            const SizedBox(width: 8)
          ]
        ]),

        const SizedBox(height: 8),

        Stack(
          alignment: Alignment.topCenter,
          children: [
            PaginatedDataTable(
              sortColumnIndex: sortColumnIndex >= 0 ? sortColumnIndex : null,
              columnSpacing: columnSpacing,
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
              rowsPerPage: rowsPerPage,
              source: source
            ),

            if (isLoading)
              const CustomCircularProgressDialog(),
          ],
        )
      ],
    );
  }
}