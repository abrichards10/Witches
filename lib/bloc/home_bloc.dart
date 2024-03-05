// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:witch_unite/bloc/home_event.dart';
import 'package:witch_unite/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;

  HomeBloc(this.apiService) : super(InitState()) {
    _handleEvents();
  }

  _handleEvents() {
    on<NewConversationEvent>(newConversationMethod);
  }

  Future<void> newConversationMethod(
      NewConversationEvent event, Emitter<HomeState> emit) async {}
}

class ApiService {}
