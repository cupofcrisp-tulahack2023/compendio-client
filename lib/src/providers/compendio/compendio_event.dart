part of 'compendio_bloc.dart';

@immutable
abstract class CompendioEvent {}

class NewCompendioEvent extends CompendioEvent {
  final String groupName;

  NewCompendioEvent({required this.groupName});
}
