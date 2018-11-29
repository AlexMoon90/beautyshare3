import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Main_usage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    CollectionReference ref_uage = Firestore.instance.collection("Review");


    return StreamBuilder(
        stream: ref_uage.snapshots(),
        builder: (context, snapshot)
        {
          if (!snapshot.hasData)
            return Center(child: Container(
                width: 50.0,
                height: 50.0,

                child: CircularProgressIndicator()));

          return ListView.builder(
            itemBuilder: (BuildContext context, index) =>
                usage_card(snapshot.data.documents[index], context),
            itemCount: snapshot.data.documents.length,
            scrollDirection: Axis.horizontal,
          );
        });
  }
}

class usage_card extends StatelessWidget {
  final DocumentSnapshot doc;
  final BuildContext context;

  usage_card(this.doc, this.context);

  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(alignment: Alignment(0.9, 1.0), children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 8.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(doc.data["photoUrl"][0]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "1.5 km",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ]));
  }
}
