
import 'package:flutter/material.dart';
import 'tabbar.dart';

// 이용후기 앱바 2가지
// appbarUsage1은  이용후기 타이틀이 가운데 오는거
// appbarUsage2  :  이용후기 타이틀이 맨앞부분으로 오는거
// appbarUsage3 :  내주변샵
class appbarUsage1 extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

  return  AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,

      centerTitle: false,


      actions :    [

        Expanded (
            child :
            Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.only(left : 20.0, top: 20.0),
                        child: Text('수지구 보정동',style: TextStyle(fontSize: 12.0,color: Colors.pink,
                            decorationStyle: TextDecorationStyle.dotted, decoration: TextDecoration.underline ))

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right : 85.0, left: 60.0 , top: 15.0),
                    child: Center(
                      child: Text(
                          '이용후기',
                          style: TextStyle(fontSize: 25.0, color: Colors.black, textBaseline: TextBaseline.alphabetic)),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(right : 20.0, top: 10.0),
                    child: IconButton(
                      icon: ImageIcon( AssetImage('filter.png'), color: Colors.pink, ),),
                  ),



                ] )) ],


      bottom: tabbar
    );

  }
}

class appbarUsage2 extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return  AppBar(

      backgroundColor: Colors.white,
      elevation: 8.0,

      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(right : 10.0, left: 0.0 , top: 18.0),
        child: Text(
            '이용후기',
            style: TextStyle(fontSize: 30.0, color: Colors.black, textBaseline: TextBaseline.alphabetic)),
      ),


      actions :    [

        Center(
          child: Padding(
              padding: const EdgeInsets.only( right : 20.0, top: 37.0),
              child: Text('수지구 보정동',style: TextStyle(fontSize: 13.0,color:Color.fromRGBO(227, 101, 180, 1.0),
                  decorationStyle: TextDecorationStyle.dotted, decoration: TextDecoration.underline ))

          ),
        ),



        Padding(
          padding: const EdgeInsets.only(right : 15.0, top: 20.0),
          child:
          Wrap( children : [IconButton(
            icon: ImageIcon( AssetImage('filter.png',), color: Color.fromRGBO(227, 101, 180, 1.0), size : 50.0),)]),
        ) ],


      bottom:
      tabbar
    );

  }
}

class appbarUsage3 extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return  AppBar(
      backgroundColor: Colors.white,
      elevation: 8.0,

      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(right : 10.0, left: 0.0 , top: 18.0),
        child: Text(
            '내주변샵',
            style: TextStyle(fontSize: 30.0, color: Colors.black, textBaseline: TextBaseline.alphabetic)),
      ),


      actions :    [

        Center(
          child: Padding(
              padding: const EdgeInsets.only( right : 20.0, top: 37.0),
              child: Text('수지구 보정동',style: TextStyle(fontSize: 13.0,color: Color.fromRGBO(227, 101, 180, 1.0),
                  decorationStyle: TextDecorationStyle.dotted, decoration: TextDecoration.underline ))

          ),
        ),



        Padding(
          padding: const EdgeInsets.only(right : 15.0, top: 20.0),
          child:
          Wrap( children : [IconButton(
            icon: Icon(Icons.search, size: 30.0, color: Color.fromRGBO(227, 101, 180, 1.0),),),]),
        ) ],


      bottom: tabbar
    );

  }
}

class appbarUsage4 extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return  AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,

        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(right : 10.0, left: 0.0 , top: 18.0),
          child: Text(
              '프로모션',
              style: TextStyle(fontSize: 30.0, color: Colors.black, textBaseline: TextBaseline.alphabetic)),
        ),


        actions :    [

          Center(
            child: Padding(
                padding: const EdgeInsets.only( right : 20.0, top: 37.0),
                child: Text('수지구 보정동',style: TextStyle(fontSize: 13.0,color: Color.fromRGBO(227, 101, 180, 1.0),
                    decorationStyle: TextDecorationStyle.dotted, decoration: TextDecoration.underline ))

            ),
          ),



          Padding(
            padding: const EdgeInsets.only(right : 15.0, top: 20.0),
            child:
            Wrap( children : [IconButton(
              icon: Icon(Icons.search, size: 30.0, color: Color.fromRGBO(227, 101, 180, 1.0),),),]),
          ) ],


        bottom: tabbar_promotion
    );

  }
}