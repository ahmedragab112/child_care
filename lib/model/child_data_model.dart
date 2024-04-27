import 'package:hive/hive.dart';

part 'child_data_model.g.dart';

@HiveType(typeId: 1)
class ChildDataModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? age;
  @HiveField(2)
  String? imagePath;
  @HiveField(3)
  bool? isMeal;
  @HiveField(4)
  String? date;
  @HiveField(5)
  String? bloodType;
  @HiveField(6)
  String? fatherName;
  @HiveField(7)
  String? fatherPhone;
  @HiveField(8)
  String? id;
  ChildDataModel(
      {this.name,
      this.age,
      this.imagePath,
      this.isMeal,
      this.date,
      this.bloodType,
      this.fatherName,
      this.fatherPhone,
      this.id});
}
