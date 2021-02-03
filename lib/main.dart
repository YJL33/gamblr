import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gamblr/firebase/user_repository.dart';
import 'package:gamblr/homePage.dart';
import 'package:gamblr/loginPage.dart';

void main() async {
  // Initialize FlutterFire
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final UserRepository _userRepository = UserRepository();

    return FutureBuilder(
      builder: (context, snapshot) {
        // if (snapshot.hasError) {
        //   return SomethingWentWrong(errlog: snapshot.error.toString());
        // }
        return MaterialApp(
          title: 'Gamblr',
          debugShowCheckedModeBanner: false,
          routes: {
            '': (context) => MyHomePage(),
            '/login': (context) => LoginPage(userRepository: _userRepository),
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(title: 'Gamblr Home Page'),
        );
      },
    );
  }

  // SomethingWentWrong({String errlog}) {
  //   return Column(
  //     children: <Widget>[
  //       Text('$errlog'),
  //     ],
  //   );
  // }
}
