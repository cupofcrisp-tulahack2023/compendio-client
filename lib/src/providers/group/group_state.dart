part of 'group_bloc.dart';

@immutable
class GroupState {
  final List<Group> groups;

  const GroupState({required this.groups});
}

class GroupInitial extends GroupState {
  const GroupInitial({
    List<Group> groups = const <Group>[],
  }) : super(groups: groups);
}
