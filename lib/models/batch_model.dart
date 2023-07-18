import 'package:hive/hive.dart';
part 'batch_model.g.dart';

@HiveType(typeId: 1)
class batch_model {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String batch_name;

  @HiveField(2)
  final String semester;

  @HiveField(3)
  final String count;

  @HiveField(4)
  final String lead_name;

  batch_model({
    this.id,
    required this.batch_name,
    required this.semester,
    required this.count,
    required this.lead_name,
  });

  get propertyToSort => null;
}
