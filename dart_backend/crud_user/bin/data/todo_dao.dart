import 'package:sembast/sembast.dart';
import '../config/app_database.dart';
import '../model/todo_model.dart';

class TodoDao {
  static const String FRUIT_STORE_NAME = 'todos';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final _fruitStore = intMapStoreFactory.store(FRUIT_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(TodoModel fruit) async {
    await _fruitStore.add(await _db, fruit.toMap());
    //await _fruitStore.record(1).put(await _db, {'name': 'Table gtgt', 'price': 120});
  }

  Future update(TodoModel fruit) async {
    //For filtering by key (ID), RegEx, greater than, and many other criteria,
    //we use a Finder.
    final finder = Finder(filter: Filter.byKey(fruit.id));
    await _fruitStore.update(
      await _db,
      fruit.toMap(),
      finder: finder,
    );
    //await _fruitStore.record(fruit.id!).update(await _db, fruit.toMap());
  }

  Future delete(id) async {
    final finder = Finder(filter: Filter.byKey(id));
    await _fruitStore.delete(
      await _db,
      finder: finder,
    );
  }

    Future<List<TodoModel>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);

    final recordSnapshots = await _fruitStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Fruit> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final fruit = TodoModel.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      fruit.id = snapshot.key;
      return fruit;
    }).toList();
  }

  Future<TodoModel> getFruitById({required int id}) async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);

    final recordSnapshots = await _fruitStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Fruit> out of List<RecordSnapshot>
    return recordSnapshots
        .map((snapshot) {
          final fruit = TodoModel.fromMap(snapshot.value);
          // An ID is a key of a record from the database.
          fruit.id = snapshot.key;
          return fruit;
        })
        .where((element) => element.id == id)
        .first;
  }
}
