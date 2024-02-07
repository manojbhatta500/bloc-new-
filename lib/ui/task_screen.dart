import 'package:favourite/bloc/task_bloc.dart';
import 'package:favourite/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    BlocProvider.of<TaskBloc>(context).add(FetchDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task Screen'),
          centerTitle: true,
        ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            switch (state.status) {
              case Liststatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Liststatus.failure:
                return const Text('something went wrong during this process');

              case Liststatus.success:
                return ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final item = state.tasks[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Card(
                          child: ListTile(
                            title: Text(state.tasks[index].name),
                            trailing: IconButton(
                                onPressed: () {
                                  TaskModel mod = TaskModel(
                                      id: item.id,
                                      name: item.name,
                                      isFavourite:
                                          item.isFavourite ? false : true);
                                  BlocProvider.of<TaskBloc>(context).add(
                                      AddFavroiteItemEvent(currenttask: mod));
                                },
                                icon: Icon(item.isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_border)),
                          ),
                        ),
                      );
                    });
            }
          },
        ));
  }
}
