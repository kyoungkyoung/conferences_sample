import 'package:conferences/model/conference.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class ConferenceDetailPage extends StatefulWidget {
  final Conference conference;

  const ConferenceDetailPage({Key? key, required this.conference})
      : super(key: key);

  @override
  State<ConferenceDetailPage> createState() => _ConferenceDetailPageState();
}

class _ConferenceDetailPageState extends State<ConferenceDetailPage> {
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
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.lightBlue,
                ));
          },
        ),
        title: const Text(
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
            Text(
              widget.conference.name,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox.fromSize(
              size: const Size(30, 30),
            ),
            Text(
              widget.conference.location,
              style: const TextStyle(fontSize: 18),
            ),
            SizedBox.fromSize(
              size: const Size(30, 15),
            ),
            Text(
              DateFormat.yMMMd()
                      .format(DateTime.parse(widget.conference.start)) +
                  ' ~ ' +
                  DateFormat.yMMMd()
                      .format(DateTime.parse(widget.conference.end)),
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _launchInWebViewOrVC(url);
              }),
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
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
