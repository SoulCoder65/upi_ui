import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/models/orientations.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';

import '../Models/userInfo.dart';
//Component
import '../Components/bottomsheet.dart';

class CameraView extends StatefulWidget {
  final Future<UserData> userData;
  CameraView(this.userData);
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with TickerProviderStateMixin {
  bool isStop = false;
  ValueNotifier<double> _zoomNotifier = ValueNotifier(0);
  ValueNotifier<Size> _photoSize = ValueNotifier(null);
  ValueNotifier<double> _zoom = ValueNotifier(0.64);
  ValueNotifier<Sensors> _sensor = ValueNotifier(Sensors.BACK);
  ValueNotifier<CaptureModes> _captureMode = ValueNotifier(CaptureModes.VIDEO);

  VideoController _videoController ;
@override
  void initState() {
  _videoController=VideoController();
    super.initState();
  }
  //SHow Camera Permission
  void showAlert(bool isGranted) {
    if (!isGranted) {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text("Camera Permission"),
                content: Text(
                    "This app needs camera access for Scanning. Go to settings > App Permissions and allow this app to access camera"),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("Deny"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  ElevatedButton(
                    child: Text("Settings"),
                    onPressed: () {
                      AppSettings.openAppSettings().then((value) => {
                            Navigator.pop(context),
                          });
                    },
                  ),
                ],
              ));
    }
  }

  //Record Video
  recordVideo() async {
    setState(() {
      isStop = true;
    });
    await _videoController.recordVideo('THE_IMAGE_PATH/myvideo.mp4');
  }
  stopRecording()async{
    await _videoController.stopRecordingVideo();

  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
        top: screenHeight * 0.23,
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight * 0.5,
              decoration: BoxDecoration(color: Colors.grey),
              child: CameraAwesome(
                testMode: false,
                onPermissionsResult: showAlert,
                onCameraStarted: () {},
                onOrientationChanged: (CameraOrientations newOrientation) {},
                zoom: _zoom,
                orientation: DeviceOrientation.portraitUp,
                sensor: _sensor,
                photoSize: _photoSize,
                captureMode: _captureMode,
                fitted: true,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        recordVideo();
                      },
                      child: Text("Scan and Pay")),
                  ElevatedButton(
                      onPressed: () {
                        modalBottomSheet(context, screenWidth, screenHeight,widget.userData);
                      },
                      child: Text("Pay to Contact")),
                ],
              ),
            )
          ],
        ));
  }
}
