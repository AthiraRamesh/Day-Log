import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../widgets/ElevatedButton.dart';

import 'attendance_status.dart';
import 'date_attendance.dart';

class GraphAttendanceScreen extends StatefulWidget {
  final List<dynamic> absent;
  final List<dynamic> present;
  final String batch_name;
  GraphAttendanceScreen({
    super.key,
    required this.absent,
    required this.present,
    required this.batch_name,
  });

  @override
  State<GraphAttendanceScreen> createState() => _GraphAttendanceScreenState();
}

class _GraphAttendanceScreenState extends State<GraphAttendanceScreen> {
  // final String batch_name;
  @override
  Widget build(BuildContext context) {

   

    List<dynamic> absent_list = widget.absent;
    double absent_length = absent_list.length.toDouble();
  
     List<dynamic> present_list = widget.present;
    double present_length = present_list.length.toDouble();
  
    Map<String, double> dataMap = {
      "Present": present_length,
      "Absent": absent_length,
      
    };
    //String batch_name = batch_name;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading: IconButton(
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
        title: Text("Pie Chart - Attendance"),
        automaticallyImplyLeading: false,
        
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Container(
            child: Center(
              child: PieChart(
                dataMap: dataMap,
                chartRadius: MediaQuery.of(context).size.width / 1.7,
                legendOptions: LegendOptions(legendPosition: LegendPosition.bottom),
                chartValuesOptions:
                    ChartValuesOptions(showChartValuesInPercentage: true),
              ),
            ),
          ),  
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          MyElevatedButton(
              text: 'View Attendance',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AttendanceStatus(present:present_list,absent: absent_list,
                          batch_name: '${widget.batch_name}')),
                );
              },
            ),
        ],
      ),
    );
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
    //return Navigator.pop(context);
    //return Navigator.pushNamed(context, '/home');
  }
}
