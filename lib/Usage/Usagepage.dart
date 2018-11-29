import 'package:flutter/material.dart';
import 'package:beautyshare3/myAppbar.dart';
import 'package:beautyshare3/myBottombar.dart';
import 'package:beautyshare3/Usage/Usage_writing.dart';
import 'package:beautyshare3/Usage/Usage_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


CollectionReference ref_uage = Firestore.instance.collection("Review");

Stream<QuerySnapshot> usage_class (String usageclass) {

 return  ref_uage.where("serv_class",isEqualTo: "$usageclass").snapshots();

}




class Usagepage extends StatelessWidget {


  Widget build(BuildContext context) {
 // 백버튼 적용

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            initialIndex: 0,
            length: 8,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(110.0),
                child: appbarUsage2(),      // Appbar 불러오기
              ),
              body: TabBarView(children: [
                usage_list(ref_uage.orderBy("serv_class").orderBy("timestamp").snapshots()),
                usage_list(usage_class("헤어")),
                usage_list(usage_class("네일")),
                usage_list(usage_class("스킨")),
                usage_list(usage_class("메이크업")),
                usage_list(usage_class("속눈썹")),
                usage_list(usage_class("왁싱")),
                usage_list(usage_class("기타")),
              ]),
              bottomNavigationBar: myBottombar_usage(context) ,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: FloatingActionButton(
                  highlightElevation: 10.0,
                  elevation: 5.0,
                  backgroundColor: Color.fromRGBO(227, 101, 180, 1.0),
                  child: Icon(
                    Icons.add,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Usagewriting()));}),
            )));
  }
}
