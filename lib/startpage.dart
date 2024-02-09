import 'package:flutter/material.dart';
import 'mainpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String youtubeLink =
      "https://www.youtube.com/watch?v=ZeyZrZ-3mYs"; // Replace with your YouTube video link
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Padding(
          padding:
              EdgeInsets.only(top: 55, left: 7), //const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                      style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all(Colors.blue),
                          // const MaterialStatePropertyAll(Colors.blue),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(300)))),
                      label: const Text(''),
                    ),
                    RichText(
                        text: const TextSpan(
                            text: 'How it ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                            children: [
                          TextSpan(
                              text: 'works',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20))
                        ]))
                  ],
                ),
                Image.asset(
                  'assets/images/1234.jpg',
                  width: 500,
                  height: 375,
                ),
                // const SizedBox(height: 5),
                const Text(
                  'Manage Your',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                //const SizedBox(height: 2),
                const Text(
                  'Everyday Task List',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('A simple tool with mighty benefits. ',
                    style: TextStyle(
                      fontSize: 13,
                    )),
                Text('Stay organized,stay focused,',
                    style: TextStyle(
                      fontSize: 13,
                    )),
                Text('and watch your goals become achievements',
                    style: TextStyle(
                      fontSize: 13,
                    )),
                const SizedBox(
                  height: 45,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen()));
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(163, 104, 199, 231)),
                    fixedSize: MaterialStatePropertyAll(
                      Size(180, 40), // Adjust width and height here
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
