import 'package:flutter/material.dart';

import '../api.dart';
import '../model/Comic.dart';
import 'comic_item_view.dart';

class MainScreen extends StatelessWidget {
  Widget _buildContent() {
    return FutureBuilder(
      initialData: [],
      future: Api.fetchList(),
      builder: (context, snapshot) {
        debugPrint('Fetch api!');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          default:
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return _buildList(snapshot.data);
            }
        }
      },
    );
  }

  Widget _buildList(List<ComicItem> contents) => Expanded(
        child: ListView.builder(
          itemCount: contents.length,
          itemBuilder: (context, index) => ComicItemView(contents[index]),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        children: <Widget>[_buildContent()],
      ),
    );
  }
}
