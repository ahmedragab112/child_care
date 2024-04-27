import 'package:hive/hive.dart';

part 'mom_data_model.g.dart';

@HiveType(typeId: 2)
class MomDataMode extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? phoneNumber;
  MomDataMode({this.name, this.phoneNumber});
}
