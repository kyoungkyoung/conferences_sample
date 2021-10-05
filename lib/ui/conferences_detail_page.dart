import 'package:conferences/model/conference.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ConferenceDetailPage extends StatelessWidget {
  final Conference conference;

  const ConferenceDetailPage({Key key, this.conference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.lightBlue,
                ));
          },
        ),
        title: Text(
          'Conferences',
          style: TextStyle(
            color: Colors.lightBlue,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                conference.name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox.fromSize(
              size: Size(30, 30),
            ),
            Text(
              conference.location,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox.fromSize(
              size: Size(30, 15),
            ),
            Text(
              new DateFormat.yMMMd()
                      .format(DateTime.parse(conference.start)) +
                  ' ~ ' +
                  new DateFormat.yMMMd()
                      .format(DateTime.parse(conference.end)),
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
