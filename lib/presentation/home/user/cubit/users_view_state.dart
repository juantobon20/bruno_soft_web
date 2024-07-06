part of 'users_view_cubit.dart';

class UsersViewState extends Equatable {

  final LoadingEnum isLoading;
  final List<UserData> users;
  final ErrorData? error;
  final int sortColumnIndex;
  final bool sortAscending;

  const UsersViewState({
    this.isLoading = LoadingEnum.init,
    this.users = const [],
    this.error,
    this.sortColumnIndex = -1,
    this.sortAscending = false
  });

  UsersViewState copyWith({
    LoadingEnum? isLoading,
    List<UserData>? users,
    ErrorData? error,
    int? sortColumnIndex,
    bool? sortAscending
  }) => UsersViewState(
    isLoading: isLoading ?? this.isLoading,
    users: users ?? this.users,
    error: error,
    sortColumnIndex: sortColumnIndex ?? this.sortColumnIndex,
    sortAscending: sortAscending ?? this.sortAscending
  );
  
  @override
  List<Object> get props => [isLoading, users, sortColumnIndex, sortAscending];
}
