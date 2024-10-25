import 'package:flutter/material.dart';
import 'task.dart';

class TaskDetailsScreen extends StatefulWidget {
  final Task task;

  TaskDetailsScreen({required this.task});

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final TextEditingController _checklistController = TextEditingController();

  void addChecklistItem() {
    if (_checklistController.text.isNotEmpty) {
      setState(() {
        widget.task.checklist.add(ChecklistItem(title: _checklistController.text));
        _checklistController.clear();
      });
    }
  }

  void toggleChecklistItem(int index) {
    setState(() {
      widget.task.checklist[index].isCompleted = !widget.task.checklist[index].isCompleted;
    });
  }

  void deleteChecklistItem(int index) {
    setState(() {
      widget.task.checklist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Task Details', style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _checklistController,
                    decoration: InputDecoration(
                      hintText: 'Add a new subtask...',
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => addChecklistItem(),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addChecklistItem,
                  child: Text('Add', style: Theme.of(context).textTheme.labelLarge),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.task.checklist.length,
                itemBuilder: (context, index) {
                  final item = widget.task.checklist[index];
                  return Card(
                    color: Theme.of(context).cardColor,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Checkbox(
                        value: item.isCompleted,
                        onChanged: (value) => toggleChecklistItem(index),
                        activeColor: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 18,
                          color: item.isCompleted ? Colors.grey : Theme.of(context).textTheme.bodyLarge?.color,
                          decoration: item.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () => deleteChecklistItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
