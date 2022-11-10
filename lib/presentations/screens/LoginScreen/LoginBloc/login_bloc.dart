import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_boilerplate/data/Model/User/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc() : super(LoginInitial()){

    on<GetLogin>((event, emit) async{
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(LoginSuccessful(user: event.user));
    });
  }



}
