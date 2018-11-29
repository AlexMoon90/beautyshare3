import 'package:flutter/material.dart';
import 'package:beautyshare3/Usage/Usagepage.dart';

import 'Mainpage_usege.dart';
import 'package:flutter/cupertino.dart';
import 'package:beautyshare3/Location/Locationpage.dart';
import 'Promotionpage.dart';



class Mainpage extends StatelessWidget {

@override

  Widget build(BuildContext context) {
  return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white,
          backgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: Mainpage2()
  );
}}

class Mainpage2 extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    // TODO: implement build

  return
      Scaffold(

        appBar: AppBar(
          primary: true,

          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: Colors.pinkAccent[100],
              size: 30.0,
            ),
          ),
          centerTitle: true,
          title: Text(
            " BEAUTY SHARE",
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search,
                    size: 30.0, color: Colors.pinkAccent[100]),
                onPressed: null)
          ],
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                child: Image.asset(
                  'main_image.png',
                  height: 150.0,
                  width: 450.0,
                  fit: BoxFit.fill,
                ),
              ),
            Container(
              height: 150.0,
              width: 450.0,
              child: Center(child: Text('''단골샵 예약 및 이용하고 포인트받고
        후기올리고 포인트 또받고''', style: TextStyle(fontSize: 20.0,  color: Colors.white),)),
            ),
            ]
            ),

           Stack(
            children: <Widget>[
              Container(
              child: Image.asset('eyelasj.png',
                  height: 80.0, width: 450.0, fit: BoxFit.fill),
            ),
              Container(
                height: 80.0,
                width: 450.0,
                child: Row(
                  children: <Widget>[
                    Expanded(

                      child: Padding(
                        padding: const EdgeInsets.only(left : 15.0),
                        child: Text('눈썹디자인 시뮬레이션', style: TextStyle(color: Colors.white, fontSize: 18.0, decorationStyle: TextDecorationStyle.dashed, ), ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right : 10.0),
                      child: IconButton(icon: Icon(Icons.chevron_right, size: 50.0,color: Colors.white,)),
                    )
                  ],
                ),
              ),

           ]
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Usagepage()));

                          },
                          splashColor: Colors.pinkAccent[100],
                          borderRadius: BorderRadius.circular(50.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '이용후기',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {Navigator.push(context, CupertinoPageRoute(builder: (context) => Locationpage()));},
                          splashColor: Colors.pinkAccent[100],
                          borderRadius: BorderRadius.circular(50.0),
                          
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '내주변샵',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){Navigator.push(context, CupertinoPageRoute(builder: (context) => Promotionpage()));},
                          splashColor: Colors.pinkAccent[100],
                          borderRadius: BorderRadius.circular(50.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '프로모션',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      ])),
            ),
            AppBar(
              elevation: 2.0,
              title: Text(
                '이용후기',
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: IconButton(
                      icon: Icon(
                    Icons.chevron_right,
                    size: 50.0,
                  )),
                ),
              ],
            ),
            Container(
              height: 250.0,
              child: Main_usage() ),
            AppBar(
              elevation: 2.0,
              title: Text(
                '내주변샵',
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: IconButton(
                      icon: Icon(
                    Icons.chevron_right,
                    size: 50.0,
                  )),
                ),
              ],
            ),
            Container(
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(15.0),
                children: <Widget>[
                  Image.asset('1.jpg'),
                  Image.asset('2.jpg'),
                  Image.asset('3.jpg'),
                  Image.asset('4.jpg'),
                  Image.asset('5.jpg'),
                  Image.asset('6.jpg'),
                  Image.asset('7.jpg'),
                ],
              ),
            )
          ],
        ));
  }
}
