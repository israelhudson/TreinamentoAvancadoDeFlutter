class TodoModel {
  String? id;
  late final String title;
  late final bool isDone;

  TodoModel({required this.title, required this.isDone});

  TodoModel.fromMap(Map<String, dynamic> json) {
    title = json['title'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['isDone'] = isDone;
    return data;
  }
}
