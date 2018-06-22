import 'dart:async';

import 'package:flutter/material.dart';

class Data {
  static Future<List<String>> mockFuture() async {
    await Future.delayed(Duration(milliseconds: 500), () {});
    return [
      'https://swebtoon-phinf.pstatic.net/20180115_46/1515982322405V9H8X_JPEG/10_EC8DB8EB84A4EC9DBC_ipad.jpg',
      'https://swebtoon-phinf.pstatic.net/20151006_293/1444125151125BQylv_JPEG/_EB93BBEB80AF_EBA38CEABCA5_E29587EABCB1_EB9384EB84B0_ipa.jpg',
      'https://swebtoon-phinf.pstatic.net/20150608_183/1433732708022aySQw_JPEG/EC8DB8EB84A4EC9DBC_ipad.jpg',
      'https://pm1.narvii.com/5905/aab79b9fbf033cb116e1272460d9b900692e672b_hq.jpg',
      'https://pm1.narvii.com/5905/92822c13952a7c280b49b9507599aabe695b5933_hq.jpg',
      'https://pm1.narvii.com/5905/30ed9dd47001fbd89cef61e58b0121611ed30b69_hq.jpg',
      'https://pm1.narvii.com/5905/25c1ca23b78b9ca78aeb9d02fae841707fc4fb1c_hq.jpg',
      'https://pm1.narvii.com/5905/1c04748521e3ebfaabcd8c0cd8a1bc2344156d1b_hq.jpg',
      'https://pm1.narvii.com/5905/f87a64c47f11f4063e42dfb8a67db799b67f5478_hq.jpg',
    ];
  }
}

///
///image list
///
class NetImageList1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('NetImageList1 built!');
    return Scaffold(
      appBar: AppBar(title: Text('Thriller')),
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: Data.mockFuture(),
        builder: (_, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, i) => ImageWidget(snapshot.data[i]),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

///
///image widget
///
class ImageWidget extends StatelessWidget {
  final String imageUrl;
  ImageWidget(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockLoading(),
      builder: (_, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () => gotoDetail(context, imageUrl),
              child: Card(
                child: AspectRatio(
                    aspectRatio: 16 / 9, child: Image.network(imageUrl)),
              ),
            ),
          );
        }
        return AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.grey,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ));
      },
    );
  }

  gotoDetail(BuildContext context, String data) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => NetImageDetail(data)));
  }

  Future<String> mockLoading() async {
    await Future.delayed(Duration(milliseconds: 500), () {});
    return imageUrl;
  }
}

///
///detail screen
///
class NetImageDetail extends StatelessWidget {
  final String imageUrl;
  NetImageDetail(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.network(imageUrl)),
    );
  }
}
