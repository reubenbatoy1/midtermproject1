import 'package:flutter/material.dart';
import 'task.dart';
import 'task_details_screen.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management'),
        backgroundColor: Color(0xFF798645), // Set AppBar color
      ),
      body: tasks.isEmpty
          ? Center(child: Text('No tasks added yet!'))
          : GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetailsScreen(
                          task: tasks[index],
                        ),
                      ),
                    ).then((_) => setState(() {})); // Refresh on return
                  },
                  child: Card(
                    elevation: 5,
                    color: Color(0xFFF2EED7), // Change Card color to #F2EED7
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  tasks[index].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF626F47), // Text color for better contrast
                                    decoration: tasks[index].isCompleted
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Color(0xFF626F47)), // Delete icon
                                onPressed: () {
                                  // Call the delete function
                                  deleteTask(index);
                                },
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            tasks[index].checklist.isNotEmpty
                                ? '${tasks[index].checklist.where((item) => item.isCompleted).length}/${tasks[index].checklist.length} Completed'
                                : 'No subtasks',
                            style: TextStyle(
                              color: Color(0xFF626F47), // Text color for better contrast
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen(onAddTask: addTask)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
