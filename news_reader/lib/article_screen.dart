
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

  Future<Null> refreshListArticle() async{
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
        body: Center(
          child: RefreshIndicator(key: refreshKey,
            child: FutureBuilder<List<Article>>(
              future: list_articles,
              builder: (context, snapshot){
                if(snapshot.hasError)
                  {
                    return Text('${snapshot.error}');
                  } else if(snapshot.hasData){

                  List<Article> articles = snapshot.data;
                  return ListView(
                    children: articles.map((article) => GestureDetector(
                      onTap: (){
                        //TODO: implement later
                      },
                      child: Card(
                        elevation: 1.0,
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
                              width: 100.0,
                              height: 100.0,
                              child: article.urlToImage != null ? Image.network(article.urlToImage): Image.asset('assets/news.png'),

                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 8.0, top: 20.0, bottom: 10.0),
                                          child: Text(
                                            '${article.title}',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight
                                                .bold
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )).toList(),
                  );
                }

                return CircularProgressIndicator();
              },
            ),),
        ),
      ),
    );
  }
}

