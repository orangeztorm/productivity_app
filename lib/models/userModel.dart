import 'package:hive/hive.dart';

part 'userModel.g.dart';

@HiveType(typeId: 2)
class UserModel extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String seen;

  UserModel({this.name, this.image, this.seen});
}