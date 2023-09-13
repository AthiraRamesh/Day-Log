import 'package:flutter/material.dart';

class AbsentScreen extends StatefulWidget {
  final List<dynamic> absent;

  AbsentScreen({
    Key? key,
    required this.absent,
  }) : super(key: key);

  @override
  State<AbsentScreen> createState() => _AbsentScreenState();
}

class _AbsentScreenState extends State<AbsentScreen> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> absentData = widget.absent;

    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: absentData.length,
          separatorBuilder: (context, index) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          itemBuilder: (context, index) {
            var item = absentData[index];

            return Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 80.0),
              child: Column(
                children: [SizedBox(
                     height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color.fromARGB(255, 213, 71, 71)
                    ),
                    child: ListTile( 
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 6,
                      ),
                      title: Text(
                        item.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                         
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}