part of 'compendio_bloc.dart';

@immutable
class CompendioState {
  final List<Compendio> comps;

  const CompendioState({required this.comps});
}

class CompendioInitial extends CompendioState {
  const CompendioInitial({
    List<Compendio> comps = const <Compendio>[],
  }) : super(comps: comps);
}
