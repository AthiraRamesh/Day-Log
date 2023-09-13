import 'package:flutter/material.dart';

class PresentScreen extends StatefulWidget {
  final List<dynamic> present;

  PresentScreen({
    Key? key,
    required this.present,
  }) : super(key: key);

  @override
  State<PresentScreen> createState() => _PresentScreenState();
}

class _PresentScreenState extends State<PresentScreen> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> presentData = widget.present;

    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: presentData.length,
          separatorBuilder: (context, index) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          itemBuilder: (context, index) {
            var item = presentData[index];

            return Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 80.0),
              child: Column(
                children: [SizedBox(
                     height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color:  Color.fromARGB(255, 117, 198, 120),
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
