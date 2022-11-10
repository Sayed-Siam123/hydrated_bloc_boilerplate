part of 'auth_bloc.dart';


@immutable
abstract class AuthEvent extends Equatable {}


class AuthenticatedUser extends AuthEvent{
  final User? user;

  AuthenticatedUser({this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [user];


}

class Logout extends AuthEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
