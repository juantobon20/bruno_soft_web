import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/domain.dart';

part 'users_view_state.dart';

class UsersViewCubit extends Cubit<UsersViewState> {

  final GetUsersUseCase _getUsersUseCase;

  UsersViewCubit({
    required GetUsersUseCase getUsersUseCase
  }) : _getUsersUseCase = getUsersUseCase,
    super(const UsersViewState()) {
      _getUsers();
    }

  void _getUsers() {
    emit(state.copyWith(isLoading: LoadingEnum.show));

    ServiceHelper.handleServiceCall(
      serviceCall: () async {
        final List<UserData> usersResponse = await _getUsersUseCase.getUsers();
        emit(state.copyWith(
          isLoading: LoadingEnum.hide,
          users: usersResponse
        ));
      }, 
      returnException: (error) {
        emit(state.copyWith(
          isLoading: LoadingEnum.hide,
          error: error
        ));
      }
    );
  }

  void changeOrder(int columnIndex) {
    final sortAscending = columnIndex == state.sortColumnIndex 
        ? !state.sortAscending : true;

    final users = state.users;
    users.sort((a,b) => a.compareByColumn(b, columnIndex) * (sortAscending ? 1 : -1));

    emit(state.copyWith(
      sortAscending: sortAscending,
      sortColumnIndex: columnIndex,
      users: users
    ));
  }
}
