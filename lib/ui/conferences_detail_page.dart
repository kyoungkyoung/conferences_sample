import 'package:conferences/model/conference.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class ConferenceDetailPage extends StatefulWidget {
  final Conference conference;

  const ConferenceDetailPage({Key key, this.conference}) : super(key: key);

  @override
  State<ConferenceDetailPage> createState() => _ConferenceDetailPageState();
}

class _ConferenceDetailPageState extends State<ConferenceDetailPage> {
  Future<void> _launched;

  @override
  Widget build(BuildContext context) {
    String url = widget.conference.link;
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
                widget.conference.name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox.fromSize(
              size: Size(30, 30),
            ),
            Text(
              widget.conference.location,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox.fromSize(
              size: Size(30, 15),
            ),
            Text(
              new DateFormat.yMMMd().format(DateTime.parse(widget.conference.start)) +
                  ' ~ ' +
                  new DateFormat.yMMMd().format(DateTime.parse(widget.conference.end)),
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () => setState((){
                _launched = _launchInWebViewOrVC(url);
              }),
                // String url = widget.conference.link;
                // if(await canLaunch(url)){
                //   await launch(url, forceWebView: true, forceSafariVC: true);
                // }else{
                //   throw 'Could not launch $url';
                // }
              child: Text(widget.conference.link),
            ),
          ],
        ),
      ),
    );
  }

  launchWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    }
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
