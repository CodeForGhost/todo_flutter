class TodoModel {
  int? id;
  final String title;
  DateTime creationDate;
  bool isChecked;

  TodoModel(
      {this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate': creationDate.toString(),
      'isChecked': isChecked ? 1 : 0,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Todo{id: $id, title: $title, creationDate: $creationDate, isChecked: $isChecked}';
  }
}
