import 'package:flutter/material.dart';
import './ItemPage.dart';

class ListScreen extends StatelessWidget {
  final items = List<ListItem>.generate(
    1200,
        (i) => i % 1 == 0
        ? MessageItem("Item $i", null)
    : null,
  );
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("This is a secret page"),
      ),
      body: Center(
        child: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (ctxt) => new ItemScreen(items[index], context),
                )
                );
              },
            );
          },
        ),
      )
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Text(sender);

  Widget buildSubtitle(BuildContext context) => Text(body);
}
