import 'package:flutter/material.dart';

import '../../../../configs/config.dart';
import '../../../../domain/domain.dart';
import '../../../presentation.dart';
import '../../../widgets/widgets.dart';

class UserDataTableSource extends DataTableSourceBase<UserData> {
  
  UserDataTableSource({required super.list});

  @override
  DataRow? getRow(int index) {
    final user = list[index];
    
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(tertiaryText(text: user.id.toString(), textColor: CustomColors.primaryText)),
        DataCell(tertiaryText(text: user.firstName, textColor: CustomColors.primaryText)),
        DataCell(tertiaryText(text: user.lastName, textColor: CustomColors.primaryText)),
        DataCell(tertiaryText(text: user.identification, textColor: CustomColors.primaryText)),
        DataCell(tertiaryText(text: user.phone, textColor: CustomColors.primaryText)),
        DataCell(tertiaryText(text: user.email, textColor: CustomColors.primaryText)),
        DataCell(CustomCheckbox(isChecked: user.state)),
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