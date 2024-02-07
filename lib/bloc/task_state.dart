// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

enum Liststatus { loading, success, failure }

class TaskState extends Equatable {
  final List<TaskModel> tasks;

  final Liststatus status;

  TaskState({this.tasks = const [], this.status = Liststatus.loading});

  @override
  List<Object> get props => [tasks, status];

  TaskState copyWith({
    List<TaskModel>? tasks,
    Liststatus? status,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      status: status ?? this.status,
    );
  }
}
