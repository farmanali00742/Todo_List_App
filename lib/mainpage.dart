import 'package:flutter/material.dart';
import 'package:to_do_list/calendar.dart';
import 'mycard.dart';
import 'intomain.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[400],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue[400],
        title: Text(
          'Todo Application',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(186, 175, 225, 225),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
                child: Image.asset(
                  'assets/images/1234.jpg',
                  height: 500,
                  width: 4000,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.calendar_month_outlined,
                  size: 30,
                ),
                title: const Text(
                  'Calender',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => calendar()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.account_box,
                  size: 30,
                ),
                title: const Text(
                  'About Developer',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => mycard()));
                },
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.share_sharp,
              //     size: 30,
              //   ),
              //   trailing: Icon(Icons.favorite_border),
              //   onTap: () {},
              // ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.wechat_sharp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.youtube_searched_for_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: intomain(),
    );
  }
}
