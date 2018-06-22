class FeaturedMedia {

  static const SIZE = 'medium_large';

  String link;

  FeaturedMedia.fromJson(Map json) {
    link = json['media_details']['sizes'][SIZE]['source_url'];
  }
}
