import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/modules/Bmi.dart';
import 'package:flutter_application_1/modules/homescreen.dart';

class buttomnavbar extends StatefulWidget {
  const buttomnavbar({Key key}) : super(key: key);

  @override
  State<buttomnavbar> createState() => _buttomnavbarState();
}

class _buttomnavbarState extends State<buttomnavbar> {
  List<Widget> bodys = [
    BMICalculator(),
    HomeForm(),
    //HomeForm()
  ];
  int idx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: bodys[idx],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          fixedColor: Colors.blueGrey,
          currentIndex: idx,
          onTap: (value) {
            setState(() {
              idx = value;
            });
            print(value);
          },
          items: [
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'personal info',
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
