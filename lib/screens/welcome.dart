import 'package:flutter/material.dart';
import '../widgets/ElevatedButton.dart';
import './login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(
         height: MediaQuery.of(context).size.height * 0.25,
        ),
        Container(
          child: Column(
            children: [
              Text(
                'BroLog',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              Image.asset(
                'images/Welcome.png',
              ),
              MyElevatedButton(
                text: 'Let\'s get to work! ',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              SizedBox(
               height: MediaQuery.of(context).size.height * 0.04,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
