import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/Comic.dart';

class ComicDetailView extends StatelessWidget {
  final ComicItem comicItem;

  ComicDetailView({this.comicItem});

  _showShare() {}

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildAppBar() {
    return new AppBar(
      title: Text(comicItem.title.rendered),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () => _showShare(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final rawUrl = comicItem.content.rendered;
    final finalUrl =
        rawUrl.substring("<p><img src=\"".length, rawUrl.indexOf("jpg\"")) +
            "jpg";

    final topImage = Center(
      child: CachedNetworkImage(
        imageUrl: finalUrl,
        fit: BoxFit.contain,
        placeholder: CircularProgressIndicator(),
      ),
    );

    final openButton = Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: RaisedButton(
        color: Colors.amber,
        child: Text(
          "Open in CommitStrip.com",
          style: TextStyle(color: Colors.black87),
        ),
        onPressed: () => _launchURL(comicItem.link),
      ),
    );

    return Scaffold(
        appBar: _buildAppBar(),
        body: Column(
          children: <Widget>[topImage, openButton],
        ));
  }
}
