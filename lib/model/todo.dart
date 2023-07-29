// Todo model
class Todo {
  String title;
  DateTime dateAdded;
  DateTime scheduleDate;
  bool repeat;
  String? note;
  bool isImportant;
  bool isDone;
  String id;

  Todo(
      {required this.title,
      required this.dateAdded,
      required this.scheduleDate,
      this.note,
      this.repeat = false,
      this.isImportant = false,
      this.isDone = false,
      required this.id});

  Todo.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        dateAdded = DateTime.parse(json["dateAdded"]),
        scheduleDate = DateTime.parse(json['scheduleDate']),
        repeat = json['repeat'] ?? false,
        note = json['note'],
        isImportant = json['isImportant'] ?? false,
        id = json['id'],
        isDone = json['isDone'];

  tojson() => {
        'title': title,
        'dateAdded': dateAdded.toIso8601String(),
        "scheduleDate": scheduleDate.toString(),
        "repeat": repeat,
        "note": note,
        "isImmportant": isImportant,
        "isDone": isDone,
        "id": id,
      };
}
