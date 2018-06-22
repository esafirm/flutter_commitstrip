import 'dart:async';

import 'package:flutter/material.dart';

import '../api.dart';
import '../detailscreen/comic_detail_view.dart';
import '../model/Comic.dart';
import '../model/FeaturedMedia.dart';

class Actions {
  Map<int, FeaturedMedia> _fetchedFeaturedImages = Map();

  Future<FeaturedMedia> getFeaturedMedia(int featuredMediaId) async {
    final cachedResult = _fetchedFeaturedImages[featuredMediaId];
    if (cachedResult != null) {
      return cachedResult;
    }
    final result = await Api.getFeaturedMedia(featuredMediaId);
    _fetchedFeaturedImages.putIfAbsent(featuredMediaId, () => result);
    return result;
  }

  void goToComicDetail(BuildContext context, ComicItem item) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ComicDetailView(
                  comicItem: item,
                )));
  }
}
