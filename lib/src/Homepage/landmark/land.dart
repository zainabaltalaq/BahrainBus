import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/link.dart';
import 'data_list.dart';

class DemoCard extends StatelessWidget {
  DemoCard(this.items);
  final Item items;

  // ignore: prefer_const_declarations
  static final Shadow _shadow =
  const Shadow(offset: Offset(2.0, 2.0), color: Colors.black26);
  final TextStyle _style = TextStyle(color: Colors.white70, shadows: [_shadow]);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            SizedBox(
              child: Image.asset(items.image),
            ),
            ListTile(
              title: Text(items.name, style:const TextStyle(fontStyle: FontStyle.italic, fontSize: 20, fontFamily:'hind',)),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(items.description,textAlign: TextAlign.justify, style:const TextStyle(fontStyle: FontStyle.italic, fontSize: 15, fontFamily:'hind',)),
            ),
            ButtonBar(
              children: [
                Link( target:LinkTarget.self, uri: Uri.parse(items.locati),
                 builder:  (context, followLink) => 
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                  backgroundColor: const  Color.fromARGB(255, 205, 192, 192),
                  foregroundColor: Colors.black, // foreground (text) color
                ),
                  onPressed: followLink,
                  child: const Icon(
                  Icons.map,
                  ),
                ),
                ),
              ],
            )
          ],
        ));
  }
}
