import 'package:flutter/material.dart';
import 'package:beautyshare3/Usage/Usagepage.dart';
import 'Mainpage.dart';
import 'Promotionpage.dart';
import 'package:beautyshare3/Location/Locationpage.dart';


Widget myBottombar_usage (BuildContext context1)
{
  Color botoomcolor = Color.fromRGBO(227, 101, 180, 1.0);

return BottomAppBar(
elevation: 8.0,
child: Padding(
padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
mainAxisSize: MainAxisSize.max,
crossAxisAlignment: CrossAxisAlignment.center ,
children: <Widget>[
IconButton(
onPressed: () {Navigator.pop(context1);},
icon: ImageIcon( AssetImage('backbutton.png'), color: botoomcolor, size: 20.0,),

),
IconButton(

  onPressed: () {Navigator.push(context1, MaterialPageRoute(builder: (context1) => Mainpage()));},
  icon: ImageIcon( AssetImage('home.png', ), color: botoomcolor,  ),
),
IconButton(
  onPressed: () {Navigator.push(context1, MaterialPageRoute(builder: (context1) => Locationpage() ));},
  icon: ImageIcon( AssetImage('map.png',), color: botoomcolor, ),),
IconButton(
  onPressed: () {Navigator.push(context1, MaterialPageRoute(builder: (context1) => Promotionpage()));},
  icon: ImageIcon( AssetImage('promotion.png'), color:botoomcolor ),),
IconButton(
  onPressed: () {Navigator.push(context1, MaterialPageRoute(builder: (context1) {} ));},
  icon: ImageIcon( AssetImage('mypage.png'), color:botoomcolor, ),),

],
),
));
}


Widget myBottombar_location (BuildContext context1)
{
  Color botoomcolor = Color.fromRGBO(227, 101, 180, 1.0);

  return BottomAppBar(
      elevation: 8.0,

      child: Padding(
        padding: const EdgeInsets.only(top:5.0, bottom:5.0, right: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              onPressed: () {Navigator.pop(context1);},
              icon: ImageIcon( AssetImage('backbutton.png'), color: botoomcolor, size: 20.0,),

            ),
            IconButton(

              onPressed: () {Navigator.push(context1, MaterialPageRoute(builder: (context1) => Mainpage()));},
              icon: ImageIcon( AssetImage('home.png'), color: botoomcolor, ),

            ),
            IconButton(
              onPressed: () {Navigator.push(context1, MaterialPageRoute(builder: (context1) => Usagepage()));},
              icon: ImageIcon( AssetImage('review.png',), color: botoomcolor ),),
            IconButton(
              onPressed: () {Navigator.push(context1, MaterialPageRoute(builder: (context1) => Promotionpage()));},
              icon: ImageIcon( AssetImage('promotion.png'), color:botoomcolor ),),
            IconButton(
              onPressed: () {Navigator.push(context1, MaterialPageRoute(builder: (context1) => Promotionpage()));},
              icon: ImageIcon( AssetImage('mypage.png'), color:botoomcolor, ),),

          ],
        ),
      ));
}

Widget myBottombar_promotion (BuildContext context1)
{
  Color botoomcolor = Color.fromRGBO(227, 101, 180, 1.0);

  return BottomAppBar(
      elevation: 100.0,
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              onPressed: () {Navigator.pop(context1);},
              icon: ImageIcon( AssetImage('backbutton.png'), color: botoomcolor, size: 20.0,),

            ),
            IconButton(

              onPressed: () {Navigator.push(context1, MaterialPageRoute(builder: (context1) => Mainpage()));},
              icon: ImageIcon( AssetImage('home.png'), color: botoomcolor, ),

            ),
            IconButton(
              onPressed: () {Navigator.push(context1, MaterialPageRoute(builder: (context1) => Usagepage()));},
              icon: ImageIcon( AssetImage('review.png',), color: botoomcolor ),),
            IconButton(
              onPressed: () {Navigator.push(context1, MaterialPageRoute(builder: (context1) => Locationpage()));},
              icon: ImageIcon( AssetImage('map.png'), color:botoomcolor ),),
            IconButton(
              onPressed: () {Navigator.push(context1, MaterialPageRoute(builder: (context1) => Mainpage()));},
              icon: ImageIcon( AssetImage('mypage.png'), color:botoomcolor, ),),

          ],
        ),
      ));
}