import 'package:favourite/models/task_model.dart';

class FavroiteRepository {
  Future<List<TaskModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.from(generateitems(10));
  }

  List<TaskModel> generateitems(int num) {
    return List.generate(num,
        (index) => TaskModel(id: index.toString(), name: 'Task  no $index'));
  }
}
