import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc_boilerplate/constant/enums/enums.dart';

part 'internet_connectivity_state.dart';

class InternetConnectivityCubit extends Cubit<InternetConnectivityState> {

  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetConnectivityCubit({required this.connectivity}) : super(InternetLoading()){
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
          if (connectivityResult == ConnectivityResult.wifi) {
            emitInternetConnected(ConnectionType.wifi);
          } else if (connectivityResult == ConnectivityResult.mobile) {
            emitInternetConnected(ConnectionType.mobile);
          } else if (connectivityResult == ConnectivityResult.none) {
            emitInternetDisconnected();
          }
        });
  }

  void emitInternetConnected(ConnectionType _connectionType) => emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
