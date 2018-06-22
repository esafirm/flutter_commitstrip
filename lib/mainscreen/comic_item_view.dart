import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../model/Comic.dart';
import '../model/FeaturedMedia.dart';
import 'comic_item_action.dart';

class ComicItemView extends StatelessWidget {
  final actions = Actions();
  final ComicItem comic;

  ComicItemView(this.comic);

  @override
  Widget build(BuildContext context) {
    final title = comic.title.rendered;
    final assetImage = AssetImage("assets/images/commitstrip_logo_small.png");

    final futureImage = FutureBuilder(
      future: actions.getFeaturedMedia(comic.featured_media),
      builder: (context, snapshot) {
        debugPrint('Get image from future ~ ');

        if (snapshot.connectionState != ConnectionState.done ||
            snapshot.error != null) {
          return DecoratedBox(decoration: BoxDecoration(color: Colors.amber));
        } else {
          final FeaturedMedia media = snapshot.data;
          return CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: media.link,
            placeholder: CircularProgressIndicator(),
          );
        }
      },
    );

    final backImage = SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.amber),
        child: futureImage,
      ),
    );

    final textTheme = Theme.of(context).textTheme;
    final lowerImage = Positioned(
      left: 20.0,
      bottom: 0.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            width: 80.0,
            child: Image(image: assetImage),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 8.0),
            child: Text(
              title,
              style: textTheme.title.apply(color: Colors.white),
            ),
          ),
        ],
      ),
    );

    final bottomForeground = Positioned(
      bottom: 0.0,
      child: Container(
        decoration: BoxDecoration(color: Colors.black87),
        height: 40.0,
        width: 100000.0,
      ),
    );

    return Material(
      child: InkWell(
          onTap: () {
            debugPrint('Inkwell is tapped');
            actions.goToComicDetail(context, comic);
          },
          child: SizedBox(
            height: 160.0,
            child: new Stack(
              children: <Widget>[backImage, bottomForeground, lowerImage],
            ),
          )),
    );
  }
}
