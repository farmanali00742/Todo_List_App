import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class calendar extends StatefulWidget {
  const calendar({super.key});

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Calendar',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(child: Calendar()),
    );
  }

  Widget Calendar() {
    return Column(
      children: [
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/12345.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: TableCalendar(
                locale: 'en_US',
                rowHeight: 70,
                daysOfWeekHeight: 25,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                  //   withinRangeTextStyle: TextStyle(
                  //       color: Colors.black, fontWeight: FontWeight.w600),
                  //   defaultTextStyle: TextStyle(
                  //       color: Colors.black, fontWeight: FontWeight.w600),
                  defaultTextStyle: TextStyle(fontWeight: FontWeight.w700),
                  weekendTextStyle: TextStyle(fontWeight: FontWeight.w700),
                ),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 03, 14)),
          ),
        )
      ],
    );
  }
}
