// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static Database? _database;

//   // Open database connection
//   static Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDatabase();
//     return _database!;
//   }

//   // Initialize database
//   static Future<Database> _initDatabase() async {
//     return openDatabase(
//       join(await getDatabasesPath(), 'fobixo.db'),
//       onCreate: (db, version) async {
//         await db.execute(
//           'CREATE TABLE users(id INTEGER PRIMARY KEY, email TEXT, password TEXT)',
//         );
//         // You can create other tables here if needed
//       },
//       version: 1,
//     );
//   }

//   // Insert user into database
//   static Future<int> insertUser(Map<String, dynamic> user) async {
//     final Database db = await database;
//     return await db.insert('users', user, conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   // Retrieve user from database by email
//   static Future<Map<String, dynamic>> getUserByEmail(String email) async {
//     final Database db = await database;
//     final List<Map<String, dynamic>> users = await db.query('users', where: 'email = ?', whereArgs: [email]);
//     if (users.isNotEmpty) {
//       return users.first;
//     } else {
//       throw Exception('User not found');
//     }
//   }

//   // Add other database operations here as needed
// }


// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static Database? _database;

//   static Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDatabase();
//     return _database!;
//   }

//   static Future<Database> _initDatabase() async {
//     return openDatabase(
//       join(await getDatabasesPath(), 'fobixo.db'),
//       onCreate: (db, version) async {
//         await db.execute(
//           'CREATE TABLE Login(id INTEGER PRIMARY KEY, fullName TEXT NOT NULL, dateOfBirth TEXT NOT NULL, education TEXT NOT NULL, address TEXT NOT NULL, city TEXT NOT NULL, selectedCityForCoaching TEXT NOT NULL, whatsappMobileNumber TEXT NOT NULL, email TEXT NOT NULL UNIQUE, password TEXT NOT NULL, schoolOrCollegeName TEXT, interestedIn TEXT NOT NULL)',
//         );
//       },
//       version: 1,
//     );
//   }

//   static Future<int> insertUser(Map<String, dynamic> user) async {
//     final Database db = await database;
//     return await db.insert('Login', user, conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   static Future<Map<String, dynamic>> getUserByEmail(String email) async {
//     final Database db = await database;
//     final List<Map<String, dynamic>> users = await db.query('Login', where: 'email = ?', whereArgs: [email]);
//     if (users.isNotEmpty) {
//       return users.first;
//     } else {
//       throw Exception('User not found');
//     }
//   }
// }


//  import 'package:path/path.dart';
//  import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static Database? _database;

//   static Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDatabase();
//     return _database!;
//   }

//   static Future<Database> _initDatabase() async {
//     return openDatabase(
//       join(await getDatabasesPath(), 'fobixo.db'),
//       onCreate: (db, version) async {
//         await db.execute(
//           'CREATE TABLE Login(id INTEGER PRIMARY KEY, email TEXT NOT NULL UNIQUE, password TEXT NOT NULL)',
//         );
//         await db.execute(
//           'CREATE TABLE Signup(id INTEGER PRIMARY KEY, fullName TEXT NOT NULL, dateOfBirth TEXT NOT NULL, education TEXT NOT NULL, address TEXT NOT NULL, city TEXT NOT NULL, selectedCityForCoaching TEXT NOT NULL, whatsappMobileNumber TEXT NOT NULL, email TEXT NOT NULL UNIQUE, password TEXT NOT NULL, schoolOrCollegeName TEXT, interestedIn TEXT NOT NULL)',
//         );
//       },
//       version: 1,
//     );
//   }

//   static Future<int> insertUser(Map<String, dynamic> user, String tableName) async {
//     final Database db = await database;
//     return await db.insert(tableName, user, conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   static Future<Map<String, dynamic>> getUserByEmail(String email, String tableName) async {
//     final Database db = await database;
//     final List<Map<String, dynamic>> users = await db.query(tableName, where: 'email = ?', whereArgs: [email]);
//     if (users.isNotEmpty) {
//       return users.first;
//     } else {
//       throw Exception('User not found');
//     }
//   }
// }


// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   static Database? _database;

//   DatabaseHelper._privateConstructor();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'your_database.db');
//     return await openDatabase(path, version: 1, onCreate: _createDatabase);
//   }

//   Future<void> _createDatabase(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY,
//         fullName TEXT,
//         dateOfBirth TEXT,
//         education TEXT,
//         address TEXT,
//         city TEXT,
//         selectedCityForCoaching TEXT,
//         whatsappMobileNumber TEXT,
//         email TEXT,
//         password TEXT,
//         schoolOrCollegeName TEXT,
//         interestedIn TEXT
//       )
//     ''');
//   }

//   Future<int> insertUser(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     return await db.insert('users', row);
//   }

//   Future<bool> checkUser(String email, String password) async {
//     Database db = await instance.database;
//     List<Map<String, dynamic>> results = await db.query(
//       'users',
//       where: 'email = ? AND password = ?',
//       whereArgs: [email, password],
//     );
//     return results.isNotEmpty;
//   }
// }

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   static Database? _database;

//   DatabaseHelper._privateConstructor();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'your_database.db');
//     return await openDatabase(path, version: 1, onCreate: _createDatabase);
//   }

//   Future<void> _createDatabase(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY,
//         fullName TEXT,
//         dateOfBirth TEXT,
//         education TEXT,
//         address TEXT,
//         city TEXT,
//         selectedCityForCoaching TEXT,
//         whatsappMobileNumber TEXT,
//         interestedIn TEXT
//       )
//     ''');
//   }

//   Future<int> insertUser(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     return await db.insert('users', row);
//   }

//   Future<bool> checkUser(String email, String password) async {
//     Database db = await instance.database;
//     List<Map<String, dynamic>> results = await db.query(
//       'users',
//       where: 'email = ? AND password = ?',
//       whereArgs: [email, password],
//     );
//     return results.isNotEmpty;
//   }
// }

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   static Database? _database;

//   DatabaseHelper._privateConstructor();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'your_database.db');
//     return await openDatabase(path, version: 1, onCreate: _createDatabase);
//   }

//   Future<void> _createDatabase(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY,
//         fullName TEXT,
//         dateOfBirth TEXT,
//         education TEXT,
//         address TEXT,
//         city TEXT,
//         selectedCityForCoaching TEXT,
//         whatsappMobileNumber TEXT,
//         interestedIn TEXT
//       )
//     ''');
//   }

//   Future<int> insertUser(Map<String, dynamic> row) async {
//     // Insert user into local database
//     Database db = await instance.database;
//     int userId = await db.insert('users', row);

//     // Send user data to server
//     try {
//       var response = await http.post(
//         Uri.parse('https://your-server-url.com/signup'),
//         body: jsonEncode(row),
//         headers: {'Content-Type': 'application/json'},
//       );
//       if (response.statusCode == 200) {
//         print('User data sent to server successfully');
//       } else {
//         print('Failed to send user data to server');
//       }
//     } catch (e) {
//       print('Error sending user data to server: $e');
//     }

//     return userId;
//   }

//   Future<bool> checkUser(String email, String password) async {
//     Database db = await instance.database;
//     List<Map<String, dynamic>> results = await db.query(
//       'users',
//       where: 'email = ? AND password = ?',
//       whereArgs: [email, password],
//     );
//     return results.isNotEmpty;
//   }
// }
