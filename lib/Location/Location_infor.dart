import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:async';
import 'package:beautyshare3/Usage/Usage_review.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'Location_list.dart';
import 'Shop_inform.dart';
import 'package:beautyshare3/fancyButton.dart';
import 'Shop_service.dart';
import 'Shop_service2.dart';


CollectionReference stylist_ref= Firestore.instance.collection("Beautyshop");
var beautyshop_in = stylist_ref.snapshots();


class Shopinfor extends StatefulWidget {


  final Record_loca shopreco;
  final Stream<QuerySnapshot> styleshot;
  Shopinfor( this.shopreco, this.styleshot) ;
  _Shopinforstate createState() => _Shopinforstate();
}


class _Shopinforstate extends State <Shopinfor> {
  double fontmenu1;
  double fontmenu2;
  double fontmenu3;

  Color colormenu1 ;
  Color colormenu2 ;
  Color colormenu3 ;

  Widget shop_contents;
  @override
  void initState() {
    // TODO: implement initState

    colormenu1 =  Color.fromRGBO(227, 101, 180, 1.0);

    shop_contents = Shop_inform(widget.shopreco);

    fontmenu1 = 20.0;
    colormenu2 = Colors.black;
    colormenu3  = Colors.black;
    fontmenu2 = 15.0;
    fontmenu3 = 15.0;

    super.initState();
  }


  @override

  Widget build(BuildContext context2) {
    // TODO: implement build


    return
      MaterialApp(
          debugShowCheckedModeBanner: false,

          home :  Scaffold(


              floatingActionButton: Fancybutton2("예약하기",(){}),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              body:


              Stack(
                alignment: Alignment(-1.0, -1.0),
                children: <Widget>[


                  LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints) {

                    return

                      SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(),
                          child: IntrinsicHeight(
                            child: Padding(
                              padding: const EdgeInsets.only (bottom : 100.0),
                              child: Column (
                                children  : [
                                  SafeArea(
                                    child: Stack(
                                      alignment: Alignment(-1.0, -1.0),
                                      children: <Widget>[
                                        Container(
                                            height: 250.0,
                                            child:
                                            Swiper(
                                                itemBuilder: (context, index){

                                                  return  FadeInImage.assetNetwork(placeholder: 'Loading_icon.gif', image: widget.shopreco.photoUrl[index], fit: BoxFit.cover, );
                                                },
                                                indicatorLayout: PageIndicatorLayout.WARM ,

                                                outer: false,
                                                loop: false,
                                                itemCount: widget.shopreco.photoUrl.length,
                                                pagination: SwiperPagination(
                                                    margin: EdgeInsets.only(bottom : 15.0, left: 0.0),
                                                    alignment: Alignment.bottomCenter,
                                                    builder:
                                                    DotSwiperPaginationBuilder(activeColor: Colors.pink[300], color: Colors.pink[100], size: 10.0, space: 7.0,  )),

                                                control:  SwiperControl(iconNext: null, iconPrevious: null, color: Colors.pink))
                                        ),

                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                        height: 70.0,

                                        child: Row(

                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    colormenu1 =  Color.fromRGBO(227, 101, 180, 1.0);
                                                    fontmenu1 = 20.0;
                                                    colormenu2 = Colors.black;
                                                    colormenu3  = Colors.black;
                                                    fontmenu2 = 15.0;
                                                    fontmenu3 = 15.0;
                                                    shop_contents = Shop_inform(widget.shopreco);
                                                  });

                                                },
                                                splashColor: Colors.pinkAccent[100],
                                                borderRadius: BorderRadius.circular(50.0),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    '정보·위치',
                                                    style: TextStyle(fontSize: fontmenu1, color: colormenu1),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    colormenu2 =  Color.fromRGBO(227, 101, 180, 1.0);
                                                    fontmenu2 = 20.0;
                                                    colormenu1 = Colors.black;
                                                    colormenu3  = Colors.black;
                                                    fontmenu1 = 15.0;
                                                    fontmenu3 = 15.0;
                                                    shop_contents = shop_service2(widget.shopreco);

                                                  });

                                                },
                                                splashColor: Colors.pinkAccent[100],
                                                borderRadius: BorderRadius.circular(50.0),

                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    '서비스·가격',
                                                    style: TextStyle(fontSize: fontmenu2, color: colormenu2),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    colormenu3 =  Color.fromRGBO(227, 101, 180, 1.0);
                                                    fontmenu3 = 20.0;
                                                    colormenu2 = Colors.black;
                                                    colormenu1  = Colors.black;
                                                    fontmenu2 = 15.0;
                                                    fontmenu1 = 15.0;
                                                    shop_contents = Shop_inform(widget.shopreco);

                                                  });

                                                },
                                                splashColor: Colors.pinkAccent[100],
                                                borderRadius: BorderRadius.circular(50.0),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    '담당·후기',
                                                    style: TextStyle(fontSize: fontmenu3, color: colormenu3),
                                                  ),
                                                ),
                                              ),
                                            ])),
                                  ),

                                  shop_contents,

                                ],

                              ),
                            ),
                          ),
                        ),
                      );}
                  ),
                   Container(
                     height: 70.0,
                     child: AppBar(
                        backgroundColor: Color.fromRGBO(70, 70, 70, 0.4 ),
                        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 30.0,), onPressed:()=> Navigator.pop(context2)),
                        title: Text("${widget.shopreco.shoptitle} 정보", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                      ),
                   ),


                ],
              )));

  }  }



