import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:news_reader/Model/model.dart';


String API_KEY = 'b6897ddeb169416e8c99dd75d12aadec';
Future<List<Source>> fetchNewsSource() async{
  final response = await http.get('https://newsapi.org/v2/sources?apiKey=${API_KEY}');

  if(response.statusCode == 200) //HTTP OK
    {
    List sources = json.decode(response.body)['sources'];
    return sources.map((source) => new Source.fromJson(source)).toList();
  }else{
    throw Exception('Failed to load source list');
  }

}

void main() => runApp(new SourceScreen());

class SourceScreen extends StatefulWidget{

  var list_sources;
  var refreshKey = GlobalKey<RefreshIndicatorState> ();

  @override
  State<StatefulWidget> createState() => SourcesScreenState();
}

class SourcesScreenState extends State<SourceScreen>{

  var list_sources;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState(){
    super.initState();
    refreshListSource();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News reader',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(title: Text('Free NEWS'),),
        body: Center(
          child: RefreshIndicator(
            child: FutureBuilder<List<Source>>(
              future: list_sources,
              builder: (context, snapshot){
                if(snapshot.hasError)
                  {
                    Text('Error: ${snapshot.error}');
                  }
                else if(snapshot.hasData)
                  {
                    List<Source> sources = snapshot.data;
                    return new ListView(
                      children: sources.map((sources)=> GestureDetector(
                      onTap: (){
                        // TODO: implement
                      },
                        child: Card(
                          elevation: 1.0,
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                width: 100.0,
                                height: 140.0,
                                child: Image.asset("assets/news.png")
                              ),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                                            child: Text('${sources.name}', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                                          ),
                                        )
                                      ],
                                    ),

                                    Container(
                                      child: Text('${sources.description}', style: TextStyle(color: Color.fromARGB(255, 128, 128, 128), fontSize: 12.0, fontWeight: FontWeight.bold),),
                                    ),

                                    Container(
                                      child: Text('Category: ${sources.category}', style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),),
                                    )

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        )).toList());
                  }
                return CircularProgressIndicator();
              },
            )
            , onRefresh: refreshListSource),
          ),
        ),
      );

  }

  Future<Null> refreshListSource() async {
    refreshKey.currentState?.show(atTop: false);

    setState(() {
      list_sources = fetchNewsSource();
    });

    return null;
  }


}
