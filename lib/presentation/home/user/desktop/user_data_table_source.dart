import 'package:flutter/material.dart';

import '../../../../configs/config.dart';
import '../../../../domain/domain.dart';
import '../../../widgets/widgets.dart';

class UserDataTableSource extends DataTableSource {

  final List<UserData> users;

  UserDataTableSource({required this.users});

  @override
  DataRow? getRow(int index) {
    final user = users[index];
    
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

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;

}