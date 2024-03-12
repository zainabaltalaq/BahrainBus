import 'package:flutter/material.dart';
import 'data_list.dart';
import 'land.dart';

void main() => runApp(landmark());

class landmark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const MyHomePage(title: 'Flutter Animation Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _controller =  ScrollController();

  List<DemoCard> get _cards =>
      // ignore: no_leading_underscores_for_local_identifiers
      items.map((Item _item) => DemoCard(_item)).toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: const Color.fromARGB(255, 151, 20, 20),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Center(
                    child: ListView(controller: _controller, children: _cards))
              ])),
    );
  }
}
