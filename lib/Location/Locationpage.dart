import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:beautyshare3/myAppbar.dart';
import 'package:beautyshare3/myBottombar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Location_infor.dart';
import 'Location_list.dart';

CollectionReference ref_loca = Firestore.instance.collection("Beautyshop");

Stream<QuerySnapshot> loca_class (String usageclass) {

  return  ref_loca.where("shop_class",arrayContains : "$usageclass").snapshots();
}

class Locationpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          initialIndex: 0,
          length: 8,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(110.0),
              child: appbarUsage3(),
              // Appbar 불러오기
            ),
            body: TabBarView(children: [
              location_list(ref_loca.snapshots()),
              location_list(loca_class("헤어")),
              location_list(loca_class("네일")),
              location_list(loca_class("스킨")),
              location_list(loca_class("메이크업")),
              location_list(loca_class("속눈썹")),
              location_list(loca_class("왁싱")),
              location_list(loca_class("기타")),


              /* location_list(loca_class("헤어")),
              location_list(loca_class("네일")),
              location_list(loca_class("스킨")),
              location_list(loca_class("메이크업")),
              location_list(loca_class("속눈썹")),
              location_list(loca_class("왁싱")),
              location_list(loca_class("기타")),*/
            ]),
            bottomNavigationBar: myBottombar_location(context),
          ),
        ));
  }
}
