import 'package:bmi_plus/colors.dart';
import 'package:bmi_plus/pages/control.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          GenderCard(
            gender: "Female",
            color: KRedColor,
            icon: Icons.female,
            isFmale: true,
          ),
          GenderCard(
            gender: "Male",
            color: KBlueColor,
            icon: Icons.male,
            isFmale: false,
          ),
        ],
      )),
    );
  }
}

class GenderCard extends StatelessWidget {
  String gender;
  Color color;
  IconData icon;
  bool isFmale;
  GenderCard(
      {super.key,
      required this.gender,
      required this.icon,
      required this.color,
      required this.isFmale});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Control(
                      isFemale: isFmale,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            Text(
              gender,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    ));
  }
}
