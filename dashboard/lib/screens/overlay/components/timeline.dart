import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 235,
        padding: EdgeInsets.all(10),
        height: 60,
        child: Row(
          children: [Icon(Coolicons.calendar)],
        ));
  }
}
