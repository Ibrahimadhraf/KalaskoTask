import 'package:flutter_task/model/data_modle.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableCardRecord = 'TestTaskDataBase';
final String columnValue = 'value';
final String columnRecordKey = 'key';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper db = DatabaseHelper._();
  static Database? _dataBase;


  RxList<DataModel> allRecords = RxList();
  RxBool isGettingAllRecords = RxBool(false);


  Future<Database> get datatBase async {
    if (_dataBase != null) return _dataBase!;
    _dataBase = await initDb();
    return _dataBase!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CardRecord.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(''' 
           CREATE TABLE $tableCardRecord (
           $columnValue TEXT NOT NULL,
              $columnRecordKey Text NOT NULL)
           ''');
    });
  }

  Future getAllRecords() async {
    isGettingAllRecords.value = true;
    var dbClient = await datatBase;

    List<Map<String, dynamic>> maps = await dbClient.query(tableCardRecord);

    print('\n\n\n maps  $maps\n\n\n');

    List<DataModel> list = maps.isNotEmpty ? maps.map((map) => DataModel.fromJson(map)).toList() : [];
    print('\n\n\n list  $list\n\n\n');

    allRecords.value = list;
    isGettingAllRecords.value = false;
  }

  /// for creating a new record with specific key
  inset(DataModel? model) async {
    var dbClient = await datatBase;
    print('\n\n\n model!.toJson()  ${model!.toJson()}\n\n\n');
    await dbClient.insert(tableCardRecord, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace).then((value) => getAllRecords());
  }

  /// for updating exists values with specific key
  updateRecord(DataModel? model) async {
    var dbClient = await datatBase;
    return await dbClient.update(tableCardRecord, model!.toJson(), where: '$columnRecordKey=?', whereArgs: [model.key]).then((value) => getAllRecords());
  }


  /// for dropping existing DataStore
  dropRecord() async {
    var dbClient = await datatBase;
    return await dbClient.delete(tableCardRecord, where: '$columnRecordKey=?',).then((value) => getAllRecords());
  }




  /// for updating exists values with specific key
  deleteRecord(String? valueForDeletion) async {
    var dbClient = await datatBase;
    return await dbClient.rawDelete('DELETE FROM $tableCardRecord WHERE $columnRecordKey = ?', [valueForDeletion]).then((value) => getAllRecords());
  }
}
