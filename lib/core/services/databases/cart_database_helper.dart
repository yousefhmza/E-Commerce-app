import 'dart:io';

import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._privateConstructor();

  static final CartDatabaseHelper instance =
      CartDatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "cartProduct.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableCartProduct (
    id INTEGER PRIMARY KEY,
    $columnProductID TEXT,
    $columnName TEXT,
    $columnImage TEXT,
    $columnPrice TEXT,
    $columnQuantity INTEGER
    )   
    ''');
  }

  Future<int> insertData(CartProductModel cartModel) async {
    Database db = await instance.database;
    return await db.insert(
      tableCartProduct,
      cartModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CartProductModel>> getData() async {
    Database db = await instance.database;
    List<Map> maps = await db.query(tableCartProduct);

    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((element) => CartProductModel.fromJson(element)).toList()
        : [];
    return list;
  }

  Future<int> updateData(CartProductModel cartProductModel) async {
    Database db = await instance.database;
    return await db.update(
      'cartProduct',
      cartProductModel.toJson(),
      where: '$columnProductID = ?',
      whereArgs: [cartProductModel.productID],
    );
  }
}
