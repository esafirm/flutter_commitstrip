import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import '../api.dart';
import '../model/Comic.dart';
import 'comic_item_view.dart';

class MainState {
  List<ComicItem> comics;
  Error error;

  MainState.empty() {
    this.comics = [];
    this.error = null;
  }
  MainState({this.comics, this.error});
}

class MainBloc {
  final state = BehaviorSubject();
  var _currentPage = 0;

  _fetchList([int page = 0]) {
    final MainState lastState = state.value;

    Api.fetchList().then((val) {
      state.add(MainState(comics: val));
    }).catchError((err) {
      state.add(MainState(error: err, comics: lastState.comics));
    });
  }

  fetchFirstPage() {
    _fetchList();
  }

  fetchNextPage() {
    print('Fetching next page...');
    _currentPage += 1;
    _fetchList(_currentPage);
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final _bloc = MainBloc();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _bloc.fetchNextPage();
      }
    });
    _bloc.fetchFirstPage();
  }

  Widget _buildContent() {
    return StreamBuilder(
      stream: _bloc.state,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final MainState state = snapshot.data;
        return _buildList(state.comics);

        if (state.error != null) {}
      },
    );
  }

  Widget _buildList(List<ComicItem> contents) => ListView.builder(
        itemCount: contents.length,
        itemBuilder: (context, index) => ComicItemView(contents[index]),
      );

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
