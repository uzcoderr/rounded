import 'package:hive/hive.dart';
import 'package:rounded/model/param.dart';


class PremiumControllerDb {

  void save(Params params) {
    var db = Hive.box<Params>("params");
    db.add(params);
  }

  int get() {
    var db = Hive.box<Params>("params");
    print(db.values.length.toString());
    return db.values.length;
  }

}
