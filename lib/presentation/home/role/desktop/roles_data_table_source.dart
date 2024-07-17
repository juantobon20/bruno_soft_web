import 'package:flutter/material.dart';

import '../../../../configs/config.dart';
import '../../../../domain/domain.dart';
import '../../../presentation.dart';
import '../../../widgets/widgets.dart';

class RolesDataTableSource extends DataTableSourceBase<RoleData> {

  RolesDataTableSource({required super.list});

  @override
  DataRow? getRow(int index) {
    final role = list[index];
    
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(tertiaryText(text: role.id.toString(), textColor: CustomColors.primaryText)),
        DataCell(tertiaryText(text: role.name, textColor: CustomColors.primaryText)),
        DataCell(CustomCheckbox(isChecked: role.state)),
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