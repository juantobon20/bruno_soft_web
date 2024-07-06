import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/domain.dart';
import '../../../dialogs/dialog.dart';
import '../../../widgets/widgets.dart';
import '../user.dart';
import 'user_data_table_source.dart';

class UserPageDesktop extends StatelessWidget {
  final List<CustomHeaderData> _columns = [
    CustomHeaderData(name: 'Id'),
    CustomHeaderData(name: 'Nombres', canBeOrdered: true),
    CustomHeaderData(name: 'Apellidos', canBeOrdered: true),
    CustomHeaderData(name: 'Identificación'),
    CustomHeaderData(name: 'Teléfono'),
    CustomHeaderData(name: 'Correo'),
    CustomHeaderData(name: 'Estado', canBeOrdered: true),
    CustomHeaderData(name: 'Acciones')
  ];

  UserPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobileDesign();

    return BlocConsumer<UsersViewCubit, UsersViewState>(
      listener: (context, state) {
        if (state.isLoading == LoadingEnum.show && isMobile) {
          showLoadingDialog(context);
        } else if (state.isLoading == LoadingEnum.hide && isMobile) {
          context.pop(context);
        }
      },
      builder: (context, state) {
        return CustomPaginated<UserData>(
          title: 'Usuarios',
          textButton: 'Crear Usuario',
          sortColumnIndex: state.sortColumnIndex,
          sortAscending: state.sortAscending,
          columns: _columns,
          source: UserDataTableSource(users: state.users),
          orderByColumn: context.read<UsersViewCubit>().changeOrder,
        );
      },
    );
  }
}
