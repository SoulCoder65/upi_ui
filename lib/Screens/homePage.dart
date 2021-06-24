import 'package:flutter/material.dart';
import 'package:upi_ui/Models/userInfo.dart';
//Components
import '../Components/input.dart';

import '../Components/cameraView.dart';

//Helpers
import '../Helpers/colors.dart';
import '../Services/fetchdata.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<UserData> userData;
  @override
  void initState() {
    userData=fetchUser();
    super.initState();
  }
  final colorpallete = ColorPallete();
  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(color: Colors.white),
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: colorpallete.textColor,
                    size: 25,
                  )),
              Positioned(
                  top: 10,
                  left: screenWidth * 0.4,
                  child: Text(
                    "Savings",
                    style: TextStyle(
                        color: colorpallete.textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),

              inputField(screenWidth, screenHeight),
              CameraView(userData),

            ],
          ),
        ),
      ),
    );
  }
}
