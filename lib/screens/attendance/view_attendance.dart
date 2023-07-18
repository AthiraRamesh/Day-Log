import 'package:flutter/material.dart';
import '../../db/attendance_db/attendancedb.dart';
import 'liststudent_attendance.dart';

class ViewAttendanceScreen extends StatefulWidget {
  final String batch_name;
  const ViewAttendanceScreen({
    super.key,
    required this.batch_name,
  });

  @override
  State<ViewAttendanceScreen> createState() => _ViewAttendanceScreenState();
}

class _ViewAttendanceScreenState extends State<ViewAttendanceScreen> {
  DateTime date = DateTime(2023, 07, 07);
  @override
  Widget build(BuildContext context) {
    String batch_name = widget.batch_name;
    getallattendance(batch_name);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        //title: Text("$batch_name : View Attendance"),
        title: Text(
          "View Attendance",
        ),
   
      ),
      body: const ListAttendanceScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return AddStudentScreen(batch_name: batch_name);
          //     },
          //   ),
          // );
        },
        tooltip: 'Edit Attendance',
        backgroundColor: Color.fromARGB(255, 213, 71, 71),
        child: const Icon(
          //Icons.article_outlined,
          Icons.edit_note_rounded,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
    
  }
}
