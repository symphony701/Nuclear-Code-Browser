import 'package:hive/hive.dart';

part 'doujin.g.dart';

@HiveType(typeId: 0)
class Doujin extends HiveObject {
  @HiveField(0)
  final String code;
  @HiveField(1)
  final String tag;
  @HiveField(2)
  final String page;

  Doujin({
    required this.code,
    required this.tag,
    required this.page,
  });
}
