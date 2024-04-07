

import 'package:hive/hive.dart';
part 'history_model.g.dart';

@HiveType(typeId: 0)
class history_model extends HiveObject{

  @HiveField(0)
  String category;

  @HiveField(1)
  String numberResult;

  @HiveField(2)
  String englishResult;

  @HiveField(3)
  String remark;

  @HiveField(4)
  String date;

  @HiveField(5)
  String time;

  history_model({required this.category,required this.numberResult,required this.englishResult,required this.remark,required this.date,required this.time});

}