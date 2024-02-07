// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String id;
  final String name;
  final bool isDeleting;
  final bool isFavourite;
  const TaskModel(
      {required this.id,
      required this.name,
      this.isDeleting = false,
      this.isFavourite = false});

  TaskModel copyWith({
    String? id,
    String? name,
    bool? isDeleting,
    bool? isFavourite,
  }) {
    return TaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  List<Object> get props => [id, name, isDeleting, isFavourite];
}
