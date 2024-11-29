import 'dart:math';

import 'package:deled_new_app/providers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<TaskProvider>(context, listen: false).listenToTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      body: StreamBuilder(
          stream: taskProvider.fetchTask(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No tasks found.'));
            }

            final tasks = snapshot.data;

            return ListView.builder(
              itemCount: tasks?.length,
              itemBuilder: (BuildContext context, int index) {
                var task = tasks?[index];
                return ListTile(
                  title: Text(task!.taskName),
                  trailing: IconButton(
                      onPressed: () {
                        taskProvider.removeTask(tasks![index].taskid);
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showInputDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// setState

void _showInputDialog(BuildContext context) {
  TextEditingController textController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Enter Text"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Type something..."),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              String inputText = textController.text;

              // Perform your submit action with `inputText`
              Provider.of<TaskProvider>(context, listen: false)
                  .addTask({'taskName': inputText, 'taskid': generateId(20)});
              debugPrint(inputText);
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Submit"),
          ),
        ],
      );
    },
  );
}

String generateId(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  var random = Random();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}
