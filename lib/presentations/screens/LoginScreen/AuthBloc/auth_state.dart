part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

//For authenticate state
class UserAuthenticate extends AuthState {

  final User? user;

  const UserAuthenticate({this.user});

  @override
  List<dynamic> get props => [user];
}


//For Un authenticate state
class UserUnAuthenticate extends AuthState {

  @override
  List<Object> get props => [];
}