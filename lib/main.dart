import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/splashscreen.dart';

import 'todoprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MyApp(),
    ),
  );
}





class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.lightBlue[900],
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        title: 'TO_DO_LIST',
        home: Splashscreen()
        // MyHomePage(),
        // home: SecondScreen(),
        );
  }
}
