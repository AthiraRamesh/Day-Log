import 'package:hive/hive.dart';
part 'attendance_model.g.dart';

@HiveType(typeId: 3)
class attendance_model {
 
  // @HiveField(0)
  // int? id;

  @HiveField(0)
  DateTime date;

  //  @HiveField(2)
  // List<dynamic> present;

  // @HiveField(3)
  // List<dynamic> absent;

  attendance_model({
    //this.id, 
    required this.date,
    // required this.present,
    // required this.absent    
  });
}
