import 'package:Day_log/db/student_db/studentdb.dart';
import 'package:Day_log/models/student_model.dart';
import 'package:flutter/material.dart';
import '../../widgets/TextHeading.dart';
import '../../widgets/ElevatedButton.dart';
import '../../widgets/TextField.dart';
import './home_student.dart';

class AddStudentScreen extends StatefulWidget {
  final String batch_name;
  AddStudentScreen({
    super.key,
    required this.batch_name,
  });

  @override
  State<AddStudentScreen> createState() => _AddBatchScreenState();
}

class _AddBatchScreenState extends State<AddStudentScreen> {
  final _register = TextEditingController();
  final _nameOfStudent = TextEditingController();
  // final _domain = TextEditingController();
  // final _mobile = TextEditingController();
  // final _gender = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String batch_name = widget.batch_name;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Student Details"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          myTextView("$batch_name"),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            controller: _register,
            labelText: ' Roll Number/ Register Number',
            hintText: "Enter roll number",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          MyTextFormField(
            controller: _nameOfStudent,
            labelText: 'Student Name',
            hintText: 'Enter student name',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          // MyTextFormField(
          //   controller: _domain,
          //   labelText: 'Domain',
          //   hintText: 'Enter domain',
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // MyTextFormField(
          //   controller: _mobile,
          //   labelText: 'Mobile Number',
          //   hintText: 'Enter Mobile Number',
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // MyTextFormField(
          //   controller: _gender,
          //   labelText: 'Gender',
          //   hintText: 'Enter Gender',
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          MyTextFormField(
            controller: _email,
            labelText: 'Email id',
            hintText: 'Enter Email id',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          MyElevatedButton(
            text: 'Save',
            onPressed: () {
              onStudentAddButtonClick();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeStudentScreen(
                          batch_name: batch_name,
                        )),
              );
            },
          ),
        ]),
      ),
    );
  }

  Future<void> onStudentAddButtonClick() async {
    final RegisterNumber = _register.text.trim();
    final StudentName = _nameOfStudent.text.trim();
    // final Domain = _domain.text.trim();
    // final Mobile = _mobile.text.trim();
    // final Gender = _gender.text.trim();
    final Email = _email.text.trim();
    final batch_name = widget.batch_name;

    if (RegisterNumber.isEmpty ||
        StudentName.isEmpty ||
        // Domain.isEmpty ||
        // Mobile.isEmpty ||
        // Gender.isEmpty ||
        Email.isEmpty) {
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.black,
          content: Text(
            'Student Added Successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    final student = student_model(
        register_number: RegisterNumber,
        student_name: StudentName,
        // domain: Domain,
        // mobile: Mobile,
        // gender: Gender,
        email_id: Email,
        batch_name: batch_name,
        isSelected: false,
        id: DateTime.now().millisecondsSinceEpoch.toString());

    addStudent(student);
    _nameOfStudent.clear();
    // _domain.clear();
    // _mobile.clear();
    // _gender.clear();
    _email.clear();
  }
}
