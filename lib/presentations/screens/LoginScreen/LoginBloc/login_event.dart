part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class GetLogin extends LoginEvent{

  final User? user;

  GetLogin({this.user});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

