/*
* public class Source
{
    public string id { get; set; }
    public string name { get; set; }
}

public class Article
{
    public Source source { get; set; }
    public string author { get; set; }
    public string title { get; set; }
    public string description { get; set; }
    public string url { get; set; }
    public string urlToImage { get; set; }
    public DateTime publishedAt { get; set; }
    public string content { get; set; }
}

public class RootObject
{
    public string status { get; set; }
    public int totalResults { get; set; }
    public List<Article> articles { get; set; }
}
* */

class Article{
   Source source;
   String author;
   String title;
   String description;
   String url;
   String urlToImage;
   String publishedAt;
   String content;

   Article({this.source, this.author, this.title, this.description, this.url,
       this.urlToImage, this.publishedAt, this.content});

   factory Article.fromJson(Map<String, dynamic> json)
   {
     return Article(
         source:Source.fromJsonForArticle(json['source']),
         author: json['author'],
         title: json['title'],
         description: json['description'],
         urlToImage: json['urlToImage'],
         publishedAt: json['publishedAt'],
         content: json['content']

     );
   }

}


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

  factory Source.fromJsonForArticle(Map<String, dynamic> json)
  {
    return Source(
      id:json['id'],
      name:json['name']
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
