import 'package:flutter/material.dart';
import 'Location_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class shop_service2 extends StatefulWidget {
  final Record_loca shopinfo;
  shop_service2(this.shopinfo);
  _shop_servicestate createState() => _shop_servicestate();


}

class _shop_servicestate extends State<shop_service2> {


  Stream<QuerySnapshot> product_snapshot;

  @override
  List<bool> font;
  List product_list ;
  void initState() {
    var shopid = widget.shopinfo.reference.documentID;

    var doc = Firestore.instance.collection("Product").where("shopid", isEqualTo: shopid);
    //서비스 가격정보중 가장위에 먼저 보여줄 정보를 선택함.
    product_snapshot=doc.where("service_class", isEqualTo: widget.shopinfo.shop_class[0]).snapshots();
    product_list = widget.shopinfo.product_class[widget.shopinfo.shop_class[0]];

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
        .collection("Product").where("shopid", isEqualTo: shopid) ;
    List<product_ref> doc_ref;
    List<Widget> class_list ;



    List<Widget> service_tab = [];

    if (widget.shopinfo.shop_class.length > 1)  // 서비스 종류가 2개 이상일 경우에만 탭을 만들어서 선택하게 해준다
    {
      for (int i = 0; i < widget.shopinfo.shop_class.length; i++) {
        service_tab.add(GestureDetector(
            onTap: () {
              setState(() {
                List<product_ref> doc_ref = [];
                var aa = font.indexOf(true); //폰트가 활성화된 탭을 찾아서
                font[aa] = false; //  폰트 활성화를 취소
                font[i] = true; // 해당 서비스 탭할시 그 탭의  폰트 크기 굵기 활성화
                product_snapshot = productdata.where(
                    "service_class", isEqualTo: widget.shopinfo.shop_class[i]).snapshots(); // 서비스 탭의 상품 Snapshot을 스트림빌더에 전달
                product_list =
                widget.shopinfo.product_class[widget.shopinfo.shop_class[i]];  // 서비스별 상품구분의 순서 배열  ( 헤어를 선택될경우  : 컷, 펌, 드라이, 칼라 )
              });
            },
            child: Text(
              widget.shopinfo.shop_class[i],
              style: TextStyle(
                  fontSize: (font[i]) ? 18.0 : 15.0,
                  fontWeight: (font[i]) ? FontWeight.w800 : FontWeight.normal),
            )));
      }
    }

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: (service_tab==null) ? Text("") : service_tab ,
        ),
        StreamBuilder(
            stream: product_snapshot,  // 서비스 종류에 따른 제품정보 데이타 스냅샷

            builder: (BuildContext context, snapshot) {




              List<Widget> class_list = [];  // 가장 마지막 단계의  화면에서 서비스 종류별 제품명과 가격정보의 리스트들을 저장하는 변수

               List<product_ref> doc_ref=[];
               List <String > title =[];
               List<List <product_ref>> pr_ref=[];
               List<product_ref> prr_ref=[];

              if (!snapshot.hasData)
                return Center(
                    child: Container(
                        width: 100.0,
                        height: 50.0,
                        child: Text("")));

           if(snapshot.hasData) {
             var doc = snapshot.data.documents;

            // product_ref 클래스로 데이타 전체를 변환시킴
             for (int i = 0; i < doc.length; i++) {
               doc_ref.add(product_ref.fromsnapshot(doc[i]));

             }

             // 서비스상품의 구분(헤어: 컷, 펌 등) 별로 데이타를 분류해서 각각의 배열로 저장함.

             for (int i = 0; i < product_list.length; i++) {
               for (int j = 0; j < doc_ref.length; j++) {
                 if (doc_ref[j].pclass == product_list[i]) {
                   prr_ref.add(doc_ref[j]);
                 }
               }
               pr_ref.add(prr_ref); // ( 배열의 배열  )
               prr_ref = List();  // 데이타를 분류해서 저장하고 초기화
             }


             // Extanstin tile로 모든 데이타를 보내서 처리함.

             for (int i = 0; i < pr_ref.length; i++) {
               if (pr_ref[i] != null) {
                 class_list.add(productprice(pr_ref[i], product_list[i]));
               }

           }}


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

class productprice extends StatelessWidget {
  final List<product_ref> doclist;
  final String title;

  productprice(this.doclist, this.title);

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat();


    List<Widget> product_inform = []; // ExpaintionTile의 childeren 입력 변수

    for (int i = 0; i < doclist.length; i++) {
      product_inform.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    width: 100.0,
                    child: Text(
                      doclist[i].name,
                      style:
                      TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Text(
                  f.format(doclist[i].price).toString() + " 원",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                    width: 50.0,
                    child: Text(doclist[i].time.toString() + "분", style: TextStyle(fontSize: 12.0),)
                ),
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


          return ExpansionTile(
            initiallyExpanded: true,
            title: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            children: product_inform,
          );
        }
  }


class product_ref {
  final String name;
  final int price;
  final String explain;
  final int time;
  final String pclass;
  final DocumentReference reference;

  product_ref.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map["product"],
        price = map["price"],
        explain = map["explanation"],
        time = map["time"],
        pclass = map["product_class"];

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