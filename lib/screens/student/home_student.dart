import 'package:Daylog/db/student_db/studentdb.dart';
import 'package:flutter/material.dart';
import '../attendance/date_attendance.dart';
import '../batch/home.dart';
import './liststudent.dart';
import './addstudent.dart';

class HomeStudentScreen extends StatefulWidget {
  final String batch_name;
  const HomeStudentScreen({
    super.key,
    required this.batch_name,
  });

  @override
  State<HomeStudentScreen> createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  @override
  Widget build(BuildContext context) {
    String batch_name = widget.batch_name;
    getallstudents(batch_name);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            child: Text("$batch_name : Student Details"),
          ),
        ),
        body: const ListStudentScreen(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddStudentScreen(batch_name: batch_name);
                },
              ),
            );
          },
          tooltip: 'Add Students',
          backgroundColor: Color.fromARGB(255, 213, 71, 71),
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ));
  }
}
