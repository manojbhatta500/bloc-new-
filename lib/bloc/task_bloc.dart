import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favourite/models/task_model.dart';
import 'package:favourite/repo/favorite_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  FavroiteRepository favroiteRepository;

  List<TaskModel> bloclist = [];

  TaskBloc(this.favroiteRepository) : super(TaskState()) {
    on<FetchDataEvent>(_fetchDataEvent);
    on<AddFavroiteItemEvent>(_addFavroiteItemEvent);
  }

  FutureOr<void> _fetchDataEvent(
      FetchDataEvent event, Emitter<TaskState> emit) async {
    bloclist = await favroiteRepository.fetchItem();
    emit(
        state.copyWith(tasks: List.from(bloclist), status: Liststatus.success));
  }

  FutureOr<void> _addFavroiteItemEvent(
      AddFavroiteItemEvent event, Emitter<TaskState> emit) {
    final index =
        bloclist.indexWhere((element) => element.id == event.currenttask.id);

    bloclist[index] = event.currenttask;
    print(index.toString());
    emit(state.copyWith(tasks: List.from(bloclist)));
  }
}
