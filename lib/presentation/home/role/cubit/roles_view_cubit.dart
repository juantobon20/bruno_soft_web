import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/domain.dart';
import '../../../presentation.dart';

part 'roles_view_state.dart';

class RolesViewCubit extends Cubit<RolesViewState> {

  final GetRolesUseCase _getRolesUseCase;
  final GetRoleFunctionsUseCase _getRoleFunctionsUseCase;
  final GetRoleCategoriesUseCase _getRoleCategoriesUseCase;

  RolesViewCubit({
    required GetRolesUseCase getRolesUseCase,
    required GetRoleFunctionsUseCase getRoleFunctionsUseCase,
    required GetRoleCategoriesUseCase getRoleCategoriesUseCase
  }) : _getRolesUseCase = getRolesUseCase,
    _getRoleFunctionsUseCase = getRoleFunctionsUseCase,
    _getRoleCategoriesUseCase = getRoleCategoriesUseCase,
    super(const RolesViewState()) {
      _getRoles();
      _getRoleFunctions();
      _getRoleCategories();
    }

  void _getRoles() {
    final role = state.roles;
    emit(state.copyWith(roles: role.copyWith(isLoading: true)));

    ServiceHelper.handleServiceCall(
      serviceCall: () async {
        final List<RoleData> rolesResponse = await _getRolesUseCase.get();

        final DataTableDataBase<RoleData> dataTableDataBase = role.copyWith(
          list: rolesResponse,
          isLoading: false
        );

        emit(state.copyWith(roles: dataTableDataBase));
      }, 
      returnException: (error) {
        emit(state.copyWith(
          roles: role.copyWith(isLoading: false),
          error: error
        ));
      }
    );
  }

  void _getRoleFunctions() {
    final roleFunction = state.roleFunctions;
    emit(state.copyWith(roleFunctions: roleFunction.copyWith(isLoading: true)));

    ServiceHelper.handleServiceCall(
      serviceCall: () async {
        final List<RoleFunctionData> roleFunctionsResponse = await _getRoleFunctionsUseCase.get();

        final DataTableDataBase<RoleFunctionData> dataTableDataBase = roleFunction.copyWith(
          list: roleFunctionsResponse,
          isLoading: false
        );
        
        emit(state.copyWith(roleFunctions: dataTableDataBase));
      }, 
      returnException: (error) {
        emit(state.copyWith(
          roleFunctions: roleFunction.copyWith(isLoading: false),
          error: error
        ));
      }
    );
  }

  void _getRoleCategories() {
    final roleCategory = state.roleCategories;
    emit(state.copyWith(roleCategories: roleCategory.copyWith(isLoading: true)));

    ServiceHelper.handleServiceCall(
      serviceCall: () async {
        final List<RoleCategoryData> roleCategoriesResponse = await _getRoleCategoriesUseCase.get();

        final DataTableDataBase<RoleCategoryData> dataTableDataBase = roleCategory.copyWith(
          list: roleCategoriesResponse,
          isLoading: false
        );

        emit(state.copyWith(
          isLoading: LoadingEnum.hide,
          roleCategories: dataTableDataBase
        ));
      }, 
      returnException: (error) {
        emit(state.copyWith(
          roleCategories: roleCategory.copyWith(isLoading: false),
          error: error
        ));
      }
    );
  }

  void changeOrder(int columnIndex, RolesViewCubitType type) {
    final DataTableDataBase dataTableDataBase;

    switch (type) {
      case RolesViewCubitType.role:
        dataTableDataBase = state.roles;
      case RolesViewCubitType.roleCategory:
        dataTableDataBase = state.roleCategories;
      case RolesViewCubitType.roleFunction:
        dataTableDataBase = state.roleFunctions;
    }

    _updateOrder(columnIndex, dataTableDataBase, type);
  }

  void _updateOrder(int columnIndex, DataTableDataBase dataTableDataBase, RolesViewCubitType type) {
    final sortAscending = columnIndex == dataTableDataBase.sortColumnIndex ? !dataTableDataBase.sortAscending : true;
    final list = dataTableDataBase.list;
    list.sort((a,b) => a.compareByColumn(b, columnIndex) * (sortAscending ? 1 : -1));

    dataTableDataBase = dataTableDataBase.copyWith(
      list: list,
      sortAscending: sortAscending,
      sortColumnIndex: columnIndex
    );

    emit(state.copyWith(
      roles: type == RolesViewCubitType.role ? dataTableDataBase as DataTableDataBase<RoleData> : state.roles,
      roleCategories: type == RolesViewCubitType.roleCategory ? dataTableDataBase as DataTableDataBase<RoleCategoryData> : state.roleCategories,
      roleFunctions: type == RolesViewCubitType.roleFunction ? dataTableDataBase as DataTableDataBase<RoleFunctionData> : state.roleFunctions
    ));
  }
}

enum RolesViewCubitType {
  role,
  roleCategory,
  roleFunction
}
