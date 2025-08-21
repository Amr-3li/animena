// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:animena/features/profile/data/model/user.dart';
import 'package:animena/features/profile/data/repo/get_user_repo.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  final GetUserRepo getUserRepo;
  GetUserCubit(
    this.getUserRepo,
  ) : super(GetUserInitial());
  Future<void> fetchUser(String userId) async {
    emit(GetUserLoading());
    final result = await getUserRepo.getUser(userId);
    result.fold(
      (failure) {
        emit(GetUserError(failure.errMessage));
      },
      (user) {
        emit(GetUserSuccess(user));
      },
    );
  }
}
