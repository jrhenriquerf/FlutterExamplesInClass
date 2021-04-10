import 'package:flutter_examples/components/Notas.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotasRepository {
  static final NotasRepository _singleton = new NotasRepository();

  factory NotasRepository() {
    return _singleton;
  }

  static _dataBaseManager() async {
    final int versiondb = 1;
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "notas.db");
    var bd = await openDatabase(localDatabase, version: versiondb,
        onCreate: (db, versiondb) {
      String sql =
          "create table notas(id integer primary key, title varchar, description varchar, due_data varchar)";
      db.execute(sql);
    });
    return bd;
  }

  static save(Notas notas) async {
    Database bd = await _dataBaseManager();

    Map<String, dynamic> dadosNota = {
      "title": notas.title,
      "description": notas.description,
      "due_data": notas.date,
    };

    int id = await bd.insert("notas", dadosNota);
    print("salvou $id");
  }

  static Future list() async {
    Database bd = await _dataBaseManager();
    List listaTesultados = await bd.rawQuery("select * from notas");

    var _notas = new List();
    for (var item in listaTesultados) {
      var result =
          new Notas(item['title'], item['description'], item['due_data']);
      result.id = item['id'];
      _notas.add(result);
    }

    return _notas;
  }

  static update(Notas notas) async {
    Database bd = await _dataBaseManager();

    Map<String, dynamic> dadosNota = {
      "title": notas.title,
      "description": notas.description,
      "due_data": notas.date
    };

    bd.update("notas", dadosNota, where: "id = ?", whereArgs: [notas.id]);
  }

  static delete(int notaId) async {
    Database db = await _dataBaseManager();
    return await db.delete('notas', where: 'id = ?', whereArgs: [notaId]);
  }
}
