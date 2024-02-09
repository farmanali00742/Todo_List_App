import 'package:flutter/material.dart';

class mycard extends StatelessWidget {
  const mycard({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(215, 33, 201, 243),
        ),
        body: Container(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(215, 33, 201, 243),
                  Color.fromARGB(219, 107, 182, 181)
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                height: 700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(alignment: Alignment.center),
                    Container(
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/far.jpg'),
                      ),
                    ),
                    Text(
                      'Farman Ali',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Lumanosimo',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      alignment: Alignment.center,
                      child: Text(
                        'FLUTTER DEVELOPER',
                        style: TextStyle(
                          color: Colors.white,
                          //decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 3,
                          decorationColor: Colors.white54,
                          //fontFamily: 'Lumanosimo',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      width: 150,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 45,
                      width: 300,
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.teal,
                          ),
                          SizedBox(width: 25),
                          Text(
                            '+92325 0587394',
                            style: TextStyle(
                              color: Colors.teal,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 45,
                      width: 300,
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.teal,
                          ),
                          SizedBox(width: 22),
                          Text(
                            'farmanali00742@gmail.com',
                            style: TextStyle(
                              color: Colors.teal,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
