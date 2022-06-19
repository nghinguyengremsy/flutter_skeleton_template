import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

///Sembast database
class SembastDataStore {
  ///Construct
  SembastDataStore(this.db);

  ///For Database name, = 'local.db'

  static const appDatabaseName = 'local.db';

  ///Save settings to this store, = 'settings'
  static const settingStore = 'settings';

  ///Default factory database
  static DatabaseFactory dbFactory = databaseFactoryIo;

  ///Database factory for sembast web
  static DatabaseFactory webDbFactory = databaseFactoryWeb;

  ///Databse
  final Database db;

  ///Create default database and return to Sembast data store
  static Future<SembastDataStore> initWithDefaultDatabasename() async {
    //!For web
    if (kIsWeb) {
      return SembastDataStore(
        await webDbFactory.openDatabase(SembastDataStore.appDatabaseName),
      );
    }
    //! For other platforms
    final appDocumentDir = await getApplicationDocumentsDirectory();
    return SembastDataStore(
      await dbFactory.openDatabase(
          '${appDocumentDir.path}/${SembastDataStore.appDatabaseName}'),
    );
  }
}
