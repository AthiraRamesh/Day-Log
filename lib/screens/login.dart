import 'package:flutter/material.dart';
import '../widgets/TextHeading.dart';
import '../widgets/ImageWidgets/Bubbles_image.dart';
import '../widgets/ImageWidgets/Login_image.dart';
import '../widgets/TextField.dart';
import '../widgets/ElevatedButton.dart';
import '../screens/batch/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          BubblesImageWidget(),
          ImageWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  myTextView("Admin Login"),
                  SizedBox(
                     height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  MyTextFormField(
                    controller: email,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  SizedBox(
                     height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  MyTextFormField(
                    controller: password,
                    labelText: 'Password',
                    hintText: 'Confirm Password',
                  ),
                 SizedBox(
                     height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  MyElevatedButton(
                    text: 'Login',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
