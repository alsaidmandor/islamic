import 'package:hive/hive.dart';

part 'prayer.g.dart';

@HiveType(typeId: 7)
class Prayer {
  @HiveField(0)
  String time;
  @HiveField(1)
  String title;
  @HiveField(2)
  bool selected = false;
  @HiveField(3)
  String status = "upcoming"; // now, upcoming, final

  Prayer(this.time, this.title, this.selected);

  Map<String, dynamic> toJson() => {
        'time': time,
        'title': title,
        'selected': selected,
        'status': status,
      };

  factory Prayer.fromJson(Map<String, dynamic> value) {
    return Prayer(value["time"], value["title"], value["selected"]);
  }
}
