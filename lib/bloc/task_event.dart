part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

final class FetchDataEvent extends TaskEvent {}

final class AddFavroiteItemEvent extends TaskEvent {
  final TaskModel currenttask;

  AddFavroiteItemEvent({required this.currenttask});
}
