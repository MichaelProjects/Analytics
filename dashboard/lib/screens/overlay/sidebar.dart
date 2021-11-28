import 'package:dashboard/model/application.dart';
import 'package:dashboard/screens/overlay/components/app_details.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var app = Application(
        name: "Stackblog",
        packageId: "io.stackblog",
        isIos: true,
        isAndroid: true);

    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: 225,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [Appdetails(app)],
        ));
  }
}
