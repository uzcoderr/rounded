import 'package:hive/hive.dart';

part 'param.g.dart';

@HiveType(typeId: 0)
class Params{

  @HiveField(0)
  String name;

  @HiveField(1)
  int valuePro;

  @HiveField(2)
  String color;

  @HiveField(3)
  String imageUrl;

  @HiveField(4)
  String isPremium;

  @HiveField(5)
  int id;

  Params({
    required this.name,
    required this.valuePro,
    required this.color,
    required this.imageUrl,
    required this.isPremium,
  required this.id});

}