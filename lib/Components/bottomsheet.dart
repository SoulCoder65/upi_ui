import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Helpers
import '../Helpers/colors.dart';
import '../Models/userInfo.dart';

//Colors pallete
final colorpallete = ColorPallete();

void modalBottomSheet(BuildContext context, double screenWidth,
    double screenHeight, Future<UserData> userdata) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        height: screenHeight * 0.5,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search Contact",
                  style: TextStyle(
                      color: colorpallete.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.04),
                ),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: "Select Number",
                          suffixIcon: Icon(Icons.book))),
                ),
                Container(
                    width: screenWidth,
                    height: screenHeight * 0.34,
                    child: FutureBuilder<UserData>(
                      future: userdata,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListTile(
                            horizontalTitleGap: 0.3,
                            leading: CircleAvatar(
                              radius: screenWidth * 0.12,
                              backgroundColor: colorpallete.bgColor,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.12),
                                child: Image.network(
                                  snapshot.data.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(snapshot.data.gender),
                            subtitle: Text(snapshot.data.age.toString()),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ))
              ],
            ),
          ),
        ),
      );
    },
  );
}
