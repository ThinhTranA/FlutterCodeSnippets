//public class Source
//{
//  public string id { get; set; }
//public string name { get; set; }
//public string description { get; set; }
//public string url { get; set; }
//public string category { get; set; }
//public string language { get; set; }
//public string country { get; set; }
//}
//
//public class RootObject
//{
//  public string status { get; set; }
//public List<Source> sources { get; set; }
//}


class NewsAPI{
  final String status;
  final List<Source> source;

  NewsAPI(this.status, this.source);

  factory NewsAPI.fromJson(Map<String, dynamic> json)
  {
    return NewsAPI(status: json['status']),
    source: (json['source'] as List).map()
  }
}
