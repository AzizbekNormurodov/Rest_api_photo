
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_photo/model/albom_response.dart';

import '../network/api_client.dart';
part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent,NoteState> {
  NoteBloc () : super (NoteState(list: [])) {
    on<NoteNetworkEvent>(netWork);
  }

  // Future<void> netWork(NoteNetworkEvent event, Emitter<NoteState> emit)  async {
  // final response = await ApiClient.initance.getPhotos();
  //   emit(state.copyWith(list: response??[]));
  //
  // }
 Future<void> netWork(NoteNetworkEvent event, Emitter<NoteState> emit) async {
    final response = await ApiClient.initance.getAlbom();
    emit(state.copyWith(list: response ?? []));
 }
}