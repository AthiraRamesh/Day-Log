import 'package:Day_log/db/student_db/studentdb.dart';
import 'package:Day_log/models/attendance_model.dart';
import 'package:flutter/material.dart';
import '../../db/attendance_db/attendancedb.dart';
import '../../models/student_model.dart';
import 'grah_attendance.dart';

class HomeAttendanceScreen extends StatefulWidget {
  final String batch_name;
  final DateTime selected_date;
  final bool isSelected;

  HomeAttendanceScreen({
    super.key,
    required this.batch_name,
    required this.selected_date,
    this.isSelected = false,
  });

  @override
  State<HomeAttendanceScreen> createState() => _HomeAttendanceScreenState();
}

class _HomeAttendanceScreenState extends State<HomeAttendanceScreen> {
  List<dynamic> absent = [];
  List<dynamic> present = [];

  @override
  Widget build(BuildContext context) {
    String batch_name = widget.batch_name;
    getallstudents(batch_name);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("$batch_name : Attendance"),
      ),
      body: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder: (context, List<student_model> studentList, Widget? _) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final data = studentList[index];

              List<String> names = [];

              for (var student in studentList) {
                names.add(student.student_name);
              }

              return Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Card(
                      // The color depends on this is selected or not
                      color: data.isSelected == true
                          ? Color.fromARGB(255, 213, 71, 71)
                          : Color.fromARGB(255, 117, 198, 120),
                      margin: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            data.register_number,
                            style: TextStyle(
                              fontSize: 16, // Set the desired font size
                              fontWeight: FontWeight
                                  .bold, // Set the desired font weight
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            data.isSelected = !data.isSelected;
                            print(data.isSelected);
                            if (data.isSelected == true) {
                              //red

                              absent.add(data.student_name);
                              present.remove(data.student_name);
                            } else if (data.isSelected == false) {
                              //green
                              absent.remove(data.student_name);
                              present.add(data.student_name);
                            }
                          });
                          print("absent${absent}");
                          print(absent.length);
                          print("present${present}");
                          print(present.length);
                        },
                        title: Center(
                          child: Text(
                            data.student_name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
              );
            },
            itemCount: studentList.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onAttendanceAddButtonClick();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return GraphAttendanceScreen(
                    absent: absent,
                    present: present,
                    batch_name: '${widget.batch_name}');
              },
            ),
          );
        },
        tooltip: 'Save Attendance ',
        backgroundColor: Colors.teal,
        child: const Icon(
          Icons.check,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  popoutfuction(BuildContext context) {
    return Navigator.pop(context);
  }

  Future<void> onAttendanceAddButtonClick() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(20),
        content: Text("Save Attendance Successfully!"),
      ),
    );
    DateTime selected_date = widget.selected_date;
    // List<String> Absent = absent;
    // List<String> Present = present;

    final attendance = attendance_model(date: selected_date
        // absent: Absent,
        // present: Present
        );
    addAttendance(attendance);
  }
}
