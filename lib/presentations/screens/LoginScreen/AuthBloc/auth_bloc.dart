import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_boilerplate/data/Model/User/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with HydratedMixin{
  AuthBloc() : super(UserUnAuthenticate()){

    on<AuthenticatedUser>((event, emit) async{
      if(event is AuthenticatedUser){
        emit(UserAuthenticate(user: event.user));
      }
    });

    on<Logout>((event, emit) async{
      if(event is Logout){
        await clear();
        emit(UserUnAuthenticate());
      }
    });

  }


  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try{
      final user = User.fromJson(json);
      return UserAuthenticate(user: user);

    } catch(e){
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if(state is UserAuthenticate){
      return state.user!.toJson();
    }
    else{
      return null;
    }
  }


}
