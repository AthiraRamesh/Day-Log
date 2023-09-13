import 'package:flutter/material.dart';
import './home.dart';
import '../../widgets/ElevatedButton.dart';
import '../../widgets/TextField.dart';
import '../../db/batch_db/batchdb.dart';
import '../../models/batch_model.dart';

class AddBatchScreen extends StatefulWidget {
  const AddBatchScreen({super.key});

  @override
  State<AddBatchScreen> createState() => _AddBatchScreenState();
}

class _AddBatchScreenState extends State<AddBatchScreen> {
  final _nameOfBatch = TextEditingController();
  final _semesterOfBatch = TextEditingController();
  final _CountOfStudent = TextEditingController();
  final _nameOfLead = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add Batch Details"),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            MyTextFormField(
              controller: _nameOfBatch,
              labelText: 'Batch name/ Class name',
              hintText: 'Enter Batch name',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            MyTextFormField(
              controller: _semesterOfBatch,
              labelText: 'Semester/ Standard',
              hintText: 'Enter Semester',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            MyTextFormField(
              controller: _CountOfStudent,
              labelText: 'Enrollment',
              hintText: 'Enter number of students',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            // myTextView("Batch Leader\'s Details"),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.04,
            // ),
            MyTextFormField(
              controller: _nameOfLead,
              labelText: 'Batch Leader\'s Name',
              hintText: 'Enter Batch Leader\'s name',
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.04,
            // ),
            // MyTextFormField(
            //   controller: _phnOfLead,
            //   labelText: 'Phone Number',
            //   hintText: 'Enter Batch Leader\'s phone number',
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            MyElevatedButton(
              text: 'Save',
              onPressed: () {
                onBatchAddButtonClick();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> onBatchAddButtonClick() async {
    final BatchName = _nameOfBatch.text.trim();
    final Semester = _semesterOfBatch.text.trim();
    final Count = _CountOfStudent.text.trim();
    final LeadName = _nameOfLead.text.trim();
    //final Number = _phnOfLead.text.trim();

    if (BatchName.isEmpty ||
            Semester.isEmpty ||
            Count.isEmpty ||
            LeadName.isEmpty
        //|| Number.isEmpty
        ) {
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.black,
          content: Text(
            'Batch Added Successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
    final batch = batch_model(
      batch_name: BatchName,
      semester: Semester,
      count: Count,
      lead_name: LeadName,
      //phnNumber: Number,
    );
    addBatch(batch);
  }
}
