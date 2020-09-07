import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Amsterdam',flag:'dutch.png',url: 'Europe/Amsterdam'),
    WorldTime(location: 'Greece',flag:'greece.png',url: 'Europe/Athens'),
    WorldTime(location: 'Istanbul',flag:'turkey.jpg',url: 'Europe/Istanbul'),
    WorldTime(location: 'Berlin',flag:'germany.jpg',url: 'Europe/Berlin'),
  ];

  void updateTime(index) async {
    WorldTime timeInstance = locations[index];
    await timeInstance.getTime();
    Navigator.pop(context, {
      'location':timeInstance.location,
      'flag':timeInstance.flag,
      'time':timeInstance.time,
      'isDayTime': timeInstance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "Choose Location",
          style:TextStyle(color:Colors.white),
        ),
        centerTitle: true,
        elevation: 2.0,
        backgroundColor: Colors.black,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 3.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text('${locations[index].location}'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
