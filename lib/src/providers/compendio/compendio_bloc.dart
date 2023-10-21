import 'package:bloc/bloc.dart';
import 'package:compendio/src/models/compendio.dart';
import 'package:compendio/src/services/compendio.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'compendio_event.dart';
part 'compendio_state.dart';

class CompendioBloc extends Bloc<CompendioEvent, CompendioState> {
  final CompendioService compendioService = GetIt.I<CompendioService>();

  CompendioBloc() : super(CompendioInitial()) {
    on<NewCompendioEvent>((event, emit) async {
      print("NEW COMPENDIO");
      List<Compendio> comps =
          await compendioService.getGroupCompendios(event.groupName);
      print(comps);
      emit(CompendioState(comps: comps));
    });
  }
}
