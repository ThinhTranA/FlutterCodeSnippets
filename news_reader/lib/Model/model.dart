

class Source{
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  Source({this.id, this.name, this.description, this.url, this.category,
      this.language, this.country});

  factory Source.fromJson(Map<String, dynamic> json)
  {
    return Source(
      id:json['id'],
      name:json['name'],
      description:json['description'],
      url:json['url'],
      category:json['category'],
      language:json['language'],
      country:json['country'],
    );
  }
}


class NewsAPI{
  final String status;
  final List<Source> sources;

  NewsAPI({this.status, this.sources});

  factory NewsAPI.fromJson(Map<String, dynamic> json)
  {
    return NewsAPI(status: json['status'], sources: (json['source'] as List).map((source)=> Source.fromJson(source)).toList());
  }
}
