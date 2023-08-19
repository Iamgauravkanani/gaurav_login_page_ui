import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.greenAccent.withOpacity(0.5)),
      routes: {
        '/': (context) => HomePage(),
        'splash': (context) => SecondScreen(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: FlutterLogin(
        userType: LoginUserType.email,
        // showDebugButtons: true,
        // headerWidget: Container(
        //   height: 200,
        //   width: 200,
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     image: DecorationImage(
        //       image: NetworkImage(
        //           "https://compote.slate.com/images/2f2fc6b0-96b7-4bf7-812a-dcaa8c6ce3d6.gif"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        messages: LoginMessages(),
        logo: NetworkImage(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/640px-WhatsApp.svg.png",
            scale: 0.5),
        //loginAfterSignUp: true,
        //title: "WhatsApp",
        titleTag: "Whatsapp",
        // titleTag: "Welcome to Chat App",
        theme: LoginTheme(),
        onLogin: (LoginData) {
          print("==============================================");
          log("${LoginData.name}");
          log("${LoginData.password}");
          print("==============================================");
          Navigator.pushNamed(context, 'splash');
        },
        onRecoverPassword: (String) {},
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello Welcome to App"),
      ),
    );
  }
}
