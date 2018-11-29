
import 'package:flutter/material.dart';
import 'Location_list.dart';

class  Shop_inform extends StatelessWidget {
  final Record_loca shopinfo;

  Shop_inform(this.shopinfo);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(shopinfo.shoptitle, style: TextStyle(fontSize: 30.0),),
                Padding(
                  padding: const EdgeInsets.only (left : 30.0),
                  child: Text("1.2 km"),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all ( 5.0),
              child: Text(shopinfo.shopintro),
            ),

            Padding(
              padding: const EdgeInsets.only ( top : 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.phone_android),
                      Padding(
                        padding: const EdgeInsets.only(left : 8.0),
                        child: Text(shopinfo.shop_phone),
                      )
                ],
              ),
            ),

            Row(
              children: <Widget>[
                Icon(Icons.timer),
                Padding(
                  padding: const EdgeInsets.only(left : 8.0),
                  child: Text("영업시간  :  11:00 ~ 21:00"),
                ),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.location_on),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 300.0,
                      child: Text(shopinfo.shop_address)),
                )
              ],
            ),


          ],

        ),
      )
    ;
  }
}

