part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginLoading extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccessful extends LoginState{
  final User? user;
  LoginSuccessful({this.user});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}


class LoginUnSuccessful extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
