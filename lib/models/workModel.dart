import 'package:hive/hive.dart';

part 'workModel.g.dart';

@HiveType(typeId: 1)
class WorkModel{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String minutes;
  @HiveField(2)
  final String discription;
  @HiveField(3)
  final bool done;
  @HiveField(4)
  final double percent;
  @HiveField(5)
  final String dateAdded;

  WorkModel({this.title, this.minutes, this.discription, this.done, this.percent, this.dateAdded});
}