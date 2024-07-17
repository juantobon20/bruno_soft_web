import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/domain.dart';
import '../../../dialogs/dialog.dart';
import '../../../widgets/widgets.dart';
import '../role.dart';
import 'role_categories_data_table_source.dart';
import 'role_functions_data_table_source.dart';
import 'roles_data_table_source.dart';

class RolePageDesktop extends StatelessWidget {

  final List<CustomHeaderData> _columns = [
    CustomHeaderData(name: 'Id', canBeOrdered: true),
    CustomHeaderData(name: 'Nombre', canBeOrdered: true),
    CustomHeaderData(name: 'Estado', canBeOrdered: true),
    CustomHeaderData(name: 'Acciones')
  ];

  final List<CustomHeaderData> _columnsFunctions = [
    CustomHeaderData(name: 'Id', canBeOrdered: true),
    CustomHeaderData(name: 'Codigo', canBeOrdered: true),
    CustomHeaderData(name: 'Descripcion', canBeOrdered: true),
    CustomHeaderData(name: 'CategoriaId'),
    CustomHeaderData(name: 'Categoria', canBeOrdered: true),
    CustomHeaderData(name: 'Acciones')
  ];

  RolePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobileDesign();

    return SingleChildScrollView(
      child: BlocConsumer<RolesViewCubit, RolesViewState>(
        listener: (context, state) {
          if (state.isLoading == LoadingEnum.show && isMobile) {
            showLoadingDialog(context);
          } else if (state.isLoading == LoadingEnum.hide && isMobile) {
            context.pop(context);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomPaginated<UserData>(
                      title: 'Roles',
                      options: [],
                      sortColumnIndex: state.roles.sortColumnIndex,
                      sortAscending: state.roles.sortAscending,
                      columns: _columns,  
                      source: RolesDataTableSource(list: state.roles.list),
                      orderByColumn: (columnIndex) => context.read<RolesViewCubit>().changeOrder(columnIndex, RolesViewCubitType.role),
                      isLoading: state.roles.isLoading,
                      columnSpacing: 28
                    ),
                  ),
                  
                  Expanded(
                    child: CustomPaginated<UserData>(
                      title: 'Categorias',
                      options: [],
                      sortColumnIndex: state.roleCategories.sortColumnIndex,
                      sortAscending: state.roleCategories.sortAscending,
                      columns: _columns,
                      source: RoleCategoriesDataTableSource(list: state.roleCategories.list),
                      orderByColumn: (columnIndex) => context.read<RolesViewCubit>().changeOrder(columnIndex, RolesViewCubitType.roleCategory),
                      isLoading: state.roleCategories.isLoading,
                      columnSpacing: 28
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 800,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomPaginated<UserData>(
                        title: 'Funciones',
                        options: [],
                        sortColumnIndex: state.roleFunctions.sortColumnIndex,
                        sortAscending: state.roleFunctions.sortAscending,
                        columns: _columnsFunctions,
                        source: RoleFunctionsDataTableSource(list: state.roleFunctions.list),
                        orderByColumn: (columnIndex) => context.read<RolesViewCubit>().changeOrder(columnIndex, RolesViewCubitType.roleFunction),
                        isLoading: state.roleFunctions.isLoading,
                        columnSpacing: 42,
                      ),
                    )
                  ],
                ),
              )
              /*Container(
                height: 800,
                child:  
              )*/
            ],
          );
        },
      ),
    );
  }
}