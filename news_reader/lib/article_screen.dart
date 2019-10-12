
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_reader/Model/model.dart';

String API_KEY = 'b6897ddeb169416e8c99dd75d12aadec';

Future<List<Article>> fetchArticleBySource(String source) async{
  final response =
    await http.get('https://newsapi.org/v2/top-headlines?sources=${source}&apiKey=${API_KEY}');

  if(response.statusCode == 200) //HTTP OK
      {
    List articles = json.decode(response.body)['articles'];
    return articles.map((article) => new Article.fromJson(article)).toList();
  }else{
    throw Exception('Failed to load article list');
  }

}

class ArticleScreen extends StatefulWidget{
  final Source source;

  ArticleScreen({Key key, @required this.source}): super(key:key);

  @override
  State<StatefulWidget> createState() => ArtilceScreenState();
}

class ArtilceScreenState extends State<ArticleScreen>{
  var list_articles;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState(){
    refreshListArticle();
  }

  void refreshListArticle() async{
    refreshKey.currentState?.show(atTop: false);

    setState(() {
      list_articles = fetchArticleBySource(widget.source.id);
    });

    return null;
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'free news',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(title: Text(widget.source.name),),
        body: Center(),
      ),
    );
  }
}

