
class TodoModel {
  int? id;

  final String name;
  final bool isDone;

  TodoModel({
    this.id,
    required this.name,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }

  static TodoModel fromMap(Map<String, dynamic> map) {
    return TodoModel(
      name: map['name'],
      isDone: map['isDone'],
    );
  }

  @override
  String toString() {
    return 'Fruit {id: $id, name: $name, isDone: $isDone}';
  }

}