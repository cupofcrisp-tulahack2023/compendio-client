import 'package:bloc/bloc.dart';
import 'package:compendio/src/models/group.dart';
import 'package:compendio/src/services/group.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'group_event.dart';

part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final GroupService groupService = GetIt.I<GroupService>();

  GroupBloc() : super(const GroupInitial()) {
    on<NewGroupEvent>((event, emit) async {
      List<Group> groups = await groupService.getGroups();
      emit(GroupState(groups: groups));
    });
  }
}
