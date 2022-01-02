part of 'internet_connectivity_cubit.dart';

abstract class InternetConnectivityState extends Equatable {}




class InternetLoading extends InternetConnectivityState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}




class InternetConnected extends InternetConnectivityState {
  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}




class InternetDisconnected extends InternetConnectivityState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
