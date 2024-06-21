import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:registerapp/models/user/user_model.dart';
import 'package:registerapp/repositories/user/user_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({required UserRepository userModelRepository
  }) : _userRepository = userModelRepository, 
  super (const UserState.loading()) {
    on<GetUser>((event, emit) async {
      try {
        UserModel myUser = await _userRepository.getUser(event.uid);
        emit(UserState.success(myUser));
      } catch (e) {
        log(e.toString());
          emit(const UserState.failure());
      }
    });
  }
}
