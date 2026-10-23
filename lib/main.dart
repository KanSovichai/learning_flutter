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
      ],
    ),
  );
  final safeArea = SafeArea(child: bodyColumn);
  final homeScreen = Scaffold(body: safeArea);
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
    style: TextStyle(color: Colors.white),
  );
  final keepItGoing = Text(
    'Keep it going!',
    style: TextStyle(color: Colors.white),
  );
  final completeMessage = Text(
    '8 of 12 tasks completed',
    style: TextStyle(color: Colors.white),
  );
  final leftColumnContents = Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [weeklyProgess, keepItGoing, completeMessage],
    ),
  );
  final rowContents = Row(children: [leftColumnContents, Spacer(), progressCircle]);
  final container = Container(
    width: 364,
    height: 150,
    padding: EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.blueAccent,
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
        Text(
            "67%",
            style: TextStyle(
              color:  Colors.white,
              fontSize: 24,
            ),
        ),
      ],
    ),
  );

  return progressCircle;
}
