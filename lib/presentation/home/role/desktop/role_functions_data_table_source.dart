import 'package:flutter/material.dart';

import '../../../../configs/config.dart';
import '../../../../domain/domain.dart';
import '../../../presentation.dart';
import '../../../widgets/widgets.dart';

class RoleFunctionsDataTableSource extends DataTableSourceBase<RoleFunctionData> {

  RoleFunctionsDataTableSource({required super.list});

  @override
  DataRow? getRow(int index) {
    final role = list[index];
    
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(tertiaryText(text: role.id.toString(), textColor: CustomColors.primaryText)),
        DataCell(tertiaryText(text: role.code, textColor: CustomColors.primaryText)),
        DataCell(tertiaryText(text: role.description, textColor: CustomColors.primaryText)),
        DataCell(tertiaryText(text: role.roleCategoryId.toString(), textColor: CustomColors.primaryText)),
        DataCell(tertiaryText(text: role.roleCategoryName, textColor: CustomColors.primaryText)),
        DataCell(
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {},
          )
        )
      ]
    );
  }
}