import 'package:flutter/material.dart';
import 'Location_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class shop_service extends StatefulWidget {
  final Record_loca shopinfo;
  shop_service(this.shopinfo);
  _shop_servicestate createState() => _shop_servicestate();



}

class _shop_servicestate extends State<shop_service> {




  Stream<QuerySnapshot> product_snapshot;

  @override
  List<bool> font;
  void initState() {
    var shopid = widget.shopinfo.reference.documentID;
    //서비스 가격정보중 가장위에 먼저 보여줄 정보를 선택함.
    product_snapshot=Firestore.instance.collection("Productinfor").document(shopid).collection("service").document(widget.shopinfo.shop_class[0]).collection("class").snapshots();


    font = [];  // 서비스 탭시 폰트크기랑 굵기 활성화하기 위한 걸로 사용
    for(int i=0; i < widget.shopinfo.shop_class.length; i++ ) {
      font.add(false);
    }
    font[0] =true;

    super.initState();
  }




  Widget build(BuildContext context) {



    var shopid = widget.shopinfo.reference.documentID;
    var productdata = Firestore.instance
        .collection("Productinfor")
        .document(shopid)
        .collection("service");



          List<Widget> service_tab = [];

            for (int i = 0; i < widget.shopinfo.shop_class.length; i++) {

              service_tab.add(GestureDetector(
                  onTap: () {
                       setState(() {

                         var aa = font.indexOf(true); //폰트가 활성화된 탭을 찾아서
                         font[aa]=false;            //  폰트 활성화를 취소
                       font[i]=true;                // 해당 서비스 탭할시 그 탭의  폰트 크기 굵기 활성화
                       product_snapshot = productdata.document(widget.shopinfo.shop_class[i]).collection("class").snapshots();  // 서비스 탭의 상품 Snapshot을 스트림빌더에 전달
                  });
                  },
                  child: Text(
                    widget.shopinfo.shop_class[i],
                    style: TextStyle(
                        fontSize: (font[i])? 18.0 : 15.0, fontWeight: (font[i])? FontWeight.w800 : FontWeight.normal ),
                  )));
            }

          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: service_tab,
              ),
              StreamBuilder(
                  stream: product_snapshot,

                  builder: (BuildContext context, snapshot) {
                    List<Widget> class_list = [];

                    if (!snapshot.hasData)
                      return Center(
                          child: Container(
                              width: 100.0,
                              height: 50.0,
                              child: Text("")));

                    for (int i = 0; i < snapshot.data.documents.length; i++) {
                      class_list.add(productlist(snapshot.data.documents[i]));
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical : 10.0),
                      child: Container(
                        child: Column(children: class_list),
                      ),
                    );
                  }),
            ],
          );

  }
}

class productlist extends StatelessWidget {
  final DocumentSnapshot doc;
  productlist(this.doc);

  @override
  Widget build(BuildContext context) {
    var Doc = doc.reference.collection("product").snapshots();

    return StreamBuilder(
        stream: Doc,
        builder: (BuildContext context, snapshot) {
          var f = NumberFormat();
          List<Widget> product_inform = []; // ExpaintionTile의 childeren 입력 변수

        // ExpantionTile 의 상품 내용을 List로 만드는 공정
          if (snapshot.hasData) {

            for (int i = 0; i < snapshot.data.documents.length; i++) {
              var product_contents =
                  product_ref.fromsnapshot(snapshot.data.documents[i]);

              product_inform.add(Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            product_contents.name,
                            style:
                                TextStyle(color: Colors.black, fontSize: 18.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Text(
                          f.format(product_contents.price).toString() + " 원",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(product_contents.time.toString() + "분"),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(""),
                    )
                  ],
                ),
              ));
            }
          }

          if (!snapshot.hasData)
            return Center(
                child: Container(
                    width: 50.0,
                    height: 50.0,
                    child: Text("")));

          return ExpansionTile(
            initiallyExpanded: true,
            title: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                doc.documentID,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            children: product_inform,
          );
        });
  }
}

class product_ref {
  final String name;
  final int price;
  final String explain;
  final int time;
  final DocumentReference reference;

  product_ref.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map["name"],
        price = map["price"],
        explain = map["explain"],
        time = map["time"];

  product_ref.fromsnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}

class service_ref {
  final String service;
  final DocumentReference reference;

  service_ref.fromMap(Map<String, dynamic> map, {this.reference})
      : service = map["name"];

  service_ref.fromsnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
