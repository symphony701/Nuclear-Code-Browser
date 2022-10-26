import 'package:codes_browser/models/doujin.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DoujinService {
  Future<int> saveDoujin(Doujin doujin) async {
    final Box<Doujin> doujinsBox = Hive.box<Doujin>('doujins');
    return doujinsBox.add(doujin);
  }

  Future<List<Doujin>> getDoujins() async {
    final Box<Doujin> doujinsBox = Hive.box<Doujin>('doujins');
    return doujinsBox.values.toList();
  }
}
