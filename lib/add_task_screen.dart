import 'package:flutter/material.dart';
import 'task.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(Task) onAddTask;
  final TextEditingController titleController = TextEditingController();

  AddTaskScreen({required this.onAddTask});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
        backgroundColor: Color(0xFF798645), // Optional: Set AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Task Title',
                labelStyle: TextStyle(color: Color(0xFF626F47)), // Change label color for readability
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF798645)), // Border color when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF626F47)), // Border color when enabled
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  onAddTask(Task(title: titleController.text));
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Add Task',
                style: TextStyle(color: Colors.white, fontSize: 18), // Increased font size for readability
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF798645), // Button background color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners for the button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
