import 'package:flutter/material.dart';
import './home.dart';
import '../../widgets/TextHeading.dart';
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
  final _locationOfBatch = TextEditingController();
  final _CountOfStudent = TextEditingController();
  final _nameOfLead = TextEditingController();
  final _phnOfLead = TextEditingController();
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
              labelText: 'Batch name',
              hintText: 'Enter batch name',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            MyTextFormField(
              controller: _locationOfBatch,
              labelText: 'Location',
              hintText: 'Enter location',
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
            myTextView("Batch Leader\'s Details"),
            SizedBox(
               height: MediaQuery.of(context).size.height * 0.04,
            ),
            MyTextFormField(
              controller: _nameOfLead,
              labelText: 'Name',
              hintText: 'Enter Batch Leader\'s name',
            ),
             SizedBox(
               height: MediaQuery.of(context).size.height * 0.04,
            ),
            MyTextFormField(
              controller: _phnOfLead,
              labelText: 'Phone Number',
              hintText: 'Enter Batch Leader\'s phone number',
            ),
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
    final Location = _locationOfBatch.text.trim();
    final Count = _CountOfStudent.text.trim();
    final LeadName = _nameOfLead.text.trim();
    final Number = _phnOfLead.text.trim();

    if (BatchName.isEmpty ||
        Location.isEmpty ||
        Count.isEmpty ||
        LeadName.isEmpty ||
        Number.isEmpty) {
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
      location: Location,
      count: Count,
      lead_name: LeadName,
      phnNumber: Number,
    );
    addBatch(batch);
  }
}
