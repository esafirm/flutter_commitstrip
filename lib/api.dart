import 'dart:async';
import 'dart:convert';

import 'model/Comic.dart';
import 'model/FeaturedMedia.dart';

import 'package:http/http.dart' as http;

class Api {
  static Future<List<ComicItem>> fetchList() async {
    final response = await http.get(
        'https://www.commitstrip.com/en/wp-json/wp/v2/posts?per_page=5&page=1');

    var list = json.decode(response.body);
    return list.map<ComicItem>((data) => ComicItem.fromJson(data)).toList();
  }

  static Future<List<ComicItem>> fetchDummy() async {
    const rawJson =
        "{\r\n\"id\": 19101,\r\n\"date\": \"2018-05-31T16:10:23\",\r\n\"date_gmt\": \"2018-05-31T14:10:23\",\r\n\"guid\": {\r\n\"rendered\": \"http:\/\/www.commitstrip.com\/?p=19101\"\r\n},\r\n\"modified\": \"2018-05-31T20:00:42\",\r\n\"modified_gmt\": \"2018-05-31T18:00:42\",\r\n\"slug\": \"first-contact\",\r\n\"status\": \"publish\",\r\n\"type\": \"post\",\r\n\"link\": \"https:\/\/www.commitstrip.com\/2018\/05\/31\/first-contact\/\",\r\n\"title\": {\r\n\"rendered\": \"First Contact\"\r\n},\r\n\"content\": {\r\n\"rendered\": \"<p><img src=\\\"https:\/\/www.commitstrip.com\/wp-content\/uploads\/2018\/05\/Strip-CYB-RGPD-english650-final.jpg\\\" alt=\\\"\\\" width=\\\"650\\\" height=\\\"630\\\" class=\\\"alignnone size-full wp-image-19111\\\" \/><\/p>\\n\",\r\n\"protected\": false\r\n},\r\n\"excerpt\": {\r\n\"rendered\": \"\",\r\n\"protected\": false\r\n},\r\n\"author\": 1,\r\n\"featured_media\": 19115,\r\n\"comment_status\": \"closed\",\r\n\"ping_status\": \"closed\",\r\n\"sticky\": false,\r\n\"template\": \"\",\r\n\"format\": \"standard\",\r\n\"meta\": [],\r\n\"categories\": [\r\n1\r\n],\r\n\"tags\": [],\r\n\"_links\": {\r\n\"self\": [\r\n{\r\n\"href\": \"https:\/\/www.commitstrip.com\/wp-json\/wp\/v2\/posts\/19101\"\r\n}\r\n],\r\n\"collection\": [\r\n{\r\n\"href\": \"https:\/\/www.commitstrip.com\/wp-json\/wp\/v2\/posts\"\r\n}\r\n],\r\n\"about\": [\r\n{\r\n\"href\": \"https:\/\/www.commitstrip.com\/wp-json\/wp\/v2\/types\/post\"\r\n}\r\n],\r\n\"author\": [\r\n{\r\n\"embeddable\": true,\r\n\"href\": \"https:\/\/www.commitstrip.com\/wp-json\/wp\/v2\/users\/1\"\r\n}\r\n],\r\n\"replies\": [\r\n{\r\n\"embeddable\": true,\r\n\"href\": \"https:\/\/www.commitstrip.com\/wp-json\/wp\/v2\/comments?post=19101\"\r\n}\r\n],\r\n\"version-history\": [\r\n{\r\n\"href\": \"https:\/\/www.commitstrip.com\/wp-json\/wp\/v2\/posts\/19101\/revisions\"\r\n}\r\n],\r\n\"wp:featuredmedia\": [\r\n{\r\n\"embeddable\": true,\r\n\"href\": \"https:\/\/www.commitstrip.com\/wp-json\/wp\/v2\/media\/19115\"\r\n}\r\n],\r\n\"wp:attachment\": [\r\n{\r\n\"href\": \"https:\/\/www.commitstrip.com\/wp-json\/wp\/v2\/media?parent=19101\"\r\n}\r\n],\r\n\"wp:term\": [\r\n{\r\n\"taxonomy\": \"category\",\r\n\"embeddable\": true,\r\n\"href\": \"https:\/\/www.commitstrip.com\/wp-json\/wp\/v2\/categories?post=19101\"\r\n},\r\n{\r\n\"taxonomy\": \"post_tag\",\r\n\"embeddable\": true,\r\n\"href\": \"https:\/\/www.commitstrip.com\/wp-json\/wp\/v2\/tags?post=19101\"\r\n}\r\n],\r\n\"curies\": [\r\n{\r\n\"name\": \"wp\",\r\n\"href\": \"https:\/\/api.w.org\/{rel}\",\r\n\"templated\": true\r\n}\r\n]\r\n}\r\n}\r\n";
    var jsonString = json.decode(rawJson);

    return [ComicItem.fromJson(jsonString), ComicItem.fromJson(jsonString)];
  }

  static Future<FeaturedMedia> getFeaturedMedia(int featuredMediaId) async {
    final response = await http.get(
        'https://www.commitstrip.com/en/wp-json/wp/v2/media/${featuredMediaId}');
    final jsonString = await json.decode(response.body);

    return FeaturedMedia.fromJson(jsonString);
  }
}
