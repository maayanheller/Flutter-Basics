import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './ItemPage.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<ListScreen> {
  Future<String> futureQuote;
  @override
  void initState() {
    super.initState();
    futureQuote = fetchQuotes();
    print(futureQuote);
  }
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("This is a secret page"),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: fetchQuotes(),
            builder: (context, quoteSnap) {
              if (quoteSnap.hasData) {
                List<dynamic> quotes = json.decode(quoteSnap.data);
                return ListView.builder(
                  itemCount: quotes.length,
                  itemBuilder: (context, index) {
                    final quote = quotes[index];
                    return Card(
                      child: ListTile(
                        title: Text(quote["author"]),
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(builder: (ctxt) => new ItemScreen(quote, context)
                              )
                          );
                        }
                      ),
                    );
                  },
                );
              } else if (quoteSnap.hasError) {
                return Text("${quoteSnap.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        )
    );
  }
}

Future<String> fetchQuotes() async{
  final response = await http.get('https://programming-quotes-api.herokuapp.com/quotes');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load quotes');
  }
}
