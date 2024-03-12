import 'package:flutter/material.dart';

void main() {
  runApp(MyHorizontalSample1());
}

class MyHorizontalSample1 extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Container MyArticles(String imageVal) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 230.0,
      child: Wrap(
        children: [
          Image.asset(imageVal,  fit: BoxFit.fill,),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: [
      MyArticles('images/BH/adv4.jpeg'),
      MyArticles('images/BH/adv5.jpeg'),
      MyArticles('images/BH/adv1.jpeg'),
      MyArticles('images/BH/adv2.jpeg'),
      MyArticles('images/BH/adv3.jpeg'),
      MyArticles('images/BH/adv66.jpeg'),
      MyArticles('images/BH/adv7.jpeg'),
    ]);
  }
}
