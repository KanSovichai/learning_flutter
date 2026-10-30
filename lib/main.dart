import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  final dateText = Text('Saturday, 17 2026');
  final bodyColumn = Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dateText,
        SizedBox(height: 20),
        greetingWidget,
        SizedBox(height: 20),
        progressContainer,
        quickAccessContainer,
      ],
    ),
  );
  final safeArea = SafeArea(child: bodyColumn);
  final homeScreen = Scaffold(
    body: safeArea,
    backgroundColor: const Color.fromARGB(245, 255, 255, 255),
  );
  final app = MaterialApp(home: homeScreen);

  runApp(app);
}

Widget get greetingWidget {
  final helloText = Text(
    'Hello Chai ',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
  );
  final readyText = Text('ready to make progress');
  final alText = Text('AL');

  final column = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [helloText, readyText],
  );
  final spacer = Spacer();
  return Row(children: [column, spacer, alWidget]);
}

Widget get alWidget {
  final alText = Text('AL', style: TextStyle(color: Colors.white));
  final circle = Container(
    width: 50,
    height: 50,
    alignment: Alignment.center,
    decoration: BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
    child: alText,
  );

  return circle;
}

Widget get progressContainer {
  final weeklyProgess = Text(
    'WEEKLY PROGRESS',
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  );
  final keepItGoing = Text(
    'Keep it going!',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  );
  final completeMessage = Text(
    '8 of 12 tasks completed',
    style: TextStyle(color: Colors.white),
  );
  final leftColumnContents = Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        weeklyProgess,
        SizedBox(height: 10),
        keepItGoing,
        completeMessage,
      ],
    ),
  );
  final rowContents = Row(
    children: [leftColumnContents, Spacer(), progressCircle],
  );
  final container = Container(
    width: 379,
    height: 150,
    padding: EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          const Color.fromARGB(255, 114, 0, 254),
          const Color.fromARGB(255, 142, 50, 255),
          const Color.fromARGB(255, 181, 120, 255),
        ],
      ),
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: rowContents,
  );

  return Center(
    child: Row(children: [container], mainAxisSize: MainAxisSize.min),
  );
}

Widget get progressCircle {
  final progressCircle = SizedBox(
    width: 90,
    height: 90,
    child: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 90,
          height: 90,
          child: CircularProgressIndicator(
            value: 0.67,
            strokeWidth: 10,
            backgroundColor: Colors.white.withValues(alpha: 0.3),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        Text("67%", style: TextStyle(color: Colors.white, fontSize: 24)),
      ],
    ),
  );

  return progressCircle;
}

Widget get quickAccessContainer {
  final quickAccessText = Text(
    'Quick access',
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  );
  final seeAll = Text(
    'See all',
    style: TextStyle(
      color: const Color.fromARGB(255, 114, 0, 254),
      fontWeight: FontWeight.bold,
    ),
  );
  final headerRow = Row(children: [quickAccessText, Spacer(), seeAll]);
  final coursesBox = Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    width: 115,
    height: 115,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(88, 179, 117, 255),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Icon(
            Icons.import_contacts_outlined,
            color: const Color.fromARGB(255, 114, 0, 254),
          ),
        ),
        Spacer(),
        Text('Courses'),
      ],
    ),
  );

  final calendarBox = Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    width: 115,
    height: 115,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(86, 255, 183, 68),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Icon(
            Icons.calendar_today_outlined,
            color: const Color.fromARGB(255, 255, 184, 4),
          ),
        ),
        Spacer(),
        Text('Calendar'),
      ],
    ),
  );

  final notesBox = Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    width: 115,
    height: 115,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(88, 179, 117, 255),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Icon(
            Icons.note,
            color: const Color.fromARGB(255, 114, 0, 254),
          ),
        ),
        Spacer(),
        Text('Notes'),
      ],
    ),
  );

  final boxRow = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [coursesBox, calendarBox, notesBox],
  );
  final quickAccessContainer = Container(
    // color: Colors.red,
    padding: EdgeInsets.symmetric(vertical: 20),
    width: 370,
    height: 200,
    child: Column(children: [headerRow, Spacer(), boxRow]),
  );
  return quickAccessContainer;
}

Widget get upcomingTasks {
  final upcomingTasksContainer = Column();
  final upcomingTasksText = Text('Upcoming tasks', style: TextStyle(),);
  final upcomingTasksHeader = Row(children: []);
  return upcomingTasksContainer;
}
