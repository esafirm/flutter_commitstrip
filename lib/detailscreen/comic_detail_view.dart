import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../model/Comic.dart';

class ComicDetailView extends StatelessWidget {
  final ComicItem comicItem;

  ComicDetailView({this.comicItem});

  _showShare() {}

  _doOpenInBrowser() {}

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

    const shareButton = MaterialButton(child: Text("Share"));

    return Scaffold(
        body: Column(
      children: <Widget>[topImage, shareButton],
    ));
  }
}
