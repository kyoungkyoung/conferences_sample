import 'package:conferences/model/conference.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ConferenceDetailPage extends StatelessWidget {
  final Conference conference;

  const ConferenceDetailPage({Key key, this.conference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Text(
            conference.location.substring(0, 4),
            style: TextStyle(fontSize: 40),
          ),
        ),
        title: Text(
          conference.name,
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              conference.location,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox.fromSize(
              size: Size(30, 15),
            ),
            Text(
              new DateFormat.yMMMd('en_US')
                      .format(DateTime.parse(conference.start)) +
                  ' ~ ' +
                  new DateFormat.yMMMd('en_US')
                      .format(DateTime.parse(conference.end)),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
