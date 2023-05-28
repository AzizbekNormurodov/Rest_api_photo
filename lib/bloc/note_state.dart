part of 'note_bloc.dart';

class NoteState extends Equatable {
  final List<PhotoResponse> list;

   const NoteState({required this.list});
  NoteState copyWith({List<PhotoResponse>? list}) {
    return NoteState(list: list ?? this.list);
  }
  @override
  List<Object?> get props => [list];

}