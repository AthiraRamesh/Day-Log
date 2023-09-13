import 'dart:io';

import 'package:flutter/material.dart';
import './addbatch.dart';
import './listbatch.dart';
import '../../db/batch_db/batchdb.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    getallbatches();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            exit(0);
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Batches"),
      ),
      body: ListBatchScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddBatchScreen();
              },
            ),
          );
        },
        tooltip: 'Add batches',
        backgroundColor: Color.fromARGB(255, 213, 71, 71),
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
