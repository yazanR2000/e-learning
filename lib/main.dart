import 'package:e_learning/screens/start.dart';
import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/selected_item_exam.dart';
import './screens/course.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        // scaffoldBackgroundColor: const Color(0xff1E2022),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1E2022),
          titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xffF0F5F9),
              fontFamily: 'Kalam-Bold'),
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xffF0F5F9)),
        ),
        fontFamily: 'Kalam-Bold',
        textTheme: const TextTheme(
          //for questions screen
          bodyText1: TextStyle(
            color: Color(0xffF0F5F9),
            fontSize: 20,
          ),
          bodyText2:
              TextStyle(color: Color(0xff1E2022), fontFamily: 'Poppins-Regular'
                  //fontSize: 20,
                  ),
        ),
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
        dividerColor: const Color(0xffF0F5F9),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: const Color(0xffF0F5F9),
            foregroundColor: const Color(0xff1E2022),
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 25,
            ),
          ),
        ),
      ),
      home: Start(),
      routes: {
        '/selected_item_exam': (context) => SelectedItemExam(),
        '/course': (context) => Course(),
      },
    );
  }
}

// class Splash extends StatelessWidget {
//   const Splash({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//         body: Center(
//       child: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Image.asset('images/quiztime.gif'),
//       ),
//     ));
//   }
// }
