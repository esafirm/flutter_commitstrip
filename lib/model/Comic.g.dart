// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Comic.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

DsonComic _$DsonComicFromJson(Map<String, dynamic> json) {
  return new DsonComic(
      items: (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : new ComicItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$DsonComicSerializerMixin {
  List<ComicItem> get items;
  Map<String, dynamic> toJson() => <String, dynamic>{'items': items};
}

ComicItem _$ComicItemFromJson(Map<String, dynamic> json) {
  return new ComicItem(
      content: json['content'] == null
          ? null
          : new Content.fromJson(json['content'] as Map<String, dynamic>))
    ..title = json['title'] == null
        ? null
        : new Title.fromJson(json['title'] as Map<String, dynamic>)
    ..featured_media = json['featured_media'] as int;
}

abstract class _$ComicItemSerializerMixin {
  Content get content;
  Title get title;
  int get featured_media;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'content': content,
        'title': title,
        'featured_media': featured_media
      };
}

Content _$ContentFromJson(Map<String, dynamic> json) {
  return new Content(rendered: json['rendered'] as String);
}

abstract class _$ContentSerializerMixin {
  String get rendered;
  Map<String, dynamic> toJson() => <String, dynamic>{'rendered': rendered};
}

Title _$TitleFromJson(Map<String, dynamic> json) {
  return new Title(rendered: json['rendered'] as String);
}

abstract class _$TitleSerializerMixin {
  String get rendered;
  Map<String, dynamic> toJson() => <String, dynamic>{'rendered': rendered};
}
