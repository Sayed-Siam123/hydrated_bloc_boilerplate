import 'package:equatable/equatable.dart';

import '../../../../data/Model/HomeDataModel/HomeData.dart';

class HomePageState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
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

class HomeTimeLoading extends HomePageState {}
class HomeTimeLoaded extends HomePageState {
  HomeData? data;
  HomeTimeLoaded({this.data});
}
class HomeTimeLoadingError extends HomePageState {}