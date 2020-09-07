import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading...";
  void setupWorldTime() async {
    WorldTime timeInstance = WorldTime(location: 'Berlin',flag:'germany.png',url: 'Europe/Berlin');
    await timeInstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':timeInstance.location,
      'flag':timeInstance.flag,
      'time':timeInstance.time,
      'isDayTime': timeInstance.isDayTime,
    });

  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
