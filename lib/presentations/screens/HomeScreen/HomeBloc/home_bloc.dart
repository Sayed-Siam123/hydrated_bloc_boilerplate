import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc_boilerplate/data/dataprovider/api_provider.dart';

import '../../../../data/Model/HomeDataModel/HomeData.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomePageState> with HydratedMixin{

  final ApiProvider apiProvider;

  HomeBloc({required this.apiProvider}) : super(HomePageInitState()) {
    on<FetchTime>((event, emit) async{
      await Future.delayed(Duration(seconds: 4));
      var time = DateTime.now();
      emit(HomeTimeLoaded(data: HomeData(
        name: "Sayed Siam",
        time: time,
      )));
    });
  }

  @override
  HomePageState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    // TODO: it shows when app getting new data, and it edit previous state data to new state data

    return HomeTimeLoaded(data: HomeData(
      time: DateTime.parse(json["time"].toString()),
      name: json["name"],
    ));

    //throw UnimplementedError();

  }

  @override
  Map<String, dynamic>? toJson(HomePageState state) {
    // TODO: implement toJson
    // TODO: it shows when app start again, and it send my previous state data
    if (state is HomeTimeLoaded) {
      return {
        "time" : state.data!.time.toString(),
        "name" : state.data!.name.toString(),
      };
    }
    return null;
    //throw UnimplementedError();
  }

}