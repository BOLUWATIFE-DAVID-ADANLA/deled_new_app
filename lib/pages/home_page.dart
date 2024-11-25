import 'package:deled_new_app/providers/task_provider.dart';
import 'package:deled_new_app/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var currentUser = AuthenticationService().currentUser?.email;
    return Scaffold(
      body:
          //  Consumer<TaskProvider>(
          //   builder: (context, value, child) => ListView.builder(
          //     itemCount: value.tasks.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       var result = value.tasks[index];
          //       return Container(
          //         height: 100,
          //         width: 200,
          //         color: Colors.blue,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(result.taskName),
          //             IconButton(
          //                 onPressed: () {
          //                   Provider.of<TaskProvider>(context, listen: false)
          //                       .removeTask(index);
          //                 },
          //                 icon: const Icon(Icons.delete))
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('$currentUser'),
          ),
          ElevatedButton(
              onPressed: () async {
                await AuthenticationService().signout();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('sign out'))
        ],
      ),
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
                  .addTask(Task(inputText));
              print(inputText);
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Submit"),
          ),
        ],
      );
    },
  );
}
