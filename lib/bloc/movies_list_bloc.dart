import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movies_list_event.dart';
part 'movies_list_state.dart';

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  MoviesListBloc() : super(MoviesListInitial()) {
    on<MoviesListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
