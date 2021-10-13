import 'dart:convert';

import 'package:conferences/model/conference.dart';
import 'package:conferences/ui/conferences_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConferencesPage extends StatelessWidget {
  const ConferencesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 16.0, top: 60.0),
          child: Text(
            'Conferences',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        FutureBuilder<List<Conference>>(
          future: fetchList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('데이터가 없습니다.');
            } else if (!snapshot.hasData) {
              return Text('데이터가 없습니다.');
            } else {
              List<Conference> list = snapshot.data;
              return ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ...list.map((e) {
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ConferenceDetailPage(conference: e)),
                            );
                          },
                          leading: Icon(Icons.flag),
                          title: Text(e.name),
                          subtitle: Text(
                            e.location,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              );
            }
          },
        )
      ],
    ));
  }

  Future<List<Conference>> fetchList() async {
    String url =
        'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json';

    final response = await http.get(url);
    Iterable jsonResponse = jsonDecode(response.body);
    List<Conference> list =
        jsonResponse.map((e) => Conference.fromJson(e)).toList();
    return list;
  }
}
