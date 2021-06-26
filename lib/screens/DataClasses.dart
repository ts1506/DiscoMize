import 'dart:convert';

// To-Do: Implement for future use - Currently not in use
class Followers {
  String href;
  int total;

  Followers({required this.href, required this.total});

  factory Followers.fromJson(Map<String, dynamic> json) {
    return Followers(href: json['href'], total: json['total']);
  }
}

class ExtUrl {
  String spotify;

  ExtUrl({required this.spotify});

  factory ExtUrl.fromJson(Map<String, dynamic> json) {
    return ExtUrl(spotify: json['spotify']);
  }
}

class Images {
  int height;
  String url;
  int width;

  Images({required this.height, required this.url, required this.width});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
        height: json['height'], url: json['url'], width: json['width']);
  }
}

class Items {
  ExtUrl extUrl;
  Followers followers;
  List<String> genres;
  String href;
  String id;
  Images images;
  String name;
  int popularity;
  String type;
  String uri;

  Items(
      {required this.extUrl,
      required this.followers,
      required this.genres,
      required this.href,
      required this.id,
      required this.images,
      required this.name,
      required this.popularity,
      required this.type,
      required this.uri});

  factory Items.fromJson(Map<String, dynamic> parsedJson) {
    var genresFromJson = parsedJson['genres'];
    List<String> genresList = genresFromJson.cast<String>();

    return Items(
        extUrl: ExtUrl.fromJson(parsedJson['extUrl']),
        followers: Followers.fromJson(parsedJson['followers']),
        genres: genresList,
        href: parsedJson['href'],
        id: parsedJson['id'],
        images: Images.fromJson(parsedJson['images']),
        name: parsedJson['name'],
        popularity: parsedJson['popularity'],
        type: parsedJson['type'],
        uri: parsedJson['uri']);
  }
}

class ArtistData {
  List<Items> items;
  int total;
  int limit;
  int offset;
  String previous;
  String href;
  String next;

  ArtistData(
      {required this.items,
      required this.total,
      required this.limit,
      required this.offset,
      required this.previous,
      required this.href,
      required this.next});

  factory ArtistData.fromJson(Map<String, dynamic> parsedJson) {
    var itemsFromJson = parsedJson['items'];
    List<Items> itemsList = itemsFromJson.cast<Items>();

    return ArtistData(
        items: itemsList,
        total: parsedJson['total'],
        limit: parsedJson['limit'],
        offset: parsedJson['offset'],
        previous: parsedJson['previous'].toString(),
        href: parsedJson['href'],
        next: parsedJson['next']);
  }
}
