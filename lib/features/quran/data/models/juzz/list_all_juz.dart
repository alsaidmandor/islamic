import 'package:hive/hive.dart';

import 'juz_list.dart';

part 'list_all_juz.g.dart';

@HiveType(typeId: 9)
class ListAllJuz {
  @HiveField(0)
  final List<JuzList>? juzList;

  ListAllJuz({this.juzList});
}
