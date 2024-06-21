part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {
  final String uid;

  const GetUser({required this.uid});

  @override
  List<Object> get props => [uid];
}
