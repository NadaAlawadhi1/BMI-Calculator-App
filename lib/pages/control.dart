import 'package:bmi_plus/colors.dart';
import 'package:bmi_plus/pages/result.dart';
import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  bool isFemale;

  Control({super.key, required this.isFemale});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  int weight = 30;
  int height = 145;
  @override
  Widget build(BuildContext context) {
    Color kMainColor = widget.isFemale ? KRedColor : KBlueColor;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 40),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: kMainColor,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "BMI",
                                style:
                                    TextStyle(color: kMainColor, fontSize: 25),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                widget.isFemale ? "Female" : "Male",
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(
                                widget.isFemale ? Icons.female : Icons.male,
                                color: kMainColor,
                                size: 70,
                              ),
                              Text(
                                "Weight (KG)",
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            int i = (index + 5) * 5;
                            return Padding(
                              padding: const EdgeInsets.all(12),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      weight = i;
                                    });
                                  },
                                  child: Center(
                                      child: Text(
                                    "$i",
                                    style: TextStyle(
                                        fontSize: weight == i ? 25 : 15,
                                        color: weight == i
                                            ? kMainColor
                                            : Colors.black),
                                  ))),
                            );
                          },
                        ))
                      ],
                    ))),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(color: kMainColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 40,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Height \n (CM)",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                  child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: 30,
                                itemBuilder: (context, index) {
                                  int i = (index + 25) * 5;
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 12),
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            height = i;
                                          });
                                        },
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            decoration: BoxDecoration(
                                                color: height == i
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Center(
                                                child: Text(
                                              "$i",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: height == i
                                                      ? kMainColor
                                                      : Colors.white),
                                            )))),
                                  );
                                },
                              ))
                            ],
                          ),
                        ))),
              ],
            ),
            Positioned(
                bottom: 0,
                left: MediaQuery.sizeOf(context).width * 2 / 3 - 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      foregroundColor: Colors.black,
                      backgroundColor: KYelloColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                  height: height,
                                  weight: weight,
                                  isFemale: widget.isFemale)));
                    },
                    child: Text("Calc")))
          ],
        ),
      ),
    );
  }
}
