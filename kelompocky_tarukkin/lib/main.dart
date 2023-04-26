import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kelompocky_tarukkin/config/constant.dart';
import 'package:kelompocky_tarukkin/firebase_options.dart';
import 'package:kelompocky_tarukkin/helper/login.dart';

// Importing Kelompocky
import 'package:kelompocky_tarukkin/views/dashboard/home.dart';
import 'package:kelompocky_tarukkin/views/auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    isUserLoggedIn();
  }

  isUserLoggedIn() async {
    await LoginHelper.getUserLoggedInStatus().then((value) => {
          if (value != null)
            {
              setState(() {
                _isSignedIn = value;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Constant().primaryColor,
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}
