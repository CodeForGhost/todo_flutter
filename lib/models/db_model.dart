import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/todo_model.dart';

class DatabaseConnect {
  Database? _database;

  // create a getter and open a connection to database
  Future<Database> get database async {
    // this is the location of our database in device. ex - data/data/...
    final dbPath = await getDatabasesPath();

    // this the name of our database
    const dbName = 'todo.db';

    // this joins the dbPath and dbName and creates a full path for database
    // ex/data/data/todo.db
    final path = join(dbPath, dbName);

    // open the connection
    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

// the create db function
// this creates tables in our database
  Future<void> _createDB(Database db, int version) async {
    // make sure the columns we create in our table match the todo_model field
    await db.execute('''
        CREATE TABLE todo(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          creationDate TEXT,
          isChecked INTEGER)
        ''');
  }

  // function to add into our database
  Future<void> insertTodo(TodoModel todo) async {
    // get the connection to database
    final db = await database;
    // insert the todo
    await db.insert(
      'todo', // the name of our table
      todo.toMap(), // the function we created in our todo model
      conflictAlgorithm:
          ConflictAlgorithm.replace, // this will replace the duplicate entry
    );
  }

  // function to delete a todo from our database
  Future<void> deleteTodo(TodoModel todo) async {
    final db = await database;
    // delete a todo from database based on it's id
    await db.delete(
      'todo',
      where: 'id== ?',
      whereArgs: [todo.id],
    );
  }

  // function fetch all the todo from our database
  Future<List<TodoModel>> getTodo() async {
    final db = await database;
    // query the database and save the todo as list of maps
    List<Map<String, dynamic>> items =
        await db.query('todo', orderBy: 'id DESC');

    // now convert the items form lists of maps to list of todo
    return List.generate(
      items.length,
      (i) => TodoModel(
          id: items[i]['id'],
          title: items[i]['title'],
          creationDate: DateTime.parse(items[i]['creationDate']),
          isChecked: items[i]['isChecked'] == 1 ? true : false),
    );
  }
}
