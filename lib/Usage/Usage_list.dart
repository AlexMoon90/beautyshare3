import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';
import 'Usage_review.dart';

final CollectionReference reviewCollection = Firestore.instance.collection('Review');




  class usage_list extends StatelessWidget {
    final Stream<QuerySnapshot> doc  ;

    usage_list(this.doc);

    Widget build(BuildContext context
        ) {
      //Widget usage_list (BuildContext context1) {

      return StreamBuilder(
          stream: doc ,
          builder: (context1, snapshot) {
            if (!snapshot.hasData)
              return Center(child: Container(
                  width: 50.0,
                  height: 50.0,

                  child: CircularProgressIndicator()));

            return StaggeredGridView.countBuilder(
              itemCount: snapshot.data.documents.length,
              primary: true,
              crossAxisCount: 4,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: EdgeInsets.only(left : 8.0, right : 8.0),
              itemBuilder: (context, index) =>
                  _Tile(snapshot.data.documents[index], context),
              staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
            );
          });
    }
  }

class _Tile  extends StatelessWidget {
  final DocumentSnapshot data;
  final BuildContext context1;

  _Tile(this.data, this.context1);

  String revewid = 'moon3';


  @override
  Widget build(BuildContext context) {

    // 좋아아 하트모양과 숫자 증감 기능
    var record = Record.fromsnapshot(data);
    bool favorcolor;
    if( record.favorid ==null ) { favorcolor = false; }
    else if (record.favorid.contains(revewid)) {
      favorcolor=true; }
    else if (record.favorid.contains(revewid)==false) {
      favorcolor=false; }

    return  GestureDetector(
      onTap:() {
        Navigator.push(context1, MaterialPageRoute(
            builder: (cotext1) => usageReview(record)));
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        elevation: 0.0,
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
         children: <Widget>[
           new Stack(
             alignment: Alignment(1.0, 1.0),
             children: <Widget>[
               ClipRRect(
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                 child: FadeInImage.assetNetwork(
                   placeholder: 'Loading_icon.gif',
                   image: record.photoUrl[0],
                 fit: BoxFit.cover,),
               ),

               Container(
                 padding: EdgeInsets.only(bottom: 5.0, top : 5.0),
                 decoration: BoxDecoration(color: Color.fromRGBO(70, 70, 70, 0.1),), // Color.fromRGBO(71, 150, 236, 0.2)
                 child :
               Row(
                 children : [

                   Padding(
                   padding: const EdgeInsets.only (left : 5.0),
                   child: Text('1.5 km', style: TextStyle(color: Colors.white, fontSize: 18.0),),
                 ),

                   Expanded(
                     child: Container (
                       child:  Text(''),
                     ),
                   ),



                   Padding(
                 padding: const EdgeInsets.only(left : 0.0),
                 child: Icon((favorcolor)? Icons.favorite : Icons.favorite_border, color:  Color.fromRGBO(227, 101, 180, 1.0), size: 20.0,),
               ),
               Padding(
                 padding: const EdgeInsets.only(left : 7.0, right: 8.0),
                 child: Text( (record.favorid!=null) ?
                   '${record.favorid.length}' : '0',
                   style: const TextStyle( color: Colors.white, fontSize: 20.0),
                 ),
               ),


                 ]),),


             ],
           ),



           Padding(
             padding: const EdgeInsets.only (top: 5.0, left : 8.0, right: 8.0),
             child: Row(
               children: <Widget>[
                 Container(
                   height: 20.0,
                   width: 20.0,
                   decoration: BoxDecoration(
                       image: DecorationImage(image: NetworkImage(
                           record.photoUrl[0]),
                         fit :   BoxFit.cover,),
                       borderRadius: BorderRadius.all(Radius.circular(75.0))
                   ),
                 ),
                 Expanded(child: Padding(
                   padding: const EdgeInsets.only(left :5.0),
                   child: Container(
                        width : 15.0,
                       child: Text(record.userid,  overflow: TextOverflow.ellipsis,)),
                 )),

                 Text(record.serv_class,),
               ],
             ),
           ),



           Padding(
             padding: const EdgeInsets.only(top: 5.0 , left : 8.0, right: 8.0, bottom: 8.0),
             child: Text(record.reviewtext, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10.0),),
           )


         ]),
      ),
    )


     ;
  }
}

class Record {
   final String userid;
   final String shoptitle;
   final String stylistname;
   final List photoUrl;
   final String serv_class;
   final String reviewtext;
   final int favor_review;
   final GeoPoint shop_loca;
   final DateTime timestamp;
   final DocumentReference reference;
   final List favorid;

Record.fromMap(Map <String, dynamic > map, {this.reference}) :
   userid = map["userid"],
      shoptitle = map["shoptitle"] ,
   stylistname= map["stylistname"] ,
   photoUrl= map["photoUrl"] ,
   serv_class =map[ "serv_class"] ,
   reviewtext=map[ "reviewtext"] ,
   favor_review = map [ "favor_review"] ,
   shop_loca = map["shop_loca" ],
   timestamp  = map[ "timestamp"],
    favorid = map ["favorid"];



  Record.fromsnapshot (DocumentSnapshot snapshot)
  : this.fromMap (snapshot.data, reference : snapshot.reference);
}