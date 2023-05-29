part of 'note_bloc.dart';

class NoteState extends Equatable {
  final List<AlbomResponse> list;

    NoteState({required this.list});
  NoteState copyWith({List<AlbomResponse>? list}) {
    return NoteState(list: list ?? this.list);
  }
  @override
  List<Object?> get props => [list];

}