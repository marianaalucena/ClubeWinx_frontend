import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';

final String profileTable = "profileTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String emailColumn = "emailColumn";
final String phoneColumn = "phoneColumn";
final String imgColumn = "imgColumn";
class ProfileHelper {
  static final ProfileHelper _instance = ProfileHelper.internal();

  factory ProfileHelper() => _instance;

  ProfileHelper.internal();

  Database _db;

  Future<Database> get db async {
    if(_db != null){
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "profilenew.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $profileTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT,"
              "$phoneColumn TEXT, $imgColumn TEXT)"
      );
    });
  }

  Future<Profile> saveProfile(Profile profile) async {
    Database dbProfile = await db;
    profile.id = await dbProfile.insert(profileTable, profile.toMap());
    return profile;
  }

  Future<Profile> getProfile(int id) async {
    Database dbProfile = await db;
    List<Map> maps = await dbProfile.query(profileTable,
        columns: [idColumn, nameColumn, emailColumn, phoneColumn, imgColumn],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if(maps.length > 0){
      return Profile.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteProfile(int id) async {
    Database dbProfile = await db;
    return await dbProfile.delete(profileTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateProfile(Profile profile) async {
    Database dbProfile = await db;
    return await dbProfile.update(profileTable,
        profile.toMap(),
        where: "$idColumn = ?",
        whereArgs: [profile.id]);
  }

  Future<List> getAllProfiles() async {
    Database dbProfile = await db;
    List listMap = await dbProfile.rawQuery("SELECT * FROM $profileTable");
    List<Profile> listProfile = List();
    for(Map m in listMap){
      listProfile.add(Profile.fromMap(m));
    }
    return listProfile;
  }

  Future<int> getNumber() async {
    Database dbProfile = await db;
    return Sqflite.firstIntValue(await dbProfile.rawQuery("SELECT COUNT(*) FROM $profileTable"));
  }

  Future close() async {
    Database dbProfile = await db;
    dbProfile.close();
  }


}

class Profile {

  int id;
  String name;
  String email;
  String phone;
  String img;

  Profile();

  Profile.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img
    };
    if(id != null){
      map[idColumn] = id;
    }
    return map;
  }
  @override
  String toString() {
    return "Profile(id: $id, name: $name, email: $email, phone: $phone, img: $img)";
  }

}