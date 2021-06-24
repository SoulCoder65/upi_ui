import 'package:flutter/material.dart';
//Helpers
import '../Helpers/colors.dart';

//Colors pallete
final colorpallete = ColorPallete();

Widget inputField(double screenWidth,double screenHeight)
{
  return Positioned(
      left: 10,
      top: screenHeight*0.08,
      child: Container(

        width: screenWidth*0.9,
        height: screenHeight * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pay through UPI",
              style: TextStyle(
                  color: colorpallete.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(13),
              child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter UPI Number",

                  )
              ),
            ),

          ],
        ),
      ));
}