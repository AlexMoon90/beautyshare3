import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myAppbar.dart';
import 'myBottombar.dart';

class Promotionpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.0),
          child: appbarUsage4(),
          // Appbar 불러오기
        ),
        bottomNavigationBar: myBottombar_promotion(context),
      ),
    ));
  }
}
