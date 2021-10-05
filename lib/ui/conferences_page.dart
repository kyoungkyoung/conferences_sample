import 'dart:convert';

import 'package:conferences/model/conference.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConferencesPage extends StatelessWidget {
  const ConferencesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text('Conferences',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     List<Conferences> list = await fetchList();
            //   },
            //   child: Text('가져오기'),
            // ),
            FutureBuilder<List<Conferences>>(
              future: fetchList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('데이터가 없습니다.');
                } else if (!snapshot.hasData) {
                  return Text('데이터가 없습니다.');
                } else {
                  List<Conferences> list = snapshot.data;
                  return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ...list.map((e) {
                        return Container(
                          margin: EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              onTap: (){},
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

  Future<List<Conferences>> fetchList() async {
    String url =
        'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json';

    final response = await http.get(url);
    Iterable jsonResponse = jsonDecode(response.body);
    List<Conferences> list =
        jsonResponse.map((e) => Conferences.fromJson(e)).toList();
    return list;
  }
}
