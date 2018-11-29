import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Usage_list.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'Usage_imagepage.dart';
import 'Usage_writing.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class usageReview extends StatefulWidget {
  final Record rec;
  usageReview(this.rec);

  _usageReviewState createState() {
    return _usageReviewState();
  }
}

class _usageReviewState extends State<usageReview> {
  BoxFit boxchange;
  double conheight;
  bool favorpro = false;
  bool favorcolor;
  String revewid = 'moon3';
  int favornum;
  TextEditingController comment_controller;

  void initState() {
    // TODO: implement initState
    super.initState();
    boxchange = BoxFit.cover;
    conheight = 300.0;
    favornum = (widget.rec.favorid != null)
        ? widget.rec.favorid.length
        : 0; // 좋아요를 누른 사용자리스트의 숫자를 세어서 토탈 수를 계산함.
    if (widget.rec.favorid == null) {
      favorcolor = false;
    } else if (widget.rec.favorid.contains(revewid)) {
      favorcolor = true;
    } else if (widget.rec.favorid.contains(revewid) == false) {
      favorcolor = false;

      ;
    }
  }

  GestureDragUpdateCallback gestureDragUpdateCallback;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // 리뷰의 등록후 경과시간을 분, 시간, 일, 개월로 구분하여 보여줌
    var posttime = DateTime.now().difference(widget.rec.timestamp);
    String elaptime;
    if (posttime.inHours < 1) {
      elaptime = posttime.inMinutes.toString() + " 분";
    } else if (posttime.inHours < 24) {
      elaptime = posttime.inHours.toString() + " 시간";
    } else if (posttime.inHours >= 24) {
      elaptime = posttime.inDays.toString() + " 일";
    } else if (posttime.inDays >= 30) {
      elaptime = (posttime.inDays % 30).toString() + " 개월";
    }

    return Scaffold(
      body:


      Stack(
        alignment: Alignment(-1.0, -1.0),
        children: <Widget>[
          SafeArea(
            top : true,
            child: Padding(
              padding: const EdgeInsets.only (top : 45.0),
              child: ListView(children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (boxchange == BoxFit.cover) {
                          boxchange = BoxFit.contain;
                          conheight = 600.0;
                        } else {
                          boxchange = BoxFit.cover;
                          conheight = 300.0;
                        }
                      });
                    },
                    onVerticalDragUpdate: (gestureDragUpdateCallback) {
                      setState(() {
                        boxchange = BoxFit.cover;
                        conheight = 300.0;
                      });
                    },
                    // {Navigator.push(context, MaterialPageRoute(builder: (context) => usage_imagepage(widget.rec, 0) ));},
                    child: Container(
                        height: conheight,
                        width: 500.0,
                        child: Swiper(
                            itemBuilder: (context, index) {
                              return FadeInImage.assetNetwork(
                                placeholder: 'Loading_icon.gif',
                                image: widget.rec.photoUrl[index],
                                fit: boxchange,
                              );
                            },
                            indicatorLayout: PageIndicatorLayout.COLOR,
                            outer: true,
                            loop: false,
                            itemCount: 3,
                            pagination: SwiperPagination(
                                alignment: Alignment.bottomCenter,
                                builder: DotSwiperPaginationBuilder(
                                  activeColor: Colors.pink[300],
                                  color: Colors.pink[100],
                                  size: 10.0,
                                  space: 10.0,
                                )),
                            control: new SwiperControl(
                                iconNext: null,
                                iconPrevious: null,
                                color: Colors.pink)))),

                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(
                          
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(
                                 widget.rec.photoUrl[0]),
                               fit :   BoxFit.cover,),
                            borderRadius: BorderRadius.all(Radius.circular(75.0))
                          ),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          widget.rec.userid,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            elaptime +"전",
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: IconButton(
                          icon: Icon(
                              (favorcolor) ? Icons.favorite : Icons.favorite_border,
                              size: 30.0,
                              color: Colors.pinkAccent),
                          onPressed: () {
                            setState(() {
                              //좋아요 클리시 숫자 처리 및 데이타베이스 정보 수정 ( 좋아요 집계와 좋아요 누른 아이디 저장 및 삭제)
                              if (favorcolor) {
                                favorcolor = false;
                                favornum--;
                                //  widget.rec.reference.updateData({'favor_review' : favornum});
                                widget.rec.reference
                                  .updateData({
                                    "favorid": FieldValue.arrayRemove([revewid])
                                  });
                              } else {
                                favorcolor = true;
                                favornum++;
                                //  widget.rec.reference.updateData({'favor_review' : favornum});
                                widget.rec.reference
                                  .updateData({
                                    "favorid": FieldValue.arrayUnion([revewid])
                                  });
                              }
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: Text(
                          favornum.toString(),
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Stack(alignment: Alignment(-1.0, 1.0), children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Row(
                                textBaseline: TextBaseline.ideographic,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Text(
                                      widget.rec.shoptitle,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Text(
                                      "1.5 km",
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                              textBaseline: TextBaseline.ideographic,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0, left: 30.0),
                                  child: Text(
                                    "이 샵의 다른 후기",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 40.0,
                                        color: Colors.black54,
                                      ),
                                      onPressed: () {}),
                                ),
                              ])
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 25.0),
                      child: Text(widget.rec.stylistname,
                          style: TextStyle(fontSize: 14.0), textAlign: TextAlign.start),
                    ),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(right: 25.0, left: 25.0, top: 15.0),
                  child: Text(
                    widget.rec.reviewtext,
                    softWrap: true,
                  ),
                ),
                Divider(),
                SafeArea(
                  bottom: true,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
                          child: TextFormField(
                            controller: comment_controller,
                            decoration: InputDecoration(
                              labelText: '댓글을 입력해주세요',
                            ),
                            textInputAction: TextInputAction.go,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: GestureDetector(child: Text("등록")),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
          Container(
            height: 70.0,
              child: AppBar(
                backgroundColor:   /* Colors.pinkAccent[100].withOpacity(0.5)   Color.fromRGBO(70, 70, 70, 0.5), */  Color.fromRGBO(227, 101, 180, 0.7),
                  leading :   IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () => Navigator.pop(context)),

                      title : Text(
                        "이용후기 상세정보",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    )
                  ),



        ],
      ),
      floatingActionButton: FloatingActionButton(
          highlightElevation: 10.0,
          elevation: 5.0,
          backgroundColor:  Color.fromRGBO(227, 101, 180, 1.0),
          child: Icon(
            Icons.add,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Usagewriting()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
