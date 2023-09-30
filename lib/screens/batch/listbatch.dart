import 'package:Day_log/db/batch_db/batchdb.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../models/batch_model.dart';
import 'display_batch.dart';

// ignore: must_be_immutable
class ListBatchScreen extends StatefulWidget {
  ListBatchScreen({Key? key}) : super(key: key);

  @override
  State<ListBatchScreen> createState() => _ListBatchScreenState();
}

class _ListBatchScreenState extends State<ListBatchScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: batchListNotifier,
      builder: (context, List<batch_model> batchList, Widget? child) {
        return Material(
          color: Colors.white,
          child: batchList.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    final data = batchList[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color.fromARGB(255, 216, 214, 214),
                            ),
                            child: ListTile(
                              title: Center(
                                child: Text(
                                  data.batch_name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) {
                                      return DisplayBatch(
                                        batch_name: data.batch_name,
                                        semester: data.semester,
                                        count: data.count,
                                        lead_name: data.lead_name,
                                        //phnNumber: data.phnNumber,
                                        index: index,
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: batchList.length,
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Center(
                          child: Lottie.asset(
                            'images/animation_lk7wvj8i.json',
                          ),
                        ),
                      ),
                      // const Text(
                      //   'Data is empty',
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
