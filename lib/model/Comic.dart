import 'package:json_annotation/json_annotation.dart';

part 'Comic.g.dart';

@JsonSerializable()
class DsonComic extends Object with _$DsonComicSerializerMixin {
  List<ComicItem> items;

  DsonComic({this.items});
  factory DsonComic.fromJson(Map<String, dynamic> maps) =>
      _$DsonComicFromJson(maps);
}

@JsonSerializable()
class ComicItem extends Object with _$ComicItemSerializerMixin {
  Content content;
  Title title;
  int featured_media;

  ComicItem({this.content});
  factory ComicItem.fromJson(Map<String, dynamic> json) =>
      _$ComicItemFromJson(json);
}

@JsonSerializable()
class Content extends Object with _$ContentSerializerMixin {
  String rendered;

  Content({this.rendered});
  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}

@JsonSerializable()
class Title extends Object with _$TitleSerializerMixin {
  String rendered;

  Title({this.rendered});
  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
}
