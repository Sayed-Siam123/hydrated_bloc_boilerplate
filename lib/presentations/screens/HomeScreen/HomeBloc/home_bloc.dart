import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_boilerplate/data/dataprovider/api_provider.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomePageState>{

  final ApiProvider apiProvider;

  HomeBloc({required this.apiProvider}) : super(HomePageInitState());
  
  Stream<HomePageState> mapEventToState(HomeEvents event) async* {
    if(event is FetchHomeData){

    }

    if(event is GetData){
      //event.id;
    }
  }
}