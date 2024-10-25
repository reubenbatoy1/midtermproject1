class Task {
  String title;
  bool isCompleted;
  List<ChecklistItem> checklist;

  Task({
    required this.title,
    this.isCompleted = false,
    List<ChecklistItem>? checklist, // Allow the checklist to be nullable
  }) : checklist = checklist ?? []; // Initialize checklist as an empty list if not provided
}

class ChecklistItem {
  String title;
  bool isCompleted;

  ChecklistItem({required this.title, this.isCompleted = false});
}
