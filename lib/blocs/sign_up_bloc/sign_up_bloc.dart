import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:registerapp/models/user/user_model.dart';
import 'package:registerapp/repositories/user/user_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc({
    required UserRepository userRepository
  }) : _userRepository = userRepository, 
      super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcess());
      try {
        UserModel user = await _userRepository.signUp(event.user, event.password);
        await _userRepository.setUser(user);
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure( error: e.toString()));
      }
    });
  }
}
