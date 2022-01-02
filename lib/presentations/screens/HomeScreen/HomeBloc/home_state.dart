import 'package:equatable/equatable.dart';

class HomePageState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomePageInitState extends HomePageState {}
class HomePageLoading extends HomePageState {}
class HomePageLoaded extends HomePageState {
  final List<dynamic>? layer_1;

  HomePageLoaded({this.layer_1});

}
class HomePageListError extends HomePageState {
  final error;
  HomePageListError({this.error});
}