import 'package:flutter/material.dart';

import 'absent.dart';
import 'date_attendance.dart';
import 'present.dart';

class AttendanceStatus extends StatefulWidget {
  final String batch_name; 
  final List<dynamic> absent;
  final List<dynamic> present;

  AttendanceStatus({
    Key? key,
    required this.batch_name,
    required this.absent,
    required this.present,
  }) : super(key: key);

  @override
  State<AttendanceStatus> createState() => _AttendanceStatusState();
}

class _AttendanceStatusState extends State<AttendanceStatus> {
  int _selectedScreenIndex = 0;
  List<Map<String, dynamic>> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      {"screen": PresentScreen(present: widget.present), "title": "Present "},
      {"screen": AbsentScreen(absent: widget.absent), "title": "Absentees"}
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DateAttendanceScreen(
                        batch_name: '${widget.batch_name}'),
                ),
              );
            },
          ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(_screens[_selectedScreenIndex]["title"] as String),  
      ),
      body: _screens[_selectedScreenIndex]["screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Present '),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: "Absentees")
        ],
      ),
    );
  }
}
