import 'package:codes_browser/models/doujin.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DoujinService {
  const DoujinService();
  Future<int> saveDoujin(Doujin doujin) async {
    final Box<Doujin> doujinsBox = await Hive.openBox<Doujin>('doujins');
    return doujinsBox.add(doujin);
  }

  Future<List<Doujin>> getDoujins() async {
    final Box<Doujin> doujinsBox = await Hive.openBox<Doujin>('doujins');
    return doujinsBox.values.toList();
  }

  Future<void> deleteDoujin(Doujin doujin) async {
    final Box<Doujin> doujinsBox = await Hive.openBox<Doujin>('doujins');
    doujinsBox.delete(doujin.key);
  }

  Future<void> updateDoujin(Doujin doujin, dynamic key) async {
    final Box<Doujin> doujinsBox = await Hive.openBox<Doujin>('doujins');
    doujinsBox.put(key, doujin);
  }
}
