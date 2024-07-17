part of 'roles_view_cubit.dart';

class RolesViewState extends Equatable {

  final LoadingEnum isLoading;
  final DataTableDataBase<RoleData> roles;
  final DataTableDataBase<RoleFunctionData> roleFunctions;
  final DataTableDataBase<RoleCategoryData> roleCategories;
  final ErrorData? error;
  

  const RolesViewState({
    this.isLoading = LoadingEnum.init,
    this.roles = const DataTableDataBase<RoleData>(),
    this.roleFunctions = const DataTableDataBase<RoleFunctionData>(),
    this.roleCategories = const DataTableDataBase<RoleCategoryData>(),
    this.error
  });

  RolesViewState copyWith({
    LoadingEnum? isLoading,
    DataTableDataBase<RoleData>? roles,
    DataTableDataBase<RoleFunctionData>? roleFunctions,
    DataTableDataBase<RoleCategoryData>? roleCategories,
    ErrorData? error
  }) => RolesViewState(
    isLoading: isLoading ?? this.isLoading,
    roles: roles ?? this.roles,
    roleFunctions: roleFunctions ?? this.roleFunctions,
    roleCategories: roleCategories ?? this.roleCategories,
    error: error
  );

  @override
  List<Object> get props => [ isLoading, roles, roleFunctions, roleCategories ];
}