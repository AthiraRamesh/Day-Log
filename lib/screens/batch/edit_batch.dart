import 'package:flutter/material.dart';
import '../../models/batch_model.dart';
import '../../db/batch_db/batchdb.dart';
import '../../widgets/TextField.dart';
import '../../widgets/TextHeading.dart';
import '../../widgets/ElevatedButton.dart';
import 'home.dart';

class EditBatch extends StatefulWidget {
  final String batch_name;
  final String semester;
  final String count;
  final String lead_name;
  //final String phnNumber;
  final int index;

  const EditBatch({
    super.key,
    required this.batch_name,
    required this.semester,
    required this.count,
    required this.lead_name,
    //required this.phnNumber,
    required this.index,
  });

  @override
  State<EditBatch> createState() => _EditBatchState();
}

class _EditBatchState extends State<EditBatch> {
  TextEditingController _nameOfBatch = TextEditingController();
  TextEditingController _semesterOfBatch = TextEditingController();
  TextEditingController _CountOfStudent = TextEditingController();
  TextEditingController _nameOfLead = TextEditingController();
  // TextEditingController _phnOfLead = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameOfBatch = TextEditingController(text: widget.batch_name);
    _semesterOfBatch = TextEditingController(text: widget.semester);
    _CountOfStudent = TextEditingController(text: widget.count);
    _nameOfLead = TextEditingController(text: widget.lead_name);
    // _phnOfLead = TextEditingController(text: widget.phnNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Batch Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            MyTextFormField(
              controller: _nameOfBatch,
              labelText: 'Batch name',
              hintText: 'Enter batch name',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            MyTextFormField(
              controller: _semesterOfBatch,
              labelText: 'Semester',
              hintText: 'Enter Semester',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            MyTextFormField(
              controller: _CountOfStudent,
              labelText: 'Enrollment',
              hintText: 'Enter number of students',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            // myTextView("Batch Leader Details"),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.03,
            // ),
            MyTextFormField(
              controller: _nameOfLead,
              labelText: 'Batch Leader\'s Name',
              hintText: 'Enter Batch Leader\'s name',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            // MyTextFormField(
            //   controller: _phnOfLead,
            //   labelText: 'Mobile Number',
            //   hintText: 'Enter Batch Leader\'s phone number',
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.03,
            // ),
            MyElevatedButton(
              text: 'Save',
              onPressed: () {
                onEditSaveButton(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onEditSaveButton(ctx) async {
    final batchmodel = batch_model(
      batch_name: _nameOfBatch.text,
      semester: _semesterOfBatch.text,
      count: _CountOfStudent.text,
      lead_name: _nameOfLead.text,
      //phnNumber: _phnOfLead.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(30),
        backgroundColor: Colors.black,
        content: Text(
          'Edited',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
    editBatchList(widget.index, batchmodel);
  }
}
